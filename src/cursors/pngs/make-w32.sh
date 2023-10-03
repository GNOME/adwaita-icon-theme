#!/bin/sh
# $@ is for the caller to be able to supply arguments to anicursorgen (-s, in particular)
GEN=../anicursorgen.py\ "$@"
for theme in Adwaita Adwaita-Large Adwaita-ExtraLarge
do
  mkdir -p ../../../$theme/cursors
  if test "x$theme" = "xAdwaita-Large"
  then
    s=.s1
  elif test "x$theme" = "xAdwaita-ExtraLarge"
  then
    s=.s2
  else
    s=
  fi
  ${GEN} default$s.in ../../../$theme/cursors/default.cur
  ${GEN} help$s.in ../../../$theme/cursors/help.cur
  ${GEN} pointer$s.in ../../../$theme/cursors/pointer.cur
  ${GEN} context-menu$s.in ../../../$theme/cursors/context-menu.cur
  ${GEN} progress$s.in ../../../$theme/cursors/progress.ani
  ${GEN} wait$s.in ../../../$theme/cursors/wait.ani
  ${GEN} cell$s.in ../../../$theme/cursors/cell.cur
  ${GEN} crosshair$s.in ../../../$theme/cursors/crosshair.cur
  ${GEN} text$s.in ../../../$theme/cursors/text.cur
  ${GEN} vertical-text$s.in ../../../$theme/cursors/vertical-text.cur
  ${GEN} alias$s.in ../../../$theme/cursors/alias.cur
  ${GEN} copy$s.in ../../../$theme/cursors/copy.cur
  ${GEN} no-drop$s.in ../../../$theme/cursors/no-drop.cur
  ${GEN} move$s.in ../../../$theme/cursors/move.cur
  ${GEN} not-allowed$s.in ../../../$theme/cursors/not-allowed.cur
  ${GEN} grab$s.in ../../../$theme/cursors/grab.cur
  ${GEN} grabbing$s.in ../../../$theme/cursors/grabbing.cur
  ${GEN} all-scroll$s.in ../../../$theme/cursors/all-scroll.cur
  ${GEN} col-resize$s.in ../../../$theme/cursors/col-resize.cur
  ${GEN} row-resize$s.in ../../../$theme/cursors/row-resize.cur
  ${GEN} n-resize$s.in ../../../$theme/cursors/n-resize.cur
  ${GEN} s-resize$s.in ../../../$theme/cursors/s-resize.cur
  ${GEN} e-resize$s.in ../../../$theme/cursors/e-resize.cur
  ${GEN} w-resize$s.in ../../../$theme/cursors/w-resize.cur
  ${GEN} ne-resize$s.in ../../../$theme/cursors/ne-resize.cur
  ${GEN} nw-resize$s.in ../../../$theme/cursors/nw-resize.cur
  ${GEN} sw-resize$s.in ../../../$theme/cursors/sw-resize.cur
  ${GEN} se-resize$s.in ../../../$theme/cursors/se-resize.cur
  ${GEN} ew-resize$s.in ../../../$theme/cursors/ew-resize.cur
  ${GEN} ns-resize$s.in ../../../$theme/cursors/ns-resize.cur
  ${GEN} nesw-resize$s.in ../../../$theme/cursors/nesw-resize.cur
  ${GEN} nwse-resize$s.in ../../../$theme/cursors/nwse-resize.cur
  ${GEN} zoom-in$s.in ../../../$theme/cursors/zoom-in.cur
  ${GEN} zoom-out$s.in ../../../$theme/cursors/zoom-out.cur
done
