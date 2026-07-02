#!/usr/bin/env python3
"""
Extract individual cursor SVGs from the master plate (adwaita.svg)
and generate metadata.json sidecar files for the SVG+JSON cursor format.

Output: src/cursors/cursors_scalable/<name>/{<name>.svg, metadata.json}

Requires: Inkscape 1.0+ (via flatpak or system install)
"""

import csv
import io
import json
import math
import os
import re
import shutil
import subprocess
import sys
import tempfile
from xml.sax import make_parser, saxutils, xmlreader
from xml.sax.handler import ContentHandler, ErrorHandler, feature_namespaces

INKSCAPE_CMD = None
INKSCAPE_FLATPAK = ["flatpak", "run", "--file-forwarding", "org.inkscape.Inkscape"]
INKSCAPE_SYSTEM = ["inkscape"]

SRC_DIR = os.path.dirname(os.path.abspath(__file__))
MASTER_SVG = os.path.join(SRC_DIR, "adwaita.svg")
OUTPUT_DIR = os.path.abspath(os.path.join(SRC_DIR, "..", "..", "Adwaita", "cursors_scalable"))
WORKING_COPY = os.path.join(SRC_DIR, ".extract-working.svg")

CANVAS_SIZE = 32
NOMINAL_SIZE = 24
PADDING = (CANVAS_SIZE - NOMINAL_SIZE) // 2  # 4px

# Hotspot data from cursorgen.py + cross-reference with actual cursor shapes
ANIM_DELAY = 16
CURSORS = {
    "default": (3, 1),
    "grab": (11, 2),
    "pointer": (7, 5),
    "grabbing": (9, 5),
    "text": (11, 12),
    "help": (12, 21),
    "X_cursor": (11, 12),
    "zoom-in": (11, 10),
    "zoom-out": (11, 10),
    "context-menu": (3, 1),
    "copy": (3, 1),
    "alias": (18, 5),
    "no-drop": (3, 1),
    "not-allowed": (12, 12),
    "crosshair": (11, 11),
    "cell": (11, 11),
    "n-resize": (13, 6),
    "s-resize": (13, 18),
    "e-resize": (19, 13),
    "w-resize": (6, 13),
    "ne-resize": (15, 10),
    "se-resize": (15, 15),
    "sw-resize": (10, 15),
    "nw-resize": (10, 10),
    "all-resize": (12, 11),
    "all-scroll": (11, 11),
    "nwse-resize": (11, 11),
    "nesw-resize": (11, 11),
    "ns-resize": (12, 13),
    "ew-resize": (12, 12),
    "row-resize": (12, 13),
    "col-resize": (12, 12),
    "vertical-text": (12, 11),
}

ANIMATED = {
    "progress": {"hotspot": (3, 1), "frames": 60},
    "wait": {"hotspot": (11, 11), "frames": 60},
}


def find_inkscape():
    global INKSCAPE_CMD
    if INKSCAPE_CMD:
        return INKSCAPE_CMD
    for cmd in [INKSCAPE_FLATPAK, INKSCAPE_SYSTEM]:
        try:
            subprocess.run(
                [*cmd, "--version"],
                capture_output=True,
                timeout=30,
            )
            INKSCAPE_CMD = cmd
            print(f"Using Inkscape: {' '.join(cmd)}")
            return cmd
        except (subprocess.SubprocessError, FileNotFoundError):
            continue
    print("Inkscape not found. Install via: flatpak install org.inkscape.Inkscape")
    sys.exit(1)


class SVGSliceFilter(saxutils.XMLFilterBase):
    """Filter the master SVG: strip design aid layers, hide slices layer."""

    STRIP_LABELS = {"-silhouettes", "-logo", "-no-export"}
    HIDE_LABELS = {"slices"}

    def __init__(self, upstream, downstream):
        saxutils.XMLFilterBase.__init__(self, upstream)
        self._downstream = downstream
        self._strip_depth = 0
        self._in_strip = False
        self._hide_depth = 0
        self._in_hide = False

    def startDocument(self):
        self._strip_depth = 0
        self._in_strip = False
        self._hide_depth = 0
        self._in_hide = False

    def startElement(self, name, attrs):
        is_strip = False
        is_hide = False
        if name == "g":
            label = attrs.get("inkscape:label", "")
            groupmode = attrs.get("inkscape:groupmode", "")
            if groupmode == "layer":
                if label in self.STRIP_LABELS:
                    is_strip = True
                elif label in self.HIDE_LABELS:
                    is_hide = True

        if is_strip or self._in_strip:
            self._strip_depth += 1
            self._in_strip = True
            return

        if is_hide or self._in_hide:
            self._hide_depth += 1
            self._in_hide = True
            if is_hide:
                dict_ = {}
                for k, v in attrs.items():
                    if k == "style":
                        v = modify_style(v, "display", "display:none")
                    dict_[k] = v
                attrs = xmlreader.AttributesImpl(dict_)
            self._downstream.startElement(name, attrs)
            return

        self._downstream.startElement(name, attrs)

    def endElement(self, name):
        if self._in_strip:
            self._strip_depth -= 1
            if self._strip_depth <= 0:
                self._strip_depth = 0
                self._in_strip = False
            return
        if self._in_hide:
            self._hide_depth -= 1
            if self._hide_depth <= 0:
                self._hide_depth = 0
                self._in_hide = False
            self._downstream.endElement(name)
            return
        self._downstream.endElement(name)

    def characters(self, content):
        if self._in_strip:
            return
        if self._in_hide:
            self._downstream.characters(content)
            return
        self._downstream.characters(content)


