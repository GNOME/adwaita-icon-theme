#!/usr/bin/env python3

import os
import shutil
import subprocess
from pathlib import Path

cache_dir = Path(os.environ["MESON_INSTALL_PREFIX"]) / "share" / "icons" / "Adwaita"

if not os.environ.get("DESTDIR"):
    icon_prog = shutil.which("gtk4-update-icon-cache") or shutil.which(
        "gtk-update-icon-cache"
    )
    print(f"Updating GTK icon cache with {icon_prog}...")
    subprocess.run([icon_prog, "-qtf", cache_dir], check=True)
    print("Done!")
