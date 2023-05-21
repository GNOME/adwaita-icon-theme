#!/usr/bin/env python3

from pathlib import Path


src_dir = Path(__file__).resolve().parents[1]
adwaita_dir = src_dir / "Adwaita"
for f in adwaita_dir.rglob("*.[sp]*"):
    if f.is_symlink() and ".." not in str(f.readlink()):
        print(f.name, f.relative_to(adwaita_dir).parent, f.readlink())