def modify_style(style, old_style, new_style):
    styles = style.split(";")
    new_styles = []
    if old_style is not None:
        match_to = old_style + ":"
    for s in styles:
        if len(s) > 0 and (old_style is None or not s.startswith(match_to)):
            new_styles.append(s)
    if new_style is not None:
        new_styles.append(new_style)
    return ";".join(new_styles)


def filter_master_svg(output_path):
    """Create a filtered working copy with design aid layers stripped."""
    with open(output_path, "wb") as output:
        output_gen = saxutils.XMLGenerator(output)
        parser = make_parser()
        filter_ = SVGSliceFilter(parser, output_gen)
        filter_.setFeature(feature_namespaces, False)
        with open(MASTER_SVG, "rb") as f:
            content = f.read()
        bio = io.BytesIO(content)
        source = saxutils.prepare_input_source(bio)
        filter_.parse(source)


def parse_slice_rects():
    """Parse slice rectangle positions from the master SVG."""
    class RectHandler(ContentHandler):
        def __init__(self):
            self.rects = {}
            self.layer_stack = []
        def startElement(self, name, attrs):
            if name == "g":
                label = attrs.get("inkscape:label", "")
                gm = attrs.get("inkscape:groupmode", "")
                if gm == "layer":
                    self.layer_stack.append(label)
            elif name == "rect":
                if self.layer_stack and self.layer_stack[-1] in ("slices", "spinner frames"):
                    rid = attrs["id"]
                    self.rects[rid] = {
                        "x": float(attrs["x"]),
                        "y": float(attrs["y"]),
                        "w": float(attrs["width"]),
                        "h": float(attrs["height"]),
                    }
        def endElement(self, name):
            if name == "g" and self.layer_stack:
                self.layer_stack.pop()

    parser = make_parser()
    parser.setFeature(feature_namespaces, False)
    handler = RectHandler()
    parser.setContentHandler(handler)
    with open(MASTER_SVG, "rb") as f:
        parser.parse(f)
    return handler.rects


def compose_svg_name(slicename):
    """Map a slice rect name to a logical cursor name + optional frame number."""
    m = re.match(r"^(progress|wait)_(\d+)$", slicename)
    if m:
        return m.group(1), int(m.group(2))
    return slicename, None


def export_svg_via_inkscape(slice_id, working_svg, output_path):
    """Use Inkscape to export a single cursor by slice rectangle ID."""
    cmd = [
        *INKSCAPE_CMD,
        "--export-id", slice_id,
        "--export-plain-svg",
        "--export-filename", output_path,
        working_svg,
    ]
    result = subprocess.run(cmd, capture_output=True, text=True, timeout=120)
    if result.returncode != 0:
        print(f"ERROR exporting {slice_id}: {result.stderr.strip()}")
        return False
    return True


def collect_def_ids(content):
    """Collect all IDs defined in <defs> and all ID references in the SVG."""
    defs = set()
    for m in re.finditer(r'<[^>]*\sid="([^"]+)"', content):
        defs.add(m.group(1))
    refs = set()
    for m in re.finditer(r'url\(#([^)]+)\)', content):
        refs.add(m.group(1))
    return defs, refs


def strip_unused_defs(content):
    """Remove unreferenced elements from <defs>."""
    defs, refs = collect_def_ids(content)

    def _strip_def(match):
        block = match.group(0)
        # Check if this def element's ID is referenced
        id_m = re.search(r'\sid="([^"]+)"', block)
        if id_m and id_m.group(1) not in refs:
            return ""
        return block

    # Process <defs> content, stripping unreferenced elements
    def _process_defs(match):
        defs_content = match.group(1)
        # Remove unreferenced elements inside defs
        def _strip_unref(m):
            return _strip_def(m)
        cleaned = re.sub(
            r'<(filter|linearGradient|radialGradient|inkscape:path-effect)[^>]*>.*?</\1>',
            _strip_unref,
            defs_content,
            flags=re.DOTALL,
        )
        # Remove empty defs
        cleaned = cleaned.strip()
        if not cleaned:
            return ""
        return f"<defs id=\"defs4\">{cleaned}</defs>"

    content = re.sub(
        r'<defs[^>]*>(.*?)</defs>',
        _process_defs,
        content,
        flags=re.DOTALL,
    )
    return content


