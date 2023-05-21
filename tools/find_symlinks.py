#!/usr/bin/env python3

from pathlib import Path


src_dir = Path(__file__).resolve().parents[1]
adwaita_dir = src_dir / "Adwaita"
for f in adwaita_dir.rglob("*.svg") or adwaita_dir.rglob("*.png"):
    if f.is_symlink():
        print(f.name, f.relative_to(adwaita_dir).parent, f.readlink())
