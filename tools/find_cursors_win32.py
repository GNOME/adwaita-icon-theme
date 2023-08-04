#!/usr/bin/env python3

from pathlib import Path

src_dir = Path(__file__).resolve().parents[1]
adwaita_dir = src_dir / "Adwaita"
cursors_dir = adwaita_dir / "cursors"
for f in tuple(cursors_dir.glob("*.cur")) + tuple(cursors_dir.glob("*.ani")):
    if not f.is_symlink():
        print(f.relative_to(cursors_dir))