def strip_invisible_layers(content):
    """Remove groups marked with display:none and their contents."""
    # Remove <g> elements with style containing display:none (from hidden layers)
    # We need to handle nested content
    cleaned = []
    depth = 0
    skip_depth = 0
    i = 0
    while i < len(content):
        if skip_depth > 0:
            if content[i:i+2] == "</" and '>' in content[i:]:
                tag_end = content.index('>', i)
                i = tag_end + 1
                skip_depth -= 1
                continue
            elif content[i] == '<':
                # Could be a self-closing tag or opening tag
                tag_end = content.index('>', i) if '>' in content[i:] else len(content)
                tag = content[i+1:tag_end].split()[0] if content[i+1] != '/' else None
                if tag and content[tag_end-1] == '/':
                    i = tag_end + 1
                    continue
                elif tag:
                    skip_depth += 1
                    i = tag_end + 1
                    continue
            i += 1
            continue

        if content[i:i+2] == "</":
            tag_end = content.index('>', i)
            cleaned.append(content[i:tag_end+1])
            i = tag_end + 1
            continue
        elif content[i] == '<':
            tag_end = content.index('>', i) if '>' in content[i:] else len(content)
            tag_content = content[i:tag_end+1]
            # Check for display:none
            if 'display:none' in tag_content or 'display: none' in tag_content:
                if tag_content.endswith('/>'):
                    i = tag_end + 1
                    continue
                else:
                    skip_depth = 1
                    i = tag_end + 1
                    continue
            cleaned.append(tag_content)
            i = tag_end + 1
        else:
            cleaned.append(content[i])
            i += 1

    return ''.join(cleaned)


def strip_design_aid_elements(content):
    """Remove known design-aid elements by their IDs."""
    aid_ids = {"hotspot", "Hotspot", "slice", "Slice"}
    for aid_id in aid_ids:
        # Remove self-closing tags
        content = re.sub(
            rf'<[^>]*\sid="{aid_id}"[^>]*/>',
            "",
            content,
        )
        # Remove non-self-closing tags by matching the element name
        content = re.sub(
            rf'<([a-zA-Z_][\w.-]*)[^>]*\sid="{aid_id}"[^>]*>.*?</\1>',
            "",
            content,
            flags=re.DOTALL,
        )
    return content


def clean_svg(content):
    """Post-process exported SVG to remove unused defs and invisible elements."""
    content = strip_unused_defs(content)
    content = strip_invisible_layers(content)
    content = strip_design_aid_elements(content)

    # Remove empty <g> tags
    content = re.sub(r'<g\s*/>', '', content)
    content = re.sub(r'<g[^>]*>\s*</g>', '', content)

    # Collapse multiple blank lines
    content = re.sub(r'\n\s*\n', '\n', content)
    return content.strip()


def adjust_svg_canvas(svg_path, hotspot_x, hotspot_y):
    """Post-process exported SVG: 32x32 canvas, viewBox, hotspot marker."""
    with open(svg_path, "r", encoding="utf-8") as f:
        content = f.read()

    # Clean up unused defs and invisible elements
    content = clean_svg(content)

    # Replace width/height with 32
    content = re.sub(
        r'\s(width|height)="\d+(\.\d+)?"',
        lambda m: f' {m.group(1)}="{CANVAS_SIZE}"',
        content,
        count=2,
    )

    # Add viewBox, centered with padding
    if 'viewBox' not in content:
        content = content.replace(
            '<svg',
            f'<svg viewBox="-{PADDING} -{PADDING} {CANVAS_SIZE} {CANVAS_SIZE}"',
            1,
        )

    # Add hotspot marker (hidden 1x1px path)
    hotspot_svg = (
        f'<path id="hotspot" d="M{hotspot_x} {hotspot_y}h1v1h-1z" '
        f'display="none" fill="#333"/>'
    )
    content = content.replace("</svg>", f"  {hotspot_svg}\n</svg>")

    with open(svg_path, "w", encoding="utf-8") as f:
        f.write(content)


def write_metadata_json(cursor_dir, frames):
    """Write metadata.json for a cursor directory."""
    path = os.path.join(cursor_dir, "metadata.json")
    with open(path, "w", encoding="utf-8") as f:
        json.dump(frames, f, indent=4)
        f.write("\n")


