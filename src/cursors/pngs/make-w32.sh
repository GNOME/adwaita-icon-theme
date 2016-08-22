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
  ${GEN} left_ptr_watch$s.in ../../../$theme/cursors/left_ptr_watch.ani
  ${GEN} hand1$s.in ../../../$theme/cursors/hand1.cur
  ${GEN} hand2$s.in ../../../$theme/cursors/hand2.cur
  ${GEN} left_ptr$s.in ../../../$theme/cursors/left_ptr.cur
#  ${GEN} center_ptr$s.in ../../../$theme/cursors/center_ptr.cur
  ${GEN} xterm$s.in ../../../$theme/cursors/xterm.cur
  ${GEN} crossed_circle$s.in ../../../$theme/cursors/crossed_circle.cur
  ${GEN} right_ptr$s.in ../../../$theme/cursors/right_ptr.cur
  ${GEN} copy$s.in ../../../$theme/cursors/copy.cur
  ${GEN} move$s.in ../../../$theme/cursors/move.cur
  ${GEN} pointer-move$s.in ../../../$theme/cursors/pointer-move.cur
  ${GEN} link$s.in ../../../$theme/cursors/link.cur
  ${GEN} circle$s.in ../../../$theme/cursors/circle.cur
  ${GEN} sb_h_double_arrow$s.in ../../../$theme/cursors/sb_h_double_arrow.cur
  ${GEN} sb_v_double_arrow$s.in ../../../$theme/cursors/sb_v_double_arrow.cur
  ${GEN} top_left_corner$s.in ../../../$theme/cursors/top_left_corner.cur
  ${GEN} top_right_corner$s.in ../../../$theme/cursors/top_right_corner.cur
  ${GEN} bottom_left_corner$s.in ../../../$theme/cursors/bottom_left_corner.cur
  ${GEN} bottom_right_corner$s.in ../../../$theme/cursors/bottom_right_corner.cur
  ${GEN} fd_double_arrow$s.in ../../../$theme/cursors/fd_double_arrow.cur
  ${GEN} bd_double_arrow$s.in ../../../$theme/cursors/bd_double_arrow.cur
  ${GEN} watch$s.in ../../../$theme/cursors/watch.ani
  ${GEN} sb_left_arrow$s.in ../../../$theme/cursors/sb_left_arrow.cur
  ${GEN} sb_right_arrow$s.in ../../../$theme/cursors/sb_right_arrow.cur
  ${GEN} sb_up_arrow$s.in ../../../$theme/cursors/sb_up_arrow.cur
  ${GEN} sb_down_arrow$s.in ../../../$theme/cursors/sb_down_arrow.cur
#  ${GEN} based_arrow_down$s.in ../../../$theme/cursors/based_arrow_down.cur
#  ${GEN} based_arrow_up$s.in ../../../$theme/cursors/based_arrow_up.cur
  ${GEN} bottom_side$s.in ../../../$theme/cursors/bottom_side.cur
  ${GEN} top_side$s.in ../../../$theme/cursors/top_side.cur
  ${GEN} left_side$s.in ../../../$theme/cursors/left_side.cur
  ${GEN} right_side$s.in ../../../$theme/cursors/right_side.cur
  ${GEN} grabbing$s.in ../../../$theme/cursors/grabbing.cur
  ${GEN} question_arrow$s.in ../../../$theme/cursors/question_arrow.cur
  ${GEN} top_tee$s.in ../../../$theme/cursors/top_tee.cur
  ${GEN} bottom_tee$s.in ../../../$theme/cursors/bottom_tee.cur
  ${GEN} left_tee$s.in ../../../$theme/cursors/left_tee.cur
  ${GEN} right_tee$s.in ../../../$theme/cursors/right_tee.cur
  ${GEN} ul_angle$s.in ../../../$theme/cursors/ul_angle.cur
  ${GEN} ll_angle$s.in ../../../$theme/cursors/ll_angle.cur
  ${GEN} ur_angle$s.in ../../../$theme/cursors/ur_angle.cur
  ${GEN} lr_angle$s.in ../../../$theme/cursors/lr_angle.cur
  ${GEN} X_cursor$s.in ../../../$theme/cursors/X_cursor.cur
  ${GEN} crosshair$s.in ../../../$theme/cursors/cell.cur
  ${GEN} cross$s.in ../../../$theme/cursors/cross.cur
  ${GEN} --no-shadows tcross$s.in ../../../$theme/cursors/tcross.cur
  ${GEN} dotbox$s.in ../../../$theme/cursors/dotbox.cur
  ${GEN} plus$s.in ../../../$theme/cursors/plus.cur
  ${GEN} pencil$s.in ../../../$theme/cursors/pencil.cur
  ${GEN} dnd-none$s.in ../../../$theme/cursors/dnd-none.cur
  ${GEN} dnd-copy$s.in ../../../$theme/cursors/dnd-copy.cur
  ${GEN} dnd-link$s.in ../../../$theme/cursors/dnd-link.cur
  ${GEN} dnd-move$s.in ../../../$theme/cursors/dnd-move.cur
  ${GEN} dnd-ask$s.in ../../../$theme/cursors/dnd-ask.cur
  ${GEN} dnd-no-drop$s.in ../../../$theme/cursors/dnd-no-drop.cur
  ${GEN} zoom-in$s.in ../../../$theme/cursors/zoom-in.cur
  ${GEN} zoom-out$s.in ../../../$theme/cursors/zoom-out.cur
  ${GEN} all-scroll$s.in ../../../$theme/cursors/all-scroll.cur
  ${GEN} vertical-text$s.in ../../../$theme/cursors/vertical-text.cur
  ${GEN} context-menu$s.in ../../../$theme/cursors/context-menu.cur
done
