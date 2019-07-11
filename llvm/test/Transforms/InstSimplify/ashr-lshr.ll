; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -instsimplify -S | FileCheck %s

define i32 @ashr_lshr(i32 %x, i32 %y) {
; CHECK-LABEL: @ashr_lshr(
; CHECK-NEXT:    [[CMP:%.*]] = icmp sgt i32 [[X:%.*]], -1
; CHECK-NEXT:    [[L:%.*]] = lshr i32 [[X]], [[Y:%.*]]
; CHECK-NEXT:    [[R:%.*]] = ashr i32 [[X]], [[Y]]
; CHECK-NEXT:    [[RET:%.*]] = select i1 [[CMP]], i32 [[L]], i32 [[R]]
; CHECK-NEXT:    ret i32 [[RET]]
;
  %cmp = icmp sgt i32 %x, -1
  %l = lshr i32 %x, %y
  %r = ashr i32 %x, %y
  %ret = select i1 %cmp, i32 %l, i32 %r
  ret i32 %ret
}

define i32 @ashr_lshr2(i32 %x, i32 %y) {
; CHECK-LABEL: @ashr_lshr2(
; CHECK-NEXT:    [[CMP:%.*]] = icmp sgt i32 [[X:%.*]], 8
; CHECK-NEXT:    [[L:%.*]] = lshr i32 [[X]], [[Y:%.*]]
; CHECK-NEXT:    [[R:%.*]] = ashr i32 [[X]], [[Y]]
; CHECK-NEXT:    [[RET:%.*]] = select i1 [[CMP]], i32 [[L]], i32 [[R]]
; CHECK-NEXT:    ret i32 [[RET]]
;
  %cmp = icmp sgt i32 %x, 8
  %l = lshr i32 %x, %y
  %r = ashr i32 %x, %y
  %ret = select i1 %cmp, i32 %l, i32 %r
  ret i32 %ret
}

define i32 @ashr_lshr_exact_both(i32 %x, i32 %y) {
; CHECK-LABEL: @ashr_lshr_exact_both(
; CHECK-NEXT:    [[CMP:%.*]] = icmp sgt i32 [[X:%.*]], -1
; CHECK-NEXT:    [[L:%.*]] = lshr exact i32 [[X]], [[Y:%.*]]
; CHECK-NEXT:    [[R:%.*]] = ashr exact i32 [[X]], [[Y]]
; CHECK-NEXT:    [[RET:%.*]] = select i1 [[CMP]], i32 [[L]], i32 [[R]]
; CHECK-NEXT:    ret i32 [[RET]]
;
  %cmp = icmp sgt i32 %x, -1
  %l = lshr exact i32 %x, %y
  %r = ashr exact i32 %x, %y
  %ret = select i1 %cmp, i32 %l, i32 %r
  ret i32 %ret
}

define i32 @ashr_lshr_exact_lshr_only(i32 %x, i32 %y) {
; CHECK-LABEL: @ashr_lshr_exact_lshr_only(
; CHECK-NEXT:    [[CMP:%.*]] = icmp sgt i32 [[X:%.*]], -1
; CHECK-NEXT:    [[L:%.*]] = lshr exact i32 [[X]], [[Y:%.*]]
; CHECK-NEXT:    [[R:%.*]] = ashr i32 [[X]], [[Y]]
; CHECK-NEXT:    [[RET:%.*]] = select i1 [[CMP]], i32 [[L]], i32 [[R]]
; CHECK-NEXT:    ret i32 [[RET]]
;
  %cmp = icmp sgt i32 %x, -1
  %l = lshr exact i32 %x, %y
  %r = ashr i32 %x, %y
  %ret = select i1 %cmp, i32 %l, i32 %r
  ret i32 %ret
}

define <2 x i32> @ashr_lshr_vec(<2 x i32> %x, <2 x i32> %y) {
; CHECK-LABEL: @ashr_lshr_vec(
; CHECK-NEXT:    [[CMP:%.*]] = icmp sgt <2 x i32> [[X:%.*]], <i32 -1, i32 -1>
; CHECK-NEXT:    [[L:%.*]] = lshr <2 x i32> [[X]], [[Y:%.*]]
; CHECK-NEXT:    [[R:%.*]] = ashr <2 x i32> [[X]], [[Y]]
; CHECK-NEXT:    [[RET:%.*]] = select <2 x i1> [[CMP]], <2 x i32> [[L]], <2 x i32> [[R]]
; CHECK-NEXT:    ret <2 x i32> [[RET]]
;
  %cmp = icmp sgt <2 x i32> %x, <i32 -1, i32 -1>
  %l = lshr <2 x i32> %x, %y
  %r = ashr <2 x i32> %x, %y
  %ret = select <2 x i1> %cmp, <2 x i32> %l, <2 x i32> %r
  ret <2 x i32> %ret
}

define <2 x i32> @ashr_lshr_vec2(<2 x i32> %x, <2 x i32> %y) {
; CHECK-LABEL: @ashr_lshr_vec2(
; CHECK-NEXT:    [[CMP:%.*]] = icmp sgt <2 x i32> [[X:%.*]], <i32 -1, i32 -1>
; CHECK-NEXT:    [[L:%.*]] = lshr exact <2 x i32> [[X]], [[Y:%.*]]
; CHECK-NEXT:    [[R:%.*]] = ashr exact <2 x i32> [[X]], [[Y]]
; CHECK-NEXT:    [[RET:%.*]] = select <2 x i1> [[CMP]], <2 x i32> [[L]], <2 x i32> [[R]]
; CHECK-NEXT:    ret <2 x i32> [[RET]]
;
  %cmp = icmp sgt <2 x i32> %x, <i32 -1, i32 -1>
  %l = lshr exact <2 x i32> %x, %y
  %r = ashr exact <2 x i32> %x, %y
  %ret = select <2 x i1> %cmp, <2 x i32> %l, <2 x i32> %r
  ret <2 x i32> %ret
}

define <2 x i32> @ashr_lshr_vec3(<2 x i32> %x, <2 x i32> %y) {
; CHECK-LABEL: @ashr_lshr_vec3(
; CHECK-NEXT:    [[CMP:%.*]] = icmp sgt <2 x i32> [[X:%.*]], <i32 -1, i32 -1>
; CHECK-NEXT:    [[L:%.*]] = lshr exact <2 x i32> [[X]], [[Y:%.*]]
; CHECK-NEXT:    [[R:%.*]] = ashr <2 x i32> [[X]], [[Y]]
; CHECK-NEXT:    [[RET:%.*]] = select <2 x i1> [[CMP]], <2 x i32> [[L]], <2 x i32> [[R]]
; CHECK-NEXT:    ret <2 x i32> [[RET]]
;
  %cmp = icmp sgt <2 x i32> %x, <i32 -1, i32 -1>
  %l = lshr exact <2 x i32> %x, %y
  %r = ashr <2 x i32> %x, %y
  %ret = select <2 x i1> %cmp, <2 x i32> %l, <2 x i32> %r
  ret <2 x i32> %ret
}

define i32 @ashr_lshr_inv(i32 %x, i32 %y) {
; CHECK-LABEL: @ashr_lshr_inv(
; CHECK-NEXT:    [[CMP:%.*]] = icmp slt i32 [[X:%.*]], 1
; CHECK-NEXT:    [[L:%.*]] = lshr i32 [[X]], [[Y:%.*]]
; CHECK-NEXT:    [[R:%.*]] = ashr i32 [[X]], [[Y]]
; CHECK-NEXT:    [[RET:%.*]] = select i1 [[CMP]], i32 [[R]], i32 [[L]]
; CHECK-NEXT:    ret i32 [[RET]]
;
  %cmp = icmp slt i32 %x, 1
  %l = lshr i32 %x, %y
  %r = ashr i32 %x, %y
  %ret = select i1 %cmp, i32 %r, i32 %l
  ret i32 %ret
}

define i32 @ashr_lshr_inv2(i32 %x, i32 %y) {
; CHECK-LABEL: @ashr_lshr_inv2(
; CHECK-NEXT:    [[CMP:%.*]] = icmp slt i32 [[X:%.*]], 5
; CHECK-NEXT:    [[L:%.*]] = lshr i32 [[X]], [[Y:%.*]]
; CHECK-NEXT:    [[R:%.*]] = ashr i32 [[X]], [[Y]]
; CHECK-NEXT:    [[RET:%.*]] = select i1 [[CMP]], i32 [[R]], i32 [[L]]
; CHECK-NEXT:    ret i32 [[RET]]
;
  %cmp = icmp slt i32 %x, 5
  %l = lshr i32 %x, %y
  %r = ashr i32 %x, %y
  %ret = select i1 %cmp, i32 %r, i32 %l
  ret i32 %ret
}

define <2 x i32> @ashr_lshr_inv_vec(<2 x i32> %x, <2 x i32> %y) {
; CHECK-LABEL: @ashr_lshr_inv_vec(
; CHECK-NEXT:    [[CMP:%.*]] = icmp slt <2 x i32> [[X:%.*]], <i32 1, i32 1>
; CHECK-NEXT:    [[L:%.*]] = lshr <2 x i32> [[X]], [[Y:%.*]]
; CHECK-NEXT:    [[R:%.*]] = ashr <2 x i32> [[X]], [[Y]]
; CHECK-NEXT:    [[RET:%.*]] = select <2 x i1> [[CMP]], <2 x i32> [[R]], <2 x i32> [[L]]
; CHECK-NEXT:    ret <2 x i32> [[RET]]
;
  %cmp = icmp slt <2 x i32> %x, <i32 1, i32 1>
  %l = lshr <2 x i32> %x, %y
  %r = ashr <2 x i32> %x, %y
  %ret = select <2 x i1> %cmp, <2 x i32> %r, <2 x i32> %l
  ret <2 x i32> %ret
}

; Negative tests

define i32 @ashr_lshr_wrong_cst(i32 %x, i32 %y) {
; CHECK-LABEL: @ashr_lshr_wrong_cst(
; CHECK-NEXT:    [[CMP:%.*]] = icmp sgt i32 [[X:%.*]], -2
; CHECK-NEXT:    [[L:%.*]] = lshr i32 [[X]], [[Y:%.*]]
; CHECK-NEXT:    [[R:%.*]] = ashr exact i32 [[X]], [[Y]]
; CHECK-NEXT:    [[RET:%.*]] = select i1 [[CMP]], i32 [[L]], i32 [[R]]
; CHECK-NEXT:    ret i32 [[RET]]
;
  %cmp = icmp sgt i32 %x, -2
  %l = lshr i32 %x, %y
  %r = ashr exact i32 %x, %y
  %ret = select i1 %cmp, i32 %l, i32 %r
  ret i32 %ret
}

define i32 @ashr_lshr_wrong_cst2(i32 %x, i32 %y) {
; CHECK-LABEL: @ashr_lshr_wrong_cst2(
; CHECK-NEXT:    [[CMP:%.*]] = icmp slt i32 [[X:%.*]], -1
; CHECK-NEXT:    [[L:%.*]] = lshr exact i32 [[X]], [[Y:%.*]]
; CHECK-NEXT:    [[R:%.*]] = ashr exact i32 [[X]], [[Y]]
; CHECK-NEXT:    [[RET:%.*]] = select i1 [[CMP]], i32 [[R]], i32 [[L]]
; CHECK-NEXT:    ret i32 [[RET]]
;
  %cmp = icmp slt i32 %x, -1
  %l = lshr exact i32 %x, %y
  %r = ashr exact i32 %x, %y
  %ret = select i1 %cmp, i32 %r, i32 %l
  ret i32 %ret
}

define i32 @ashr_lshr_wrong(i32 %x, i32 %y) {
; CHECK-LABEL: @ashr_lshr_wrong(
; CHECK-NEXT:    [[CMP:%.*]] = icmp sge i32 [[X:%.*]], -1
; CHECK-NEXT:    [[L:%.*]] = lshr i32 [[X]], [[Y:%.*]]
; CHECK-NEXT:    [[R:%.*]] = ashr i32 [[X]], [[Y]]
; CHECK-NEXT:    [[RET:%.*]] = select i1 [[CMP]], i32 [[L]], i32 [[R]]
; CHECK-NEXT:    ret i32 [[RET]]
;
  %cmp = icmp sge i32 %x, -1
  %l = lshr i32 %x, %y
  %r = ashr i32 %x, %y
  %ret = select i1 %cmp, i32 %l, i32 %r
  ret i32 %ret
}

define i32 @ashr_lshr_shift_wrong_pred(i32 %x, i32 %y, i32 %z) {
; CHECK-LABEL: @ashr_lshr_shift_wrong_pred(
; CHECK-NEXT:    [[CMP:%.*]] = icmp sle i32 [[X:%.*]], 0
; CHECK-NEXT:    [[L:%.*]] = lshr i32 [[X]], [[Y:%.*]]
; CHECK-NEXT:    [[R:%.*]] = ashr i32 [[X]], [[Y]]
; CHECK-NEXT:    [[RET:%.*]] = select i1 [[CMP]], i32 [[L]], i32 [[R]]
; CHECK-NEXT:    ret i32 [[RET]]
;
  %cmp = icmp sle i32 %x, 0
  %l = lshr i32 %x, %y
  %r = ashr i32 %x, %y
  %ret = select i1 %cmp, i32 %l, i32 %r
  ret i32 %ret
}

define i32 @ashr_lshr_shift_wrong_pred2(i32 %x, i32 %y, i32 %z) {
; CHECK-LABEL: @ashr_lshr_shift_wrong_pred2(
; CHECK-NEXT:    [[CMP:%.*]] = icmp sge i32 [[Z:%.*]], 0
; CHECK-NEXT:    [[L:%.*]] = lshr i32 [[X:%.*]], [[Y:%.*]]
; CHECK-NEXT:    [[R:%.*]] = ashr i32 [[X]], [[Y]]
; CHECK-NEXT:    [[RET:%.*]] = select i1 [[CMP]], i32 [[L]], i32 [[R]]
; CHECK-NEXT:    ret i32 [[RET]]
;
  %cmp = icmp sge i32 %z, 0
  %l = lshr i32 %x, %y
  %r = ashr i32 %x, %y
  %ret = select i1 %cmp, i32 %l, i32 %r
  ret i32 %ret
}

define i32 @ashr_lshr_wrong_operands(i32 %x, i32 %y) {
; CHECK-LABEL: @ashr_lshr_wrong_operands(
; CHECK-NEXT:    [[CMP:%.*]] = icmp sge i32 [[X:%.*]], 0
; CHECK-NEXT:    [[L:%.*]] = lshr i32 [[X]], [[Y:%.*]]
; CHECK-NEXT:    [[R:%.*]] = ashr i32 [[X]], [[Y]]
; CHECK-NEXT:    [[RET:%.*]] = select i1 [[CMP]], i32 [[R]], i32 [[L]]
; CHECK-NEXT:    ret i32 [[RET]]
;
  %cmp = icmp sge i32 %x, 0
  %l = lshr i32 %x, %y
  %r = ashr i32 %x, %y
  %ret = select i1 %cmp, i32 %r, i32 %l
  ret i32 %ret
}

define i32 @ashr_lshr_no_ashr(i32 %x, i32 %y) {
; CHECK-LABEL: @ashr_lshr_no_ashr(
; CHECK-NEXT:    [[CMP:%.*]] = icmp sge i32 [[X:%.*]], 0
; CHECK-NEXT:    [[L:%.*]] = lshr i32 [[X]], [[Y:%.*]]
; CHECK-NEXT:    [[R:%.*]] = xor i32 [[X]], [[Y]]
; CHECK-NEXT:    [[RET:%.*]] = select i1 [[CMP]], i32 [[L]], i32 [[R]]
; CHECK-NEXT:    ret i32 [[RET]]
;
  %cmp = icmp sge i32 %x, 0
  %l = lshr i32 %x, %y
  %r = xor i32 %x, %y
  %ret = select i1 %cmp, i32 %l, i32 %r
  ret i32 %ret
}

define i32 @ashr_lshr_shift_amt_mismatch(i32 %x, i32 %y, i32 %z) {
; CHECK-LABEL: @ashr_lshr_shift_amt_mismatch(
; CHECK-NEXT:    [[CMP:%.*]] = icmp sge i32 [[X:%.*]], 0
; CHECK-NEXT:    [[L:%.*]] = lshr i32 [[X]], [[Y:%.*]]
; CHECK-NEXT:    [[R:%.*]] = ashr i32 [[X]], [[Z:%.*]]
; CHECK-NEXT:    [[RET:%.*]] = select i1 [[CMP]], i32 [[L]], i32 [[R]]
; CHECK-NEXT:    ret i32 [[RET]]
;
  %cmp = icmp sge i32 %x, 0
  %l = lshr i32 %x, %y
  %r = ashr i32 %x, %z
  %ret = select i1 %cmp, i32 %l, i32 %r
  ret i32 %ret
}

define i32 @ashr_lshr_shift_base_mismatch(i32 %x, i32 %y, i32 %z) {
; CHECK-LABEL: @ashr_lshr_shift_base_mismatch(
; CHECK-NEXT:    [[CMP:%.*]] = icmp sge i32 [[X:%.*]], 0
; CHECK-NEXT:    [[L:%.*]] = lshr i32 [[X]], [[Y:%.*]]
; CHECK-NEXT:    [[R:%.*]] = ashr i32 [[Z:%.*]], [[Y]]
; CHECK-NEXT:    [[RET:%.*]] = select i1 [[CMP]], i32 [[L]], i32 [[R]]
; CHECK-NEXT:    ret i32 [[RET]]
;
  %cmp = icmp sge i32 %x, 0
  %l = lshr i32 %x, %y
  %r = ashr i32 %z, %y
  %ret = select i1 %cmp, i32 %l, i32 %r
  ret i32 %ret
}

define i32 @ashr_lshr_no_lshr(i32 %x, i32 %y) {
; CHECK-LABEL: @ashr_lshr_no_lshr(
; CHECK-NEXT:    [[CMP:%.*]] = icmp sge i32 [[X:%.*]], 0
; CHECK-NEXT:    [[L:%.*]] = add i32 [[X]], [[Y:%.*]]
; CHECK-NEXT:    [[R:%.*]] = ashr i32 [[X]], [[Y]]
; CHECK-NEXT:    [[RET:%.*]] = select i1 [[CMP]], i32 [[L]], i32 [[R]]
; CHECK-NEXT:    ret i32 [[RET]]
;
  %cmp = icmp sge i32 %x, 0
  %l = add i32 %x, %y
  %r = ashr i32 %x, %y
  %ret = select i1 %cmp, i32 %l, i32 %r
  ret i32 %ret
}

define <2 x i32> @ashr_lshr_vec_wrong_pred(<2 x i32> %x, <2 x i32> %y) {
; CHECK-LABEL: @ashr_lshr_vec_wrong_pred(
; CHECK-NEXT:    [[CMP:%.*]] = icmp sle <2 x i32> [[X:%.*]], zeroinitializer
; CHECK-NEXT:    [[L:%.*]] = lshr <2 x i32> [[X]], [[Y:%.*]]
; CHECK-NEXT:    [[R:%.*]] = ashr <2 x i32> [[X]], [[Y]]
; CHECK-NEXT:    [[RET:%.*]] = select <2 x i1> [[CMP]], <2 x i32> [[L]], <2 x i32> [[R]]
; CHECK-NEXT:    ret <2 x i32> [[RET]]
;
  %cmp = icmp sle <2 x i32> %x, zeroinitializer
  %l = lshr <2 x i32> %x, %y
  %r = ashr <2 x i32> %x, %y
  %ret = select <2 x i1> %cmp, <2 x i32> %l, <2 x i32> %r
  ret <2 x i32> %ret
}

define <2 x i32> @ashr_lshr_inv_vec_wrong_pred(<2 x i32> %x, <2 x i32> %y) {
; CHECK-LABEL: @ashr_lshr_inv_vec_wrong_pred(
; CHECK-NEXT:    [[CMP:%.*]] = icmp sge <2 x i32> [[X:%.*]], zeroinitializer
; CHECK-NEXT:    [[L:%.*]] = lshr <2 x i32> [[X]], [[Y:%.*]]
; CHECK-NEXT:    [[R:%.*]] = ashr <2 x i32> [[X]], [[Y]]
; CHECK-NEXT:    [[RET:%.*]] = select <2 x i1> [[CMP]], <2 x i32> [[R]], <2 x i32> [[L]]
; CHECK-NEXT:    ret <2 x i32> [[RET]]
;
  %cmp = icmp sge <2 x i32> %x, zeroinitializer
  %l = lshr <2 x i32> %x, %y
  %r = ashr <2 x i32> %x, %y
  %ret = select <2 x i1> %cmp, <2 x i32> %r, <2 x i32> %l
  ret <2 x i32> %ret
}

define <2 x i32> @ashr_lshr_undef2(<2 x i32> %x, <2 x i32> %y) {
; CHECK-LABEL: @ashr_lshr_undef2(
; CHECK-NEXT:    [[CMP:%.*]] = icmp sgt <2 x i32> [[X:%.*]], <i32 undef, i32 -1>
; CHECK-NEXT:    [[L:%.*]] = lshr <2 x i32> [[X]], [[Y:%.*]]
; CHECK-NEXT:    [[R:%.*]] = ashr <2 x i32> [[X]], [[Y]]
; CHECK-NEXT:    [[RET:%.*]] = select <2 x i1> [[CMP]], <2 x i32> [[L]], <2 x i32> [[R]]
; CHECK-NEXT:    ret <2 x i32> [[RET]]
;
  %cmp = icmp sgt <2 x i32> %x, <i32 undef, i32 -1>
  %l = lshr <2 x i32> %x, %y
  %r = ashr <2 x i32> %x, %y
  %ret = select <2 x i1> %cmp, <2 x i32> %l, <2 x i32> %r
  ret <2 x i32> %ret
}

define <2 x i32> @ashr_lshr_undef3(<2 x i32> %x, <2 x i32> %y) {
; CHECK-LABEL: @ashr_lshr_undef3(
; CHECK-NEXT:    [[CMP:%.*]] = icmp slt <2 x i32> [[X:%.*]], <i32 1, i32 undef>
; CHECK-NEXT:    [[L:%.*]] = lshr <2 x i32> [[X]], [[Y:%.*]]
; CHECK-NEXT:    [[R:%.*]] = ashr <2 x i32> [[X]], [[Y]]
; CHECK-NEXT:    [[RET:%.*]] = select <2 x i1> [[CMP]], <2 x i32> [[R]], <2 x i32> [[L]]
; CHECK-NEXT:    ret <2 x i32> [[RET]]
;
  %cmp = icmp slt <2 x i32> %x, <i32 1, i32 undef>
  %l = lshr <2 x i32> %x, %y
  %r = ashr <2 x i32> %x, %y
  %ret = select <2 x i1> %cmp, <2 x i32> %r, <2 x i32> %l
  ret <2 x i32> %ret
}

define i32 @ashr_lshr_exact_ashr_only(i32 %x, i32 %y) {
; CHECK-LABEL: @ashr_lshr_exact_ashr_only(
; CHECK-NEXT:    [[CMP:%.*]] = icmp sgt i32 [[X:%.*]], -1
; CHECK-NEXT:    [[L:%.*]] = lshr i32 [[X]], [[Y:%.*]]
; CHECK-NEXT:    [[R:%.*]] = ashr exact i32 [[X]], [[Y]]
; CHECK-NEXT:    [[RET:%.*]] = select i1 [[CMP]], i32 [[L]], i32 [[R]]
; CHECK-NEXT:    ret i32 [[RET]]
;
  %cmp = icmp sgt i32 %x, -1
  %l = lshr i32 %x, %y
  %r = ashr exact i32 %x, %y
  %ret = select i1 %cmp, i32 %l, i32 %r
  ret i32 %ret
}