def process_static(cursor_name, rect, hotspot):
    """Process a single static cursor."""
    cursor_dir = os.path.join(OUTPUT_DIR, cursor_name)
    os.makedirs(cursor_dir, exist_ok=True)

    svg_name = f"{cursor_name}.svg"
    svg_path = os.path.join(cursor_dir, svg_name)

    print(f"  Exporting {cursor_name}...", end=" ", flush=True)
    if export_svg_via_inkscape(cursor_name, WORKING_COPY, svg_path):
        adjust_svg_canvas(svg_path, hotspot[0], hotspot[1])
        write_metadata_json(cursor_dir, [{
            "filename": svg_name,
            "hotspot_x": hotspot[0],
            "hotspot_y": hotspot[1],
            "nominal_size": NOMINAL_SIZE,
        }])
        print("OK")
    else:
        print("FAILED")


def process_animated(cursor_name, hotspot, frame_count):
    """Process an animated cursor with N frames."""
    cursor_dir = os.path.join(OUTPUT_DIR, cursor_name)
    os.makedirs(cursor_dir, exist_ok=True)

    frames_meta = []
    for frame_num in range(1, frame_count + 1):
        slice_id = f"{cursor_name}_{frame_num:04d}"
        svg_name = f"{cursor_name}-{frame_num:02d}.svg"
        svg_path = os.path.join(cursor_dir, svg_name)

        print(f"  Exporting {cursor_name} frame {frame_num}/{frame_count}...", end=" ", flush=True)
        if export_svg_via_inkscape(slice_id, WORKING_COPY, svg_path):
            adjust_svg_canvas(svg_path, hotspot[0], hotspot[1])
            frames_meta.append({
                "filename": svg_name,
                "delay": ANIM_DELAY,
                "hotspot_x": hotspot[0],
                "hotspot_y": hotspot[1],
                "nominal_size": NOMINAL_SIZE,
            })
            print("OK")
        else:
            print("FAILED")

    if frames_meta:
        write_metadata_json(cursor_dir, frames_meta)


def cleanup():
    if os.path.exists(WORKING_COPY):
        os.remove(WORKING_COPY)


def parse_args():
    import argparse
    parser = argparse.ArgumentParser(
        description="Extract individual cursors from the master SVG plate",
    )
    parser.add_argument(
        "--inkscape",
        default=None,
        help="Path or command for Inkscape (default: auto-detect flatpak or system)",
    )
    parser.add_argument(
        "-o", "--output",
        default=OUTPUT_DIR,
        help=f"Output directory (default: {OUTPUT_DIR})",
    )
    parser.add_argument(
        "--check",
        action="store_true",
        help="Only check the master SVG structure, don't export",
    )
    return parser.parse_args()


def main():
    args = parse_args()
    global OUTPUT_DIR, INKSCAPE_CMD
    OUTPUT_DIR = args.output

    if args.check:
        print("Checking master SVG structure...")
        rects = parse_slice_rects()
        print(f"  Found {len(rects)} slice rects")
        static = [n for n in CURSORS]
        animated = list(ANIMATED.keys())
        all_cursors = set(static + animated)
        found = set()
        for rid in rects:
            name, _ = compose_svg_name(rid)
            found.add(name)
        missing = all_cursors - found
        extra = found - all_cursors
        if missing:
            print(f"  WARNING: cursors with no slice rect: {sorted(missing)}")
        if extra:
            print(f"  NOTE: extra slice rects (design aids): {sorted(extra)}")
        print(f"  Total cursors to extract: {len(all_cursors)}")
        return

    find_inkscape()

    print("Parsing slice rectangles from master SVG...")
    rects = parse_slice_rects()
    print(f"  Found {len(rects)} slice rects")

    print("Filtering master SVG (hiding design aid layers)...")
    filter_master_svg(WORKING_COPY)

    os.makedirs(OUTPUT_DIR, exist_ok=True)

    # Group rectangles by logical cursor name
    cursor_rects = {}
    for rect_id, rect in rects.items():
        cursor_name, frame_num = compose_svg_name(rect_id)
        if cursor_name not in cursor_rects:
            cursor_rects[cursor_name] = []
        cursor_rects[cursor_name].append((rect_id, rect, frame_num))

    print(f"\nProcessing {len(cursor_rects)} cursors...\n")

    for cursor_name in sorted(cursor_rects.keys()):
        if cursor_name in ANIMATED:
            info = ANIMATED[cursor_name]
            print(f"[animated] {cursor_name} ({info['frames']} frames)")
            process_animated(cursor_name, info["hotspot"], info["frames"])
        elif cursor_name in CURSORS:
            hotspot = CURSORS[cursor_name]
            print(f"[static] {cursor_name}")
            rect = rects.get(cursor_name)
            if rect:
                process_static(cursor_name, rect, hotspot)
            else:
                print(f"  WARNING: no slice rect for {cursor_name}")
        else:
            print(f"  WARNING: unknown cursor {cursor_name}, skipping")

    cleanup()
    print(f"\nDone! Output in: {OUTPUT_DIR}")


if __name__ == "__main__":
    main()
