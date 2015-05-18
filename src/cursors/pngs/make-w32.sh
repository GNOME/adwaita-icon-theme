#!/bin/sh
# $@ is for the caller to be able to supply arguments to anicursorgen (-s, in particular)
GEN=../anicursorgen.py\ "$@"
for theme in Adwaita Adwaita-Large Adwaita-ExtraLarge
do
  mkdir -p ../../../$theme/cursors
  ${GEN} left_ptr_watch.in ../../../$theme/cursors/left_ptr_watch.ani
#  ${GEN} hand1.in ../../../$theme/cursors/hand1.cur
  ${GEN} hand2.in ../../../$theme/cursors/hand2.cur
  ${GEN} left_ptr.in ../../../$theme/cursors/left_ptr.cur
#  ${GEN} center_ptr.in ../../../$theme/cursors/center_ptr.cur
  ${GEN} xterm.in ../../../$theme/cursors/xterm.cur
  ${GEN} crossed_circle.in ../../../$theme/cursors/crossed_circle.cur
  ${GEN} right_ptr.in ../../../$theme/cursors/right_ptr.cur
  ${GEN} copy.in ../../../$theme/cursors/copy.cur
  ${GEN} move.in ../../../$theme/cursors/move.cur
  ${GEN} pointer-move.in ../../../$theme/cursors/pointer-move.cur
  ${GEN} link.in ../../../$theme/cursors/link.cur
  ${GEN} circle.in ../../../$theme/cursors/circle.cur
  ${GEN} sb_h_double_arrow.in ../../../$theme/cursors/sb_h_double_arrow.cur
  ${GEN} sb_v_double_arrow.in ../../../$theme/cursors/sb_v_double_arrow.cur
  ${GEN} top_left_corner.in ../../../$theme/cursors/top_left_corner.cur
  ${GEN} top_right_corner.in ../../../$theme/cursors/top_right_corner.cur
  ${GEN} bottom_left_corner.in ../../../$theme/cursors/bottom_left_corner.cur
  ${GEN} bottom_right_corner.in ../../../$theme/cursors/bottom_right_corner.cur
  ${GEN} fd_double_arrow.in ../../../$theme/cursors/fd_double_arrow.cur
  ${GEN} bd_double_arrow.in ../../../$theme/cursors/bd_double_arrow.cur
  ${GEN} watch.in ../../../$theme/cursors/watch.ani
  ${GEN} sb_left_arrow.in ../../../$theme/cursors/sb_left_arrow.cur
  ${GEN} sb_right_arrow.in ../../../$theme/cursors/sb_right_arrow.cur
  ${GEN} sb_up_arrow.in ../../../$theme/cursors/sb_up_arrow.cur
  ${GEN} sb_down_arrow.in ../../../$theme/cursors/sb_down_arrow.cur
#  ${GEN} based_arrow_down.in ../../../$theme/cursors/based_arrow_down.cur
#  ${GEN} based_arrow_up.in ../../../$theme/cursors/based_arrow_up.cur
  ${GEN} bottom_side.in ../../../$theme/cursors/bottom_side.cur
  ${GEN} top_side.in ../../../$theme/cursors/top_side.cur
  ${GEN} left_side.in ../../../$theme/cursors/left_side.cur
  ${GEN} right_side.in ../../../$theme/cursors/right_side.cur
  ${GEN} grabbing.in ../../../$theme/cursors/grabbing.cur
  ${GEN} question_arrow.in ../../../$theme/cursors/question_arrow.cur
  ${GEN} top_tee.in ../../../$theme/cursors/top_tee.cur
  ${GEN} bottom_tee.in ../../../$theme/cursors/bottom_tee.cur
  ${GEN} left_tee.in ../../../$theme/cursors/left_tee.cur
  ${GEN} right_tee.in ../../../$theme/cursors/right_tee.cur
  ${GEN} ul_angle.in ../../../$theme/cursors/ul_angle.cur
  ${GEN} ll_angle.in ../../../$theme/cursors/ll_angle.cur
  ${GEN} ur_angle.in ../../../$theme/cursors/ur_angle.cur
  ${GEN} lr_angle.in ../../../$theme/cursors/lr_angle.cur
  ${GEN} X_cursor.in ../../../$theme/cursors/X_cursor.cur
  ${GEN} crosshair.in ../../../$theme/cursors/crosshair.cur
  ${GEN} cross.in ../../../$theme/cursors/cross.cur
  ${GEN} --no-shadows tcross.in ../../../$theme/cursors/tcross.cur
  ${GEN} dotbox.in ../../../$theme/cursors/dotbox.cur
  ${GEN} plus.in ../../../$theme/cursors/plus.cur
  ${GEN} pencil.in ../../../$theme/cursors/pencil.cur
  ${GEN} dnd-none.in ../../../$theme/cursors/dnd-none.cur
  ${GEN} dnd-copy.in ../../../$theme/cursors/dnd-copy.cur
  ${GEN} dnd-link.in ../../../$theme/cursors/dnd-link.cur
  ${GEN} dnd-move.in ../../../$theme/cursors/dnd-move.cur
  ${GEN} dnd-ask.in ../../../$theme/cursors/dnd-ask.cur
  ${GEN} zoom-in.in ../../../$theme/cursors/zoom-in.cur
  ${GEN} zoom-out.in ../../../$theme/cursors/zoom-out.cur
  ${GEN} all-scroll.in ../../../$theme/cursors/all-scroll.cur
  ${GEN} vertical-text.in ../../../$theme/cursors/vertical-text.cur
done
