	file	 "expr.i"
data

; cc1 (2.7.2.2) arguments: -O -fdefer-pop -fomit-frame-pointer
; -fcse-follow-jumps -fcse-skip-blocks -fexpensive-optimizations
; -fthread-jumps -fstrength-reduce -funroll-loops -fwritable-strings
; -fpeephole -fforce-mem -ffunction-cse -finline-functions -finline
; -freg-struct-return -fdelayed-branch -frerun-cse-after-loop
; -fschedule-insns -fschedule-insns2 -fcommon -fgnu-linker -m88110 -m88100
; -m88000 -mno-ocs-debug-info -mno-ocs-frame-position -mcheck-zero-division

gcc2_compiled.:
	global	 _do_preexpand_calls
	align	 4
_do_preexpand_calls:
	word	 1
text
	align	 8
	global	 _init_expr_once
_init_expr_once:
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r4,r13,lo16(_stack_pointer_rtx)
	subu	 r31,r31,96
	st	 r1,r31,80
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	st.d	 r20,r31,56
	or	 r2,r0,55
	st.d	 r18,r31,48
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	st.d	 r16,r31,40
@Ltb0:
	or	 r18,r0,r2
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r2,r0,55
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	bsr.n	 _start_sequence
	or	 r20,r0,r2
	or	 r2,r0,40
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,0
	bsr.n	 _emit_insn
	or	 r25,r0,0
	or	 r21,r0,r2
	or	 r16,r0,1
	or.u	 r13,r0,hi16(_direct_load)
	or.u	 r12,r0,hi16(_direct_store)
	ld	 r24,r21,16
	or	 r17,r13,lo16(_direct_load)
	or	 r19,r12,lo16(_direct_store)
	cmp	 r13,r25,0
@L41:
	st.b	 r0,r25,r19
	cmp	 r12,r25,16
	st.b	 r0,r25,r17
	or	 r13,r13,r12
	st.b	 r25,r18,2
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L25
	st.b	 r25,r20,2
	ld.b	 r13,r25,r17
	br.n	 @L39
	or	 r22,r0,0
	align	 4
@L29:
@L40:
	or	 r13,r13,lo16(_hard_regno_mode_ok)
	ld	 r13,r13[r22]
	ext	 r13,r13,r25
	bb0.n	 (31-31),r13,@L28
	or	 r2,r0,51
	or	 r3,r0,r25
	bsr.n	 _gen_rtx
	or	 r4,r0,r22
	st	 r18,r24,8
	or	 r23,r0,r2
	or	 r2,r0,r24
	or	 r3,r0,r21
	addu	 r4,r31,88
	bsr.n	 _recog
	st	 r23,r24,4
	bcnd	 lt0,r2,@L32
	st.b	 r16,r25,r17
@L32:
	st	 r20,r24,8
	or	 r2,r0,r24
	or	 r3,r0,r21
	addu	 r4,r31,88
	bsr.n	 _recog
	st	 r23,r24,4
	bcnd	 lt0,r2,@L33
	st.b	 r16,r25,r17
@L33:
	st	 r23,r24,8
	or	 r2,r0,r24
	or	 r3,r0,r21
	addu	 r4,r31,88
	bsr.n	 _recog
	st	 r18,r24,4
	bcnd	 lt0,r2,@L34
	st.b	 r16,r25,r19
@L34:
	st	 r23,r24,8
	or	 r2,r0,r24
	or	 r3,r0,r21
	addu	 r4,r31,88
	bsr.n	 _recog
	st	 r20,r24,4
	bcnd	 lt0,r2,@L28
	st.b	 r16,r25,r19
@L28:
	addu	 r22,r22,1
	cmp	 r13,r22,63
	bb0	 le,r13,@L25
	ld.b	 r13,r25,r17
@L39:
	bcnd.n	 eq0,r13,@L40
	or.u	 r13,r0,hi16(_hard_regno_mode_ok)
	ld.b	 r13,r25,r19
	bcnd.n	 eq0,r13,@L29
	or.u	 r13,r0,hi16(_hard_regno_mode_ok)
@L25:
	or.u	 r13,r0,hi16(_movstr_optab)
	or	 r23,r13,lo16(_movstr_optab)
	or	 r13,r0,210
	st	 r13,r23[r25]
	addu	 r25,r25,1
	cmp	 r13,r25,20
	bb1.n	 le,r13,@L41
	cmp	 r13,r25,0
	bsr	 _end_sequence
	or	 r13,r0,77
	st	 r13,r23,16
@Lte0:
	ld	 r1,r31,80
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	jmp.n	 r1
	addu	 r31,r31,96

	align	 8
	global	 _init_expr
_init_expr:
	subu	 r31,r31,48
	st	 r1,r31,36
@Ltb1:
	bsr	 _init_queue
@Lte1:
	ld	 r1,r31,36
	or.u	 r13,r0,hi16(_pending_stack_adjust)
	st	 r0,r13,lo16(_pending_stack_adjust)
	or.u	 r13,r0,hi16(_inhibit_defer_pop)
	st	 r0,r13,lo16(_inhibit_defer_pop)
	or.u	 r13,r0,hi16(_cleanups_this_call)
	st	 r0,r13,lo16(_cleanups_this_call)
	or.u	 r13,r0,hi16(_saveregs_value)
	st	 r0,r13,lo16(_saveregs_value)
	or.u	 r13,r0,hi16(_forced_labels)
	addu	 r31,r31,48
	jmp.n	 r1
	st	 r0,r13,lo16(_forced_labels)

	align	 8
	global	 _save_expr_status
_save_expr_status:
	subu	 r31,r31,48
	st	 r25,r31,32
	st	 r1,r31,36
@Ltb2:
	bsr.n	 _emit_queue
	or	 r25,r0,r2
	or.u	 r5,r0,hi16(_pending_stack_adjust)
	or.u	 r4,r0,hi16(_inhibit_defer_pop)
	ld	 r9,r5,lo16(_pending_stack_adjust)
	or.u	 r6,r0,hi16(_cleanups_this_call)
	ld	 r10,r4,lo16(_inhibit_defer_pop)
	or.u	 r7,r0,hi16(_saveregs_value)
	ld	 r11,r6,lo16(_cleanups_this_call)
	or.u	 r8,r0,hi16(_forced_labels)
	ld	 r13,r7,lo16(_saveregs_value)
	ld	 r12,r8,lo16(_forced_labels)
	st	 r9,r25,212
	st	 r10,r25,216
	st	 r11,r25,220
	st	 r13,r25,224
	st	 r12,r25,228
@Lte2:
	ld	 r1,r31,36
	ld	 r25,r31,32
	st	 r0,r5,lo16(_pending_stack_adjust)
	st	 r0,r4,lo16(_inhibit_defer_pop)
	st	 r0,r6,lo16(_cleanups_this_call)
	st	 r0,r7,lo16(_saveregs_value)
	addu	 r31,r31,48
	jmp.n	 r1
	st	 r0,r8,lo16(_forced_labels)

	align	 8
	global	 _restore_expr_status
_restore_expr_status:
@Ltb3:
	ld	 r8,r2,212
	or.u	 r9,r0,hi16(_pending_stack_adjust)
	st	 r8,r9,lo16(_pending_stack_adjust)
	ld	 r8,r2,216
	or.u	 r9,r0,hi16(_inhibit_defer_pop)
	st	 r8,r9,lo16(_inhibit_defer_pop)
	ld	 r8,r2,220
	or.u	 r9,r0,hi16(_cleanups_this_call)
	st	 r8,r9,lo16(_cleanups_this_call)
	ld	 r8,r2,224
	or.u	 r9,r0,hi16(_saveregs_value)
	st	 r8,r9,lo16(_saveregs_value)
	ld	 r8,r2,228
	or.u	 r9,r0,hi16(_forced_labels)
	jmp.n	 r1
	st	 r8,r9,lo16(_forced_labels)
@Lte3:

	align	 8
	global	 _protect_from_queue
_protect_from_queue:
	subu	 r31,r31,64
	st	 r1,r31,48
	st.d	 r24,r31,40
	or	 r24,r0,r2
	st	 r23,r31,36
@Ltb4:
	ld.hu	 r11,r0,r24
	cmp	 r13,r11,59
	bb0.n	 ne,r13,@L59
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L68
	cmp	 r13,r11,63
	ld.bu	 r13,r24,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L60
	ld	 r23,r24,4
	ld.hu	 r13,r0,r23
	cmp	 r12,r3,0
	cmp	 r13,r13,59
	and	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L60
	ld	 r13,r23,4
	st	 r13,r24,4
	ld	 r13,r23,8
	bcnd	 eq0,r13,@L63
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r24,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r24
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	br.n	 @L67
	or	 r2,r0,r25
	align	 4
@L60:
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L62
	cmp	 r13,r11,63
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L63
	st	 r2,r24,4
	align	 4
@L62:
@L68:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L63
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,4
	ld	 r2,r24,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,8
@L63:
	br.n	 @L67
	or	 r2,r0,r24
	align	 4
@L59:
	ld	 r13,r24,8
	bcnd	 ne0,r13,@L65
	ld	 r2,r24,4
	br	 @L67
	align	 4
@L65:
	ld	 r2,r24,12
	bcnd	 ne0,r2,@L67
	ld	 r13,r24,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r24,4
	bsr.n	 _gen_move_insn
	st	 r2,r24,12
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	ld	 r2,r24,12
@L67:
@Lte4:
	ld	 r1,r31,48
	ld	 r23,r31,36
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64

	align	 8
_queued_subexp_p:
	subu	 r31,r31,64
	st.d	 r24,r31,40
	or	 r25,r0,r2
	st	 r1,r31,48
@Ltb5:
	ld.hu	 r12,r0,r25
	cmp	 r13,r12,64
	bb0.n	 ls,r13,@L92
	cmp	 r13,r12,63
	bb0.n	 lo,r13,@L87
	cmp	 r13,r12,55
	bb0.n	 ne,r13,@L84
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L93
	or	 r2,r0,1
	br.n	 @L93
	or	 r2,r0,0
	align	 4
@L92:
	cmp	 r13,r12,66
	bb0.n	 ne,r13,@L87
	or	 r2,r0,0
	br	 @L93
	align	 4
@L84:
	ld	 r2,r25,4
	bsr.n	 _queued_subexp_p
	addu	 r1,r1,@L94
@L95:
	align	 4
@L87:
	ld	 r2,r25,4
	bsr.n	 _queued_subexp_p
	or	 r24,r0,0
	bcnd	 ne0,r2,@L89
	bsr.n	 _queued_subexp_p
	ld	 r2,r25,8
	bcnd.n	 eq0,r2,@L93
	or	 r2,r0,r24
@L89:
	or	 r24,r0,1
	or	 r2,r0,r24
@L93:
@Lte5:
	ld	 r1,r31,48
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64
	def	 @L94,@L93-@L95

	align	 8
	global	 _emit_queue
_emit_queue:
	subu	 r31,r31,64
	or.u	 r13,r0,hi16(_pending_chain)
	st.d	 r24,r31,40
	ld	 r25,r13,lo16(_pending_chain)
	bcnd.n	 eq0,r25,@L103
	st	 r1,r31,48
@Ltb6:
	or	 r24,r0,r13
@L104:
	bsr.n	 _emit_insn
	ld	 r2,r25,16
	ld	 r13,r25,20
	st	 r2,r25,8
	or	 r25,r0,r13
	bcnd.n	 ne0,r25,@L104
	st	 r25,r24,lo16(_pending_chain)
@L103:
@Lte6:
	ld	 r1,r31,48
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64

	align	 8
_init_queue:
	or.u	 r13,r0,hi16(_pending_chain)
	ld	 r13,r13,lo16(_pending_chain)
	subu	 r31,r31,48
	bcnd.n	 eq0,r13,@L110
	st	 r1,r31,36
@Ltb7:
	bsr	 _abort
	align	 4
@L110:
@Lte7:
	ld	 r1,r31,36
	jmp.n	 r1
	addu	 r31,r31,48

	align	 8
	global	 _convert_move
_convert_move:
	subu	 r31,r31,96
	st	 r1,r31,80
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	st.d	 r20,r31,56
	or.u	 r13,r0,hi16(_mode_class)
	st.d	 r18,r31,48
	or	 r21,r0,r2
	st.d	 r16,r31,40
@Ltb8:
	or	 r23,r0,r3
	ld.bu	 r20,r21,2
	or	 r13,r13,lo16(_mode_class)
	ld.bu	 r22,r23,2
	ld	 r12,r13[r20]
	ld	 r13,r13[r22]
	or	 r19,r0,r4
	cmp	 r12,r12,2
	cmp	 r13,r13,2
	extu	 r18,r12,1<eq>
	or	 r17,r0,99
	bcnd.n	 eq0,r19,@L224
	extu	 r16,r13,1<eq>
	or	 r17,r0,100
@L224:
	ld.hu	 r12,r0,r21
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L227
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L230
	cmp	 r13,r12,63
	ld	 r2,r21,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L231
	st	 r2,r21,4
	align	 4
@L230:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L231
	ld	 r2,r21,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r21,4
	ld	 r2,r21,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r21,8
@L231:
	br.n	 @L226
	or	 r2,r0,r21
	align	 4
@L227:
	ld	 r13,r21,8
	bcnd	 ne0,r13,@L233
	ld	 r2,r21,4
	br	 @L226
	align	 4
@L233:
	ld	 r2,r21,12
	bcnd	 ne0,r2,@L226
	ld	 r13,r21,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r21,4
	bsr.n	 _gen_move_insn
	st	 r2,r21,12
	bsr.n	 _emit_insn_before
	ld	 r3,r21,8
	ld	 r2,r21,12
@L226:
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L236
	or	 r21,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L376
	cmp	 r13,r12,63
	ld.bu	 r13,r23,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L237
	ld	 r24,r23,4
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L237
	ld	 r13,r24,4
	st	 r13,r23,4
	ld	 r13,r24,8
	bcnd	 eq0,r13,@L240
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r23,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r23
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	br.n	 @L235
	or	 r2,r0,r25
	align	 4
@L237:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L239
	cmp	 r13,r12,63
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L240
	st	 r2,r23,4
	align	 4
@L239:
@L376:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L240
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,4
	ld	 r2,r23,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,8
@L240:
	br.n	 @L235
	or	 r2,r0,r23
	align	 4
@L236:
	ld	 r13,r23,8
	bcnd	 ne0,r13,@L242
	ld	 r2,r23,4
	br.n	 @L377
	cmp	 r13,r18,r16
	align	 4
@L242:
	ld	 r2,r23,12
	bcnd.n	 ne0,r2,@L377
	cmp	 r13,r18,r16
	ld	 r13,r23,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r23,4
	bsr.n	 _gen_move_insn
	st	 r2,r23,12
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	ld	 r2,r23,12
@L235:
	cmp	 r13,r18,r16
@L377:
	bb0.n	 ne,r13,@L244
	or	 r23,r0,r2
	bsr	 _abort
	align	 4
@L244:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
	ld	 r11,r0,r23
	and	 r13,r11,0x8
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L378
	ld	 r13,r23,4
	or.u	 r12,r0,hi16(_mode_size)
	ld.bu	 r13,r13,2
	or	 r12,r12,lo16(_mode_size)
	ld	 r13,r12[r13]
	ld	 r12,r12[r20]
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L245
	extu	 r13,r11,1<5>
	cmp	 r13,r13,r19
	bb1.n	 ne,r13,@L245
	or	 r2,r0,r20
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	or	 r22,r0,r20
	or	 r23,r0,r2
@L245:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
@L378:
	ld	 r13,r0,r21
	and	 r13,r13,0x8
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L246
	cmp	 r13,r20,r22
	bsr	 _abort
	align	 4
@L246:
	bb0.n	 ne,r13,@L379
	or	 r2,r0,r21
	bcnd	 ne0,r22,@L247
	ld.hu	 r12,r0,r23
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L379
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L379
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L247
@L379:
	or	 r3,r0,r23
	bsr.n	 _emit_move_insn
	addu	 r1,r1,@L390
@L391:
	align	 4
@L247:
	bcnd.n	 eq0,r18,@L249
	cmp	 r5,r22,8
	cmp	 r13,r20,9
	extu	 r11,r5,1<eq>
	extu	 r7,r13,1<eq>
	and	 r13,r11,r7
	bcnd.n	 ne0,r13,@L370
	or	 r2,r0,108
	cmp	 r6,r20,11
	extu	 r12,r6,1<eq>
	and	 r13,r11,r12
	bcnd.n	 ne0,r13,@L370
	or	 r2,r0,109
	cmp	 r8,r22,9
	extu	 r9,r8,1<eq>
	and	 r13,r9,r12
	bcnd.n	 eq0,r13,@L252
	cmp	 r4,r20,11
	br.n	 @L370
	or	 r2,r0,110
	align	 4
@L252:
	cmp	 r10,r20,8
	extu	 r11,r10,1<eq>
	and	 r13,r9,r11
	bcnd.n	 ne0,r13,@L370
	or	 r2,r0,111
	cmp	 r9,r22,11
	extu	 r12,r9,1<eq>
	and	 r13,r12,r11
	bcnd.n	 ne0,r13,@L370
	or	 r2,r0,112
	and	 r13,r12,r7
	bcnd.n	 eq0,r13,@L255
	cmp	 r12,r20,9
	or	 r2,r0,113
@L370:
	or	 r3,r0,r21
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _emit_unop_insn
	addu	 r1,r1,@L392
@L393:
	align	 4
@L255:
	bb0.n	 ne,r8,@L265
	or	 r2,r0,0
	bb0.n	 ls,r8,@L287
	cmp	 r13,r22,10
	bb0.n	 ne,r5,@L257
	cmp	 r13,r20,10
	br	 @L256
	align	 4
@L287:
	bb0	 ne,r13,@L273
	bb0	 ne,r9,@L279
	br	 @L256
	align	 4
@L257:
	bb0	 ne,r13,@L260
	bb0	 ls,r13,@L264
	bb0.n	 ne,r12,@L259
	or.u	 r13,r0,hi16(_extendsfdf2_libfunc)
	br	 @L256
	align	 4
@L264:
	bb0.n	 ne,r4,@L261
	or.u	 r13,r0,hi16(_extendsftf2_libfunc)
	br	 @L256
	align	 4
@L259:
	ld	 r2,r13,lo16(_extendsfdf2_libfunc)
	br	 @L256
	align	 4
@L260:
	or.u	 r13,r0,hi16(_extendsfxf2_libfunc)
	ld	 r2,r13,lo16(_extendsfxf2_libfunc)
	br	 @L256
	align	 4
@L261:
	ld	 r2,r13,lo16(_extendsftf2_libfunc)
	br	 @L256
	align	 4
@L265:
	cmp	 r13,r20,10
	bb0	 ne,r13,@L268
	bb0	 ls,r13,@L272
	bb0.n	 ne,r10,@L267
	or.u	 r13,r0,hi16(_truncdfsf2_libfunc)
	br	 @L256
	align	 4
@L272:
	bb0.n	 ne,r6,@L269
	or.u	 r13,r0,hi16(_extenddftf2_libfunc)
	br	 @L256
	align	 4
@L267:
	ld	 r2,r13,lo16(_truncdfsf2_libfunc)
	br	 @L256
	align	 4
@L268:
	or.u	 r13,r0,hi16(_extenddfxf2_libfunc)
	ld	 r2,r13,lo16(_extenddfxf2_libfunc)
	br	 @L256
	align	 4
@L269:
	ld	 r2,r13,lo16(_extenddftf2_libfunc)
	br	 @L256
	align	 4
@L273:
	bb0.n	 ne,r10,@L275
	or.u	 r13,r0,hi16(_truncxfsf2_libfunc)
	bb0.n	 ne,r12,@L276
	or.u	 r13,r0,hi16(_truncxfdf2_libfunc)
	br	 @L256
	align	 4
@L275:
	ld	 r2,r13,lo16(_truncxfsf2_libfunc)
	br	 @L256
	align	 4
@L276:
	ld	 r2,r13,lo16(_truncxfdf2_libfunc)
	br	 @L256
	align	 4
@L279:
	bb0.n	 ne,r10,@L281
	or.u	 r13,r0,hi16(_trunctfsf2_libfunc)
	bb0.n	 ne,r12,@L282
	or.u	 r13,r0,hi16(_trunctfdf2_libfunc)
	br	 @L256
	align	 4
@L281:
	ld	 r2,r13,lo16(_trunctfsf2_libfunc)
	br	 @L256
	align	 4
@L282:
	ld	 r2,r13,lo16(_trunctfdf2_libfunc)
@L256:
	bcnd.n	 ne0,r2,@L288
	or	 r3,r0,1
	bsr	 _abort
	align	 4
@L288:
	or	 r4,r0,r20
	or	 r5,r0,1
	or	 r6,r0,r23
	bsr.n	 _emit_library_call
	or	 r7,r0,r22
	or	 r2,r0,r20
	bsr.n	 _hard_libcall_value
	addu	 r1,r1,@L394
@L395:
	align	 4
@L249:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r24,r13,lo16(_mode_size)
	ld	 r13,r24[r22]
	ld	 r12,r24[r20]
	mak	 r13,r13,0<3>
	mak	 r11,r12,0<3>
	cmp	 r13,r13,r11
	bb1.n	 ge,r13,@L380
	or.u	 r13,r0,hi16(_mode_size)
	cmp	 r13,r11,32
	bb0.n	 gt,r13,@L289
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L290
	addu	 r13,r12,6
@L290:
	or	 r2,r0,r20
	or	 r3,r0,r22
	or	 r4,r0,r19
	bsr.n	 _can_extend_p
	ext	 r18,r13,0<2>
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb1.n	 ne,r13,@L381
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r24[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L293
	or.u	 r24,r0,hi16(_word_mode)
	or	 r2,r0,r20
	ld	 r3,r24,lo16(_word_mode)
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0	 ne,r13,@L293
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r21
	or	 r3,r0,r23
	bsr.n	 _convert_move
	or	 r4,r0,r19
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r21
	or	 r4,r0,r2
	or	 r2,r0,r25
	br.n	 @L372
	or	 r3,r0,r21
	align	 4
@L293:
	bsr	 _start_sequence
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L295
	or	 r25,r0,r22
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r25,r13,lo16(_word_mode)
	br.n	 @L382
	or	 r2,r0,r25
	align	 4
@L295:
	or	 r2,r0,r25
@L382:
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,r19
	or	 r24,r0,r2
	or	 r2,r0,r25
	bsr.n	 _gen_lowpart
	or	 r3,r0,r21
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
	bcnd.n	 eq0,r19,@L299
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r24,r13,lo16(_const0_rtx)
	br.n	 @L383
	or.u	 r13,r0,hi16(_mode_size)
	align	 4
@L299:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r2,r13[r25]
	mak	 r2,r2,0<3>
	bsr.n	 _size_int
	subu	 r2,r2,1
	or	 r5,r0,r2
	or	 r2,r0,78
	or	 r3,r0,r25
	or	 r4,r0,r24
	or	 r6,r0,0
	bsr.n	 _expand_shift
	or	 r7,r0,0
	or	 r24,r0,r2
	or.u	 r13,r0,hi16(_word_mode)
	or	 r4,r0,1
	ld	 r2,r13,lo16(_word_mode)
	bsr.n	 _convert_to_mode
	or	 r3,r0,r24
	or	 r24,r0,r2
	or.u	 r13,r0,hi16(_mode_size)
@L383:
	or	 r13,r13,lo16(_mode_size)
	ld	 r2,r13[r25]
	bcnd	 ge0,r2,@L301
	addu	 r2,r2,3
@L301:
	ext	 r22,r2,0<2>
	cmp	 r13,r22,r18
	bb0.n	 lt,r13,@L303
	subu	 r13,r18,r22
	mask	 r12,r13,3
	bcnd.n	 eq0,r12,@L305
	subu	 r25,r18,r22
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L339
	cmp	 r13,r12,2
	bb0.n	 gt,r13,@L340
	or	 r2,r0,r21
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r20
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L344
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L344:
	bb1	 eq,r13,@L342
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L342:
	addu	 r22,r22,1
@L340:
	or	 r2,r0,r21
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r20
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L348
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L348:
	bb1	 eq,r13,@L346
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L346:
	addu	 r22,r22,1
@L339:
	or	 r2,r0,r21
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r20
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L352
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L352:
	bb1	 eq,r13,@L350
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L350:
	addu	 r22,r22,1
	cmp	 r13,r22,r18
	bb0	 lt,r13,@L303
@L305:
	or	 r2,r0,r21
@L384:
	subu	 r3,r25,1
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r20
	bcnd.n	 ne0,r2,@L356
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L356:
	bb1	 eq,r13,@L354
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L354:
	or	 r2,r0,r21
	subu	 r3,r25,2
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r20
	bcnd.n	 ne0,r2,@L360
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L360:
	bb1	 eq,r13,@L358
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L358:
	or	 r2,r0,r21
	subu	 r3,r25,3
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r20
	bcnd.n	 ne0,r2,@L364
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L364:
	bb1	 eq,r13,@L362
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L362:
	or	 r2,r0,r21
	or	 r4,r0,1
	subu	 r25,r25,4
	or	 r5,r0,r20
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L368
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L368:
	bb1	 eq,r13,@L366
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L366:
	addu	 r22,r22,4
	cmp	 r13,r22,r18
	bb1.n	 lt,r13,@L384
	or	 r2,r0,r21
@L303:
	bsr	 _get_insns
	bsr.n	 _end_sequence
	or	 r25,r0,r2
	or	 r2,r0,r17
	or	 r3,r0,r20
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r6,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,r21
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _emit_no_conflict_block
	addu	 r1,r1,@L396
@L397:
	align	 4
@L289:
	or.u	 r13,r0,hi16(_mode_size)
@L380:
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,32
	bb0.n	 gt,r13,@L309
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r2,r13,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	or	 r2,r0,r21
	br.n	 @L373
	or	 r4,r0,0
	align	 4
@L309:
	cmp	 r13,r20,3
	bb1.n	 ne,r13,@L310
	cmp	 r13,r22,3
	cmp	 r13,r22,4
	bb0.n	 ne,r13,@L311
	or	 r2,r0,4
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,r19
@L311:
	bsr	 _abort
	align	 4
@L310:
	bb1.n	 ne,r13,@L385
	or.u	 r13,r0,hi16(_mode_size)
	cmp	 r13,r20,4
	bb0.n	 ne,r13,@L313
	or	 r2,r0,4
	or	 r3,r0,r23
	or	 r4,r0,r19
	bsr.n	 _convert_to_mode
	or	 r22,r0,4
	br.n	 @L312
	or	 r23,r0,r2
	align	 4
@L313:
	bsr	 _abort
	align	 4
@L312:
	or.u	 r13,r0,hi16(_mode_size)
@L385:
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r20]
	ld	 r13,r13[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb1.n	 ge,r12,@L386
	or.u	 r13,r0,hi16(_mode_size)
	ld	 r13,r0,r23
	or.u	 r12,r0,0x37
	and	 r13,r13,0x10
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L317
	or.u	 r13,r0,hi16(_direct_load)
	or	 r13,r13,lo16(_direct_load)
	ld.b	 r13,r20,r13
	bcnd	 eq0,r13,@L317
	bsr.n	 _mode_dependent_address_p
	ld	 r2,r23,4
	bcnd.n	 eq0,r2,@L387
	or	 r2,r0,r20
@L317:
	ld.hu	 r13,r0,r23
	cmp	 r12,r13,51
	cmp	 r13,r13,53
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L315
	or	 r2,r0,r20
@L387:
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	addu	 r1,r1,@L398
@L399:
	align	 4
@L315:
	or.u	 r13,r0,hi16(_mode_size)
@L386:
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r20]
	ld	 r13,r13[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb0.n	 gt,r12,@L318
	or	 r2,r0,r20
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0.n	 ne,r13,@L319
	or.u	 r13,r0,hi16(_optimize)
@L381:
	ld	 r13,r13,lo16(_optimize)
	bcnd	 le0,r13,@L320
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L388
	or	 r2,r0,r25
	or	 r2,r0,r22
	bsr.n	 _force_reg
	or	 r3,r0,r23
	or	 r23,r0,r2
@L320:
	or	 r2,r0,r25
@L388:
	or	 r3,r0,r21
	or	 r4,r0,r23
@L372:
	or	 r5,r0,r17
	bsr.n	 _emit_unop_insn
	addu	 r1,r1,@L400
@L401:
	align	 4
@L319:
	or	 r25,r0,r22
	bcnd.n	 eq0,r25,@L323
	or.u	 r13,r0,hi16(_mode_wider_mode)
	or	 r24,r13,lo16(_mode_wider_mode)
	or	 r2,r0,r20
@L389:
	or	 r3,r0,r25
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	cmp	 r2,r2,210
	bb1.n	 eq,r2,@L324
	or	 r2,r0,r25
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	cmp	 r2,r2,210
	bb0.n	 eq,r2,@L335
	or	 r2,r0,r25
@L324:
	ld	 r25,r24[r25]
	bcnd.n	 ne0,r25,@L389
	or	 r2,r0,r20
@L323:
	bsr	 _abort
	align	 4
@L318:
	cmp	 r13,r22,6
	extu	 r11,r13,1<eq>
	cmp	 r13,r20,4
	extu	 r13,r13,1<eq>
	and	 r13,r11,r13
	bcnd.n	 eq0,r13,@L328
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L402
@L403:
	align	 4
@L328:
	cmp	 r13,r20,2
	extu	 r9,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L329
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L404
@L405:
	align	 4
@L329:
	cmp	 r13,r20,1
	extu	 r10,r13,1<eq>
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L330
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L406
@L407:
	align	 4
@L330:
	cmp	 r13,r22,4
	extu	 r11,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L331
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L408
@L409:
	align	 4
@L331:
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L332
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L410
@L411:
	align	 4
@L332:
	cmp	 r13,r22,2
	extu	 r13,r13,1<eq>
	and	 r13,r13,r10
	bcnd.n	 eq0,r13,@L333
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L412
@L413:
	align	 4
@L333:
	bb1.n	 ge,r12,@L334
	or	 r2,r0,r20
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	bsr.n	 _force_reg
	or	 r2,r0,r20
@L371:
	or	 r3,r0,r2
	or	 r2,r0,r21
	bsr.n	 _emit_move_insn
	addu	 r1,r1,@L414
@L415:
	align	 4
@L334:
	bsr	 _abort
	align	 4
@L335:
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,r19
@L374:
	or	 r3,r0,r2
	or	 r2,r0,r21
	or	 r4,r0,r19
@L373:
	bsr	 _convert_move
@L223:
@Lte8:
	ld	 r1,r31,80
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	jmp.n	 r1
	addu	 r31,r31,96
	def	 @L414,@L223-@L415
	def	 @L412,@L374-@L413
	def	 @L410,@L374-@L411
	def	 @L408,@L374-@L409
	def	 @L406,@L374-@L407
	def	 @L404,@L374-@L405
	def	 @L402,@L374-@L403
	def	 @L400,@L223-@L401
	def	 @L398,@L371-@L399
	def	 @L396,@L223-@L397
	def	 @L394,@L371-@L395
	def	 @L392,@L223-@L393
	def	 @L390,@L223-@L391

	align	 8
	global	 _convert_to_mode
_convert_to_mode:
	subu	 r31,r31,96
	st	 r1,r31,80
	st	 r15,r31,36
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	st.d	 r20,r31,56
	st.d	 r18,r31,48
	or	 r25,r0,r3
	st.d	 r16,r31,40
@Ltb9:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
	ld	 r11,r0,r25
	and	 r13,r11,0x8
	or	 r24,r0,r2
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L536
	or	 r19,r0,r4
	ld	 r13,r25,4
	or.u	 r12,r0,hi16(_mode_size)
	ld.bu	 r13,r13,2
	or	 r12,r12,lo16(_mode_size)
	ld	 r13,r12[r13]
	ld	 r12,r12[r24]
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L536
	extu	 r13,r11,1<5>
	cmp	 r13,r13,r19
	bb1	 ne,r13,@L536
	bsr	 _gen_lowpart
	or	 r25,r0,r2
@L536:
	ld.bu	 r13,r25,2
	cmp	 r13,r24,r13
	bb0.n	 ne,r13,@L654
	or	 r2,r0,r25
	bcnd.n	 eq0,r19,@L538
	or.u	 r13,r0,hi16(_mode_class)
	or	 r13,r13,lo16(_mode_class)
	ld	 r13,r13[r24]
	cmp	 r13,r13,1
	bb1.n	 ne,r13,@L538
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r24]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,64
	bb1	 ne,r13,@L538
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,46
	bb1	 ne,r13,@L655
	ld	 r2,r25,4
	bcnd.n	 ge0,r2,@L538
	or	 r3,r0,0
	or	 r4,r0,r24
	bsr.n	 _immed_double_const
	addu	 r1,r1,@L715
@L716:
	align	 4
@L538:
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,46
	bb0.n	 ne,r13,@L697
	or	 r2,r0,r24
@L655:
	or.u	 r13,r0,hi16(_mode_class)
	or	 r12,r13,lo16(_mode_class)
	ld	 r13,r12[r24]
	cmp	 r13,r13,1
	bb1.n	 ne,r13,@L698
	or	 r2,r0,r24
	ld.bu	 r11,r25,2
	ld	 r13,r12[r11]
	cmp	 r13,r13,1
	bb1	 ne,r13,@L698
	ld.hu	 r10,r0,r25
	cmp	 r13,r10,47
	bb0.n	 ne,r13,@L697
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r24]
	ld	 r13,r13[r11]
	cmp	 r12,r12,r13
	bb1	 gt,r12,@L698
	ld	 r13,r0,r25
	or.u	 r12,r0,0x37
	and	 r13,r13,0x10
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L699
	cmp	 r13,r10,51
	or.u	 r13,r0,hi16(_direct_load)
	or	 r13,r13,lo16(_direct_load)
	ld.b	 r13,r24,r13
	bcnd.n	 ne0,r13,@L700
	or	 r3,r0,r25
	cmp	 r13,r10,51
@L699:
	bb1.n	 ne,r13,@L539
	or	 r2,r0,r24
@L697:
	or	 r3,r0,r25
@L700:
	bsr.n	 _gen_lowpart
	addu	 r1,r1,@L717
@L718:
	align	 4
@L539:
@L698:
	bsr.n	 _gen_reg_rtx
	or	 r23,r0,r25
	ld.bu	 r22,r23,2
	or	 r17,r0,r2
	or.u	 r13,r0,hi16(_mode_class)
	ld.bu	 r21,r17,2
	or	 r13,r13,lo16(_mode_class)
	ld	 r12,r13[r21]
	ld	 r13,r13[r22]
	or	 r16,r0,99
	cmp	 r12,r12,2
	cmp	 r13,r13,2
	extu	 r18,r12,1<eq>
	or	 r20,r0,r17
	bcnd.n	 eq0,r19,@L543
	extu	 r15,r13,1<eq>
	or	 r16,r0,100
@L543:
	ld.hu	 r12,r0,r17
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L546
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L549
	cmp	 r13,r12,63
	ld	 r2,r17,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L550
	st	 r2,r17,4
	align	 4
@L549:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L550
	ld	 r2,r20,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r20,4
	ld	 r2,r20,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r20,8
@L550:
	br.n	 @L545
	or	 r2,r0,r20
	align	 4
@L546:
	ld	 r13,r17,8
	bcnd	 ne0,r13,@L552
	ld	 r2,r17,4
	br	 @L545
	align	 4
@L552:
	ld	 r2,r17,12
	bcnd	 ne0,r2,@L545
	ld	 r13,r17,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r17,4
	bsr.n	 _gen_move_insn
	st	 r2,r17,12
	bsr.n	 _emit_insn_before
	ld	 r3,r17,8
	ld	 r2,r17,12
@L545:
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L555
	or	 r20,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L701
	cmp	 r13,r12,63
	ld.bu	 r13,r23,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L556
	ld	 r24,r23,4
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L556
	ld	 r13,r24,4
	st	 r13,r23,4
	ld	 r13,r24,8
	bcnd	 eq0,r13,@L559
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r23,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r23
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	br.n	 @L554
	or	 r2,r0,r25
	align	 4
@L556:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L558
	cmp	 r13,r12,63
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L559
	st	 r2,r23,4
	align	 4
@L558:
@L701:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L559
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,4
	ld	 r2,r23,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,8
@L559:
	br.n	 @L554
	or	 r2,r0,r23
	align	 4
@L555:
	ld	 r13,r23,8
	bcnd	 ne0,r13,@L561
	ld	 r2,r23,4
	br.n	 @L702
	cmp	 r13,r18,r15
	align	 4
@L561:
	ld	 r2,r23,12
	bcnd.n	 ne0,r2,@L702
	cmp	 r13,r18,r15
	ld	 r13,r23,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r23,4
	bsr.n	 _gen_move_insn
	st	 r2,r23,12
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	ld	 r2,r23,12
@L554:
	cmp	 r13,r18,r15
@L702:
	bb0.n	 ne,r13,@L563
	or	 r23,r0,r2
	bsr	 _abort
	align	 4
@L563:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
	ld	 r11,r0,r23
	and	 r13,r11,0x8
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L703
	ld	 r13,r23,4
	or.u	 r12,r0,hi16(_mode_size)
	ld.bu	 r13,r13,2
	or	 r12,r12,lo16(_mode_size)
	ld	 r13,r12[r13]
	ld	 r12,r12[r21]
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L564
	extu	 r13,r11,1<5>
	cmp	 r13,r13,r19
	bb1.n	 ne,r13,@L564
	or	 r2,r0,r21
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	or	 r22,r0,r21
	or	 r23,r0,r2
@L564:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
@L703:
	ld	 r13,r0,r20
	and	 r13,r13,0x8
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L565
	cmp	 r13,r21,r22
	bsr	 _abort
	align	 4
@L565:
	bb0.n	 ne,r13,@L704
	or	 r2,r0,r20
	bcnd	 ne0,r22,@L566
	ld.hu	 r12,r0,r23
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L704
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L704
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L566
@L704:
	or	 r3,r0,r23
	bsr.n	 _emit_move_insn
	addu	 r1,r1,@L719
@L720:
	align	 4
@L566:
	bcnd.n	 eq0,r18,@L568
	cmp	 r5,r22,8
	cmp	 r13,r21,9
	extu	 r11,r5,1<eq>
	extu	 r7,r13,1<eq>
	and	 r13,r11,r7
	bcnd.n	 ne0,r13,@L691
	or	 r2,r0,108
	cmp	 r6,r21,11
	extu	 r12,r6,1<eq>
	and	 r13,r11,r12
	bcnd.n	 ne0,r13,@L691
	or	 r2,r0,109
	cmp	 r8,r22,9
	extu	 r9,r8,1<eq>
	and	 r13,r9,r12
	bcnd.n	 eq0,r13,@L571
	cmp	 r4,r21,11
	br.n	 @L691
	or	 r2,r0,110
	align	 4
@L571:
	cmp	 r10,r21,8
	extu	 r11,r10,1<eq>
	and	 r13,r9,r11
	bcnd.n	 ne0,r13,@L691
	or	 r2,r0,111
	cmp	 r9,r22,11
	extu	 r12,r9,1<eq>
	and	 r13,r12,r11
	bcnd.n	 ne0,r13,@L691
	or	 r2,r0,112
	and	 r13,r12,r7
	bcnd.n	 eq0,r13,@L574
	cmp	 r12,r21,9
	or	 r2,r0,113
@L691:
	or	 r3,r0,r20
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _emit_unop_insn
	addu	 r1,r1,@L721
@L722:
	align	 4
@L574:
	bb0.n	 ne,r8,@L584
	or	 r2,r0,0
	bb0.n	 ls,r8,@L606
	cmp	 r13,r22,10
	bb0.n	 ne,r5,@L576
	cmp	 r13,r21,10
	br	 @L575
	align	 4
@L606:
	bb0	 ne,r13,@L592
	bb0	 ne,r9,@L598
	br	 @L575
	align	 4
@L576:
	bb0	 ne,r13,@L579
	bb0	 ls,r13,@L583
	bb0.n	 ne,r12,@L578
	or.u	 r13,r0,hi16(_extendsfdf2_libfunc)
	br	 @L575
	align	 4
@L583:
	bb0.n	 ne,r4,@L580
	or.u	 r13,r0,hi16(_extendsftf2_libfunc)
	br	 @L575
	align	 4
@L578:
	ld	 r2,r13,lo16(_extendsfdf2_libfunc)
	br	 @L575
	align	 4
@L579:
	or.u	 r13,r0,hi16(_extendsfxf2_libfunc)
	ld	 r2,r13,lo16(_extendsfxf2_libfunc)
	br	 @L575
	align	 4
@L580:
	ld	 r2,r13,lo16(_extendsftf2_libfunc)
	br	 @L575
	align	 4
@L584:
	cmp	 r13,r21,10
	bb0	 ne,r13,@L587
	bb0	 ls,r13,@L591
	bb0.n	 ne,r10,@L586
	or.u	 r13,r0,hi16(_truncdfsf2_libfunc)
	br	 @L575
	align	 4
@L591:
	bb0.n	 ne,r6,@L588
	or.u	 r13,r0,hi16(_extenddftf2_libfunc)
	br	 @L575
	align	 4
@L586:
	ld	 r2,r13,lo16(_truncdfsf2_libfunc)
	br	 @L575
	align	 4
@L587:
	or.u	 r13,r0,hi16(_extenddfxf2_libfunc)
	ld	 r2,r13,lo16(_extenddfxf2_libfunc)
	br	 @L575
	align	 4
@L588:
	ld	 r2,r13,lo16(_extenddftf2_libfunc)
	br	 @L575
	align	 4
@L592:
	bb0.n	 ne,r10,@L594
	or.u	 r13,r0,hi16(_truncxfsf2_libfunc)
	bb0.n	 ne,r12,@L595
	or.u	 r13,r0,hi16(_truncxfdf2_libfunc)
	br	 @L575
	align	 4
@L594:
	ld	 r2,r13,lo16(_truncxfsf2_libfunc)
	br	 @L575
	align	 4
@L595:
	ld	 r2,r13,lo16(_truncxfdf2_libfunc)
	br	 @L575
	align	 4
@L598:
	bb0.n	 ne,r10,@L600
	or.u	 r13,r0,hi16(_trunctfsf2_libfunc)
	bb0.n	 ne,r12,@L601
	or.u	 r13,r0,hi16(_trunctfdf2_libfunc)
	br	 @L575
	align	 4
@L600:
	ld	 r2,r13,lo16(_trunctfsf2_libfunc)
	br	 @L575
	align	 4
@L601:
	ld	 r2,r13,lo16(_trunctfdf2_libfunc)
@L575:
	bcnd.n	 ne0,r2,@L607
	or	 r3,r0,1
	bsr	 _abort
	align	 4
@L607:
	or	 r4,r0,r21
	or	 r5,r0,1
	or	 r6,r0,r23
	bsr.n	 _emit_library_call
	or	 r7,r0,r22
	or	 r2,r0,r21
	bsr.n	 _hard_libcall_value
	addu	 r1,r1,@L723
@L724:
	align	 4
@L568:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r24,r13,lo16(_mode_size)
	ld	 r13,r24[r22]
	ld	 r12,r24[r21]
	mak	 r13,r13,0<3>
	mak	 r11,r12,0<3>
	cmp	 r13,r13,r11
	bb1.n	 ge,r13,@L705
	or.u	 r13,r0,hi16(_mode_size)
	cmp	 r13,r11,32
	bb0.n	 gt,r13,@L608
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L609
	addu	 r13,r12,6
@L609:
	or	 r2,r0,r21
	or	 r3,r0,r22
	or	 r4,r0,r19
	bsr.n	 _can_extend_p
	ext	 r18,r13,0<2>
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb1.n	 ne,r13,@L706
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r24[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L612
	or.u	 r24,r0,hi16(_word_mode)
	or	 r2,r0,r21
	ld	 r3,r24,lo16(_word_mode)
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0	 ne,r13,@L612
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	or	 r3,r0,r23
	bsr.n	 _convert_move
	or	 r4,r0,r19
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	or	 r4,r0,r2
	or	 r2,r0,r25
	br.n	 @L693
	or	 r3,r0,r20
	align	 4
@L612:
	bsr	 _start_sequence
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L614
	or	 r25,r0,r22
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r25,r13,lo16(_word_mode)
	br.n	 @L707
	or	 r2,r0,r25
	align	 4
@L614:
	or	 r2,r0,r25
@L707:
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,r19
	or	 r24,r0,r2
	or	 r2,r0,r25
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
	bcnd.n	 eq0,r19,@L618
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r24,r13,lo16(_const0_rtx)
	br.n	 @L708
	or.u	 r13,r0,hi16(_mode_size)
	align	 4
@L618:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r2,r13[r25]
	mak	 r2,r2,0<3>
	bsr.n	 _size_int
	subu	 r2,r2,1
	or	 r5,r0,r2
	or	 r2,r0,78
	or	 r3,r0,r25
	or	 r4,r0,r24
	or	 r6,r0,0
	bsr.n	 _expand_shift
	or	 r7,r0,0
	or	 r24,r0,r2
	or.u	 r13,r0,hi16(_word_mode)
	or	 r4,r0,1
	ld	 r2,r13,lo16(_word_mode)
	bsr.n	 _convert_to_mode
	or	 r3,r0,r24
	or	 r24,r0,r2
	or.u	 r13,r0,hi16(_mode_size)
@L708:
	or	 r13,r13,lo16(_mode_size)
	ld	 r2,r13[r25]
	bcnd	 ge0,r2,@L620
	addu	 r2,r2,3
@L620:
	ext	 r22,r2,0<2>
	cmp	 r13,r22,r18
	bb0.n	 lt,r13,@L622
	subu	 r13,r18,r22
	mask	 r12,r13,3
	bcnd.n	 eq0,r12,@L624
	subu	 r25,r18,r22
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L660
	cmp	 r13,r12,2
	bb0.n	 gt,r13,@L661
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L665
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L665:
	bb1	 eq,r13,@L663
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L663:
	addu	 r22,r22,1
@L661:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L669
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L669:
	bb1	 eq,r13,@L667
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L667:
	addu	 r22,r22,1
@L660:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L673
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L673:
	bb1	 eq,r13,@L671
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L671:
	addu	 r22,r22,1
	cmp	 r13,r22,r18
	bb0	 lt,r13,@L622
@L624:
	or	 r2,r0,r20
@L709:
	subu	 r3,r25,1
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L677
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L677:
	bb1	 eq,r13,@L675
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L675:
	or	 r2,r0,r20
	subu	 r3,r25,2
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L681
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L681:
	bb1	 eq,r13,@L679
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L679:
	or	 r2,r0,r20
	subu	 r3,r25,3
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L685
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L685:
	bb1	 eq,r13,@L683
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L683:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,4
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L689
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L689:
	bb1	 eq,r13,@L687
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L687:
	addu	 r22,r22,4
	cmp	 r13,r22,r18
	bb1.n	 lt,r13,@L709
	or	 r2,r0,r20
@L622:
	bsr	 _get_insns
	bsr.n	 _end_sequence
	or	 r25,r0,r2
	or	 r2,r0,r16
	or	 r3,r0,r21
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r6,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,r20
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _emit_no_conflict_block
	addu	 r1,r1,@L725
@L726:
	align	 4
@L608:
	or.u	 r13,r0,hi16(_mode_size)
@L705:
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,32
	bb0.n	 gt,r13,@L628
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r2,r13,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	or	 r2,r0,r20
	br.n	 @L694
	or	 r4,r0,0
	align	 4
@L628:
	cmp	 r13,r21,3
	bb1.n	 ne,r13,@L629
	cmp	 r13,r22,3
	cmp	 r13,r22,4
	bb0.n	 ne,r13,@L630
	or	 r2,r0,4
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,r19
@L630:
	bsr	 _abort
	align	 4
@L629:
	bb1.n	 ne,r13,@L710
	or.u	 r13,r0,hi16(_mode_size)
	cmp	 r13,r21,4
	bb0.n	 ne,r13,@L632
	or	 r2,r0,4
	or	 r3,r0,r23
	or	 r4,r0,r19
	bsr.n	 _convert_to_mode
	or	 r22,r0,4
	br.n	 @L631
	or	 r23,r0,r2
	align	 4
@L632:
	bsr	 _abort
	align	 4
@L631:
	or.u	 r13,r0,hi16(_mode_size)
@L710:
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r21]
	ld	 r13,r13[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb1.n	 ge,r12,@L711
	or.u	 r13,r0,hi16(_mode_size)
	ld	 r13,r0,r23
	or.u	 r12,r0,0x37
	and	 r13,r13,0x10
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L636
	or.u	 r13,r0,hi16(_direct_load)
	or	 r13,r13,lo16(_direct_load)
	ld.b	 r13,r21,r13
	bcnd	 eq0,r13,@L636
	bsr.n	 _mode_dependent_address_p
	ld	 r2,r23,4
	bcnd.n	 eq0,r2,@L712
	or	 r2,r0,r21
@L636:
	ld.hu	 r13,r0,r23
	cmp	 r12,r13,51
	cmp	 r13,r13,53
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L634
	or	 r2,r0,r21
@L712:
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	addu	 r1,r1,@L727
@L728:
	align	 4
@L634:
	or.u	 r13,r0,hi16(_mode_size)
@L711:
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r21]
	ld	 r13,r13[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb0.n	 gt,r12,@L637
	or	 r2,r0,r21
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0.n	 ne,r13,@L638
	or.u	 r13,r0,hi16(_optimize)
@L706:
	ld	 r13,r13,lo16(_optimize)
	bcnd	 le0,r13,@L639
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L713
	or	 r2,r0,r25
	or	 r2,r0,r22
	bsr.n	 _force_reg
	or	 r3,r0,r23
	or	 r23,r0,r2
@L639:
	or	 r2,r0,r25
@L713:
	or	 r3,r0,r20
	or	 r4,r0,r23
@L693:
	or	 r5,r0,r16
	bsr.n	 _emit_unop_insn
	addu	 r1,r1,@L729
@L730:
	align	 4
@L638:
	or	 r25,r0,r22
	bcnd.n	 eq0,r25,@L642
	or.u	 r13,r0,hi16(_mode_wider_mode)
	or	 r24,r13,lo16(_mode_wider_mode)
	or	 r2,r0,r21
@L714:
	or	 r3,r0,r25
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	cmp	 r2,r2,210
	bb1.n	 eq,r2,@L643
	or	 r2,r0,r25
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	cmp	 r2,r2,210
	bb0.n	 eq,r2,@L656
	or	 r2,r0,r25
@L643:
	ld	 r25,r24[r25]
	bcnd.n	 ne0,r25,@L714
	or	 r2,r0,r21
@L642:
	bsr	 _abort
	align	 4
@L637:
	cmp	 r13,r22,6
	extu	 r11,r13,1<eq>
	cmp	 r13,r21,4
	extu	 r13,r13,1<eq>
	and	 r13,r11,r13
	bcnd.n	 eq0,r13,@L647
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L731
@L732:
	align	 4
@L647:
	cmp	 r13,r21,2
	extu	 r9,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L648
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L733
@L734:
	align	 4
@L648:
	cmp	 r13,r21,1
	extu	 r10,r13,1<eq>
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L649
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L735
@L736:
	align	 4
@L649:
	cmp	 r13,r22,4
	extu	 r11,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L650
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L737
@L738:
	align	 4
@L650:
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L651
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L739
@L740:
	align	 4
@L651:
	cmp	 r13,r22,2
	extu	 r13,r13,1<eq>
	and	 r13,r13,r10
	bcnd.n	 eq0,r13,@L652
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L741
@L742:
	align	 4
@L652:
	bb1.n	 ge,r12,@L653
	or	 r2,r0,r21
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	bsr.n	 _force_reg
	or	 r2,r0,r21
@L692:
	or	 r3,r0,r2
	or	 r2,r0,r20
	bsr.n	 _emit_move_insn
	addu	 r1,r1,@L743
@L744:
	align	 4
@L653:
	bsr	 _abort
	align	 4
@L656:
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,r19
@L695:
	or	 r3,r0,r2
	or	 r2,r0,r20
	or	 r4,r0,r19
@L694:
	bsr	 _convert_move
@L542:
	or	 r2,r0,r17
@L654:
@Lte9:
	ld	 r1,r31,80
	ld	 r15,r31,36
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	jmp.n	 r1
	addu	 r31,r31,96
	def	 @L743,@L542-@L744
	def	 @L741,@L695-@L742
	def	 @L739,@L695-@L740
	def	 @L737,@L695-@L738
	def	 @L735,@L695-@L736
	def	 @L733,@L695-@L734
	def	 @L731,@L695-@L732
	def	 @L729,@L542-@L730
	def	 @L727,@L692-@L728
	def	 @L725,@L542-@L726
	def	 @L723,@L692-@L724
	def	 @L721,@L542-@L722
	def	 @L719,@L542-@L720
	def	 @L717,@L654-@L718
	def	 @L715,@L654-@L716

	align	 8
_move_by_pieces_ninsns:
@Ltb10:
	cmp	 r9,r3,8
	cmp	 r8,r3,7
	or	 r9,r9,r8
	or	 r11,r0,0
	extu	 r9,r9,1<gt>
	bcnd.n	 eq0,r9,@L792
	or	 r6,r0,9
	or	 r3,r0,8
@L792:
	or.u	 r9,r0,hi16(_mode_size)
	or	 r12,r9,lo16(_mode_size)
	or.u	 r9,r0,hi16(_class_narrowest_mode+4)
@L811:
	ld	 r8,r9,lo16(_class_narrowest_mode+4)
	bcnd.n	 eq0,r8,@L797
	or	 r7,r0,0
	or.u	 r9,r0,hi16(_mode_wider_mode)
	or	 r13,r9,lo16(_mode_wider_mode)
@L799:
	ld	 r9,r12[r8]
	cmp	 r9,r9,r6
	bb1	 ge,r9,@L798
	or	 r7,r0,r8
@L798:
	ld	 r8,r13[r8]
	bcnd	 ne0,r8,@L799
@L797:
	bcnd.n	 eq0,r7,@L794
	or.u	 r9,r0,hi16(_mov_optab)
	ld	 r9,r9,lo16(_mov_optab)
	lda.d	 r9,r9[r7]
	ld	 r9,r9,4
	cmp	 r9,r9,210
	bb0	 ne,r9,@L803
	ld	 r8,r12[r7]
	cmp	 r9,r8,8
	bb1.n	 gt,r9,@L804
	cmp	 r9,r3,7
	cmp	 r9,r3,r8
	bb0	 ge,r9,@L803
	br	 @L810
	align	 4
@L804:
	bb0	 gt,r9,@L803
	ld	 r8,r12[r7]
@L810:
	divu	 r9,r2,r8
	bcnd	 ne0,r8,@L806
	tb0	 0,r0,503
@L806:
	bcnd.n	 ne0,r8,@L807
	addu	 r11,r11,r9
	tb0	 0,r0,503
@L807:
	mul	 r9,r9,r8
	subu	 r2,r2,r9
@L803:
	ld	 r6,r12[r7]
	cmp	 r9,r6,1
	bb1.n	 gt,r9,@L811
	or.u	 r9,r0,hi16(_class_narrowest_mode+4)
@L794:
	jmp.n	 r1
	or	 r2,r0,r11
@Lte10:

	align	 8
_move_by_pieces_1:
	subu	 r31,r31,80
	st	 r1,r31,64
	or.u	 r13,r0,hi16(_mode_size)
	st.d	 r20,r31,40
	or	 r21,r0,r3
	st.d	 r24,r31,56
	or	 r13,r13,lo16(_mode_size)
	st.d	 r22,r31,48
@Ltb11:
	or	 r24,r0,r4
	ld	 r22,r13[r21]
	ld	 r13,r24,32
	cmp	 r13,r13,r22
	bb0.n	 ge,r13,@L825
	or	 r20,r0,r2
@L826:
	ld	 r13,r24,40
	bcnd	 eq0,r13,@L827
	ld	 r13,r24,36
	subu	 r13,r13,r22
	st	 r13,r24,36
@L827:
	ld	 r13,r24,8
	bcnd	 eq0,r13,@L828
	ld	 r4,r24,4
	or	 r2,r0,55
	or	 r3,r0,r21
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L836
@L837:
	align	 4
@L828:
	ld	 r2,r24,4
	ld	 r3,r24,36
	bsr.n	 _plus_constant_wide
	ld	 r25,r0,r24
	or	 r4,r0,r2
	or	 r2,r0,r25
	bsr.n	 _change_address
	or	 r3,r0,r21
@L834:
	ld	 r13,r24,24
	bcnd.n	 eq0,r13,@L830
	or	 r23,r0,r2
	ld	 r4,r24,20
	or	 r2,r0,55
	or	 r3,r0,r21
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L838
@L839:
	align	 4
@L830:
	ld	 r2,r24,20
	ld	 r3,r24,36
	bsr.n	 _plus_constant_wide
	ld	 r25,r24,16
	or	 r4,r0,r2
	or	 r2,r0,r25
	bsr.n	 _change_address
	or	 r3,r0,r21
@L835:
	or	 r3,r0,r2
	jsr.n	 r20
	or	 r2,r0,r23
	bsr	 _emit_insn
	ld	 r13,r24,40
	bcnd	 ne0,r13,@L832
	ld	 r13,r24,36
	addu	 r13,r13,r22
	st	 r13,r24,36
@L832:
	ld	 r13,r24,32
	subu	 r13,r13,r22
	cmp	 r12,r13,r22
	bb1.n	 ge,r12,@L826
	st	 r13,r24,32
@L825:
@Lte11:
	ld	 r1,r31,64
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	jmp.n	 r1
	addu	 r31,r31,80
	def	 @L838,@L835-@L839
	def	 @L836,@L834-@L837

	align	 8
	global	 _emit_block_move
_emit_block_move:
	subu	 r31,r31,224
	st	 r1,r31,96
	st.d	 r24,r31,88
	st.d	 r22,r31,80
	st.d	 r20,r31,72
	st.d	 r18,r31,64
	st.d	 r16,r31,56
	st.d	 r14,r31,48
@Ltb12:
	st	 r2,r31,156
	st	 r3,r31,212
	ld.bu	 r13,r2,2
	or	 r16,r0,r4
	cmp	 r13,r13,16
	bb0.n	 ne,r13,@L841
	or	 r23,r0,r5
	bsr	 _abort
	align	 4
@L841:
	ld	 r14,r31,212
	ld.bu	 r13,r14,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L842
	bsr	 _abort
	align	 4
@L842:
	ld	 r18,r31,156
	ld.hu	 r12,r0,r18
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L1297
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L847
	cmp	 r13,r12,63
	ld	 r2,r18,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L848
	st	 r2,r18,4
	align	 4
@L847:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L848
	ld	 r14,r31,156
	ld	 r2,r14,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r14,4
	ld	 r2,r14,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r14,8
@L848:
	ld	 r2,r31,156
	br	 @L843
	align	 4
@L1297:
	ld	 r13,r18,8
	bcnd	 ne0,r13,@L850
	ld	 r2,r18,4
	br	 @L843
	align	 4
@L850:
	ld	 r14,r31,156
	ld	 r2,r14,12
	bcnd	 ne0,r2,@L843
	ld	 r18,r31,156
	ld	 r13,r18,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r18,4
	bsr.n	 _gen_move_insn
	st	 r2,r18,12
	bsr.n	 _emit_insn_before
	ld	 r3,r18,8
	ld	 r2,r18,12
@L843:
	ld	 r14,r31,212
	ld.hu	 r12,r0,r14
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L853
	st	 r2,r31,156
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L1261
	cmp	 r13,r12,63
	ld.bu	 r13,r14,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L854
	ld	 r24,r14,4
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L854
	ld	 r13,r24,4
	st	 r13,r14,4
	ld	 r13,r24,8
	bcnd	 eq0,r13,@L857
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r14,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	ld	 r3,r31,212
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	br.n	 @L852
	or	 r2,r0,r25
	align	 4
@L854:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L856
	cmp	 r13,r12,63
	ld	 r18,r31,212
	ld	 r2,r18,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L857
	st	 r2,r18,4
	align	 4
@L856:
@L1261:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L857
	ld	 r14,r31,212
	ld	 r2,r14,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r14,4
	ld	 r2,r14,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r14,8
@L857:
	ld	 r2,r31,212
	br	 @L852
	align	 4
@L853:
	ld	 r18,r31,212
	ld	 r13,r18,8
	bcnd	 ne0,r13,@L859
	ld	 r2,r18,4
	br	 @L852
	align	 4
@L859:
	ld	 r14,r31,212
	ld	 r2,r14,12
	bcnd	 ne0,r2,@L852
	ld	 r18,r31,212
	ld	 r13,r18,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r18,4
	bsr.n	 _gen_move_insn
	st	 r2,r18,12
	bsr.n	 _emit_insn_before
	ld	 r3,r18,8
	ld	 r2,r18,12
@L852:
	ld.hu	 r12,r0,r16
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L862
	st	 r2,r31,212
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L1262
	cmp	 r13,r12,63
	ld.bu	 r13,r16,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L863
	ld	 r24,r16,4
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L863
	ld	 r13,r24,4
	st	 r13,r16,4
	ld	 r13,r24,8
	bcnd.n	 eq0,r13,@L861
	or	 r3,r0,r16
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r16,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r16
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	br.n	 @L861
	or	 r3,r0,r25
	align	 4
@L863:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L865
	cmp	 r13,r12,63
	ld	 r2,r16,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L866
	st	 r2,r16,4
	align	 4
@L865:
@L1262:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L866
	ld	 r2,r16,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r16,4
	ld	 r2,r16,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r16,8
@L866:
	br.n	 @L861
	or	 r3,r0,r16
	align	 4
@L862:
	ld	 r13,r16,8
	bcnd	 ne0,r13,@L868
	ld	 r3,r16,4
	br	 @L861
	align	 4
@L868:
	ld	 r3,r16,12
	bcnd	 ne0,r3,@L861
	ld	 r13,r16,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r16,4
	bsr.n	 _gen_move_insn
	st	 r2,r16,12
	bsr.n	 _emit_insn_before
	ld	 r3,r16,8
	ld	 r3,r16,12
@L861:
	ld	 r14,r31,156
	ld.hu	 r13,r0,r14
	cmp	 r13,r13,55
	bb0.n	 ne,r13,@L870
	or	 r16,r0,r3
	bsr	 _abort
	align	 4
@L870:
	ld	 r18,r31,212
	ld.hu	 r13,r0,r18
	cmp	 r13,r13,55
	bb0	 ne,r13,@L871
	bsr	 _abort
	align	 4
@L871:
	bcnd	 ne0,r16,@L872
	bsr	 _abort
	align	 4
@L872:
	ld.hu	 r13,r0,r16
	cmp	 r13,r13,46
	bb1.n	 ne,r13,@L1263
	or	 r2,r0,46
	ld	 r7,r16,4
	cmp	 r13,r23,8
	cmp	 r12,r23,7
	or	 r5,r0,r23
	or	 r13,r13,r12
	or	 r6,r0,0
	extu	 r13,r13,1<gt>
	bcnd.n	 eq0,r13,@L875
	or	 r10,r0,9
	or	 r5,r0,8
@L875:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r8,r13,lo16(_mode_size)
	or.u	 r13,r0,hi16(_class_narrowest_mode+4)
@L1265:
	ld	 r12,r13,lo16(_class_narrowest_mode+4)
	bcnd.n	 eq0,r12,@L880
	or	 r11,r0,0
	or.u	 r13,r0,hi16(_mode_wider_mode)
	or	 r9,r13,lo16(_mode_wider_mode)
@L882:
	ld	 r13,r8[r12]
	cmp	 r13,r13,r10
	bb1	 ge,r13,@L881
	or	 r11,r0,r12
@L881:
	ld	 r12,r9[r12]
	bcnd	 ne0,r12,@L882
@L880:
	bcnd.n	 eq0,r11,@L877
	or.u	 r13,r0,hi16(_mov_optab)
	ld	 r13,r13,lo16(_mov_optab)
	lda.d	 r13,r13[r11]
	ld	 r13,r13,4
	cmp	 r13,r13,210
	bb0	 ne,r13,@L886
	ld	 r12,r8[r11]
	cmp	 r13,r12,8
	bb1.n	 gt,r13,@L887
	cmp	 r13,r5,7
	cmp	 r13,r5,r12
	bb0	 ge,r13,@L886
	br	 @L1264
	align	 4
@L887:
	bb0	 gt,r13,@L886
	ld	 r12,r8[r11]
@L1264:
	divu	 r13,r7,r12
	bcnd	 ne0,r12,@L889
	tb0	 0,r0,503
@L889:
	bcnd.n	 ne0,r12,@L890
	addu	 r6,r6,r13
	tb0	 0,r0,503
@L890:
	mul	 r13,r13,r12
	subu	 r7,r7,r13
@L886:
	ld	 r10,r8[r11]
	cmp	 r13,r10,1
	bb1.n	 gt,r13,@L1265
	or.u	 r13,r0,hi16(_class_narrowest_mode+4)
@L877:
	cmp	 r13,r6,1
	bb1.n	 gt,r13,@L873
	or	 r2,r0,46
	ld	 r2,r16,4
	ld	 r14,r31,156
	ld	 r18,r31,212
	ld	 r24,r14,4
	ld	 r25,r18,4
	st	 r0,r31,140
	st	 r24,r31,108
	st	 r25,r31,124
	st	 r14,r31,104
	st	 r18,r31,120
	ld.hu	 r11,r0,r24
	subu	 r13,r11,85
	or	 r22,r0,r23
	mask	 r13,r13,0xffff
	or	 r23,r0,9
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L894
	or	 r12,r0,0
	subu	 r13,r11,87
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb0	 ls,r13,@L893
@L894:
	or	 r12,r0,1
@L893:
	st	 r12,r31,112
	ld.hu	 r12,r0,r25
	subu	 r13,r12,85
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L896
	or	 r11,r0,0
	subu	 r13,r12,87
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb0	 ls,r13,@L895
@L896:
	or	 r11,r0,1
@L895:
	st	 r11,r31,128
	st	 r0,r31,132
	st	 r0,r31,116
	ld.hu	 r13,r0,r24
	cmp	 r12,r13,85
	cmp	 r13,r13,87
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L897
	st	 r12,r31,144
	st	 r2,r31,140
@L897:
	bcnd.n	 eq0,r11,@L899
	st	 r2,r31,136
	ld	 r13,r31,112
	bcnd.n	 ne0,r13,@L1266
	cmp	 r13,r22,8
@L899:
	bsr.n	 _move_by_pieces_ninsns
	or	 r3,r0,r22
	cmp	 r2,r2,2
	bb0.n	 gt,r2,@L1266
	cmp	 r13,r22,8
	ld	 r13,r31,128
	bcnd	 ne0,r13,@L900
	ld.hu	 r12,r0,r25
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L901
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L901
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L900
@L901:
	bsr.n	 _copy_addr_to_reg
	or	 r2,r0,r25
	st	 r2,r31,124
@L900:
	ld	 r13,r31,112
	bcnd.n	 ne0,r13,@L1266
	cmp	 r13,r22,8
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L903
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L903
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L1266
	cmp	 r13,r22,8
@L903:
	bsr.n	 _copy_addr_to_reg
	or	 r2,r0,r24
	st	 r2,r31,108
	cmp	 r13,r22,8
@L1266:
	cmp	 r12,r22,7
	or	 r13,r13,r12
	extu	 r13,r13,1<gt>
	bcnd	 eq0,r13,@L904
	or	 r22,r0,8
@L904:
	cmp	 r13,r23,1
	bb0.n	 gt,r13,@L906
	or.u	 r13,r0,hi16(_mode_size)
	or	 r24,r13,lo16(_mode_size)
	or.u	 r13,r0,hi16(_class_narrowest_mode+4)
@L1268:
	ld	 r12,r13,lo16(_class_narrowest_mode+4)
	bcnd.n	 eq0,r12,@L909
	or	 r25,r0,0
	or.u	 r13,r0,hi16(_mode_wider_mode)
	or	 r11,r13,lo16(_mode_wider_mode)
@L911:
	ld	 r13,r24[r12]
	cmp	 r13,r13,r23
	bb1	 ge,r13,@L910
	or	 r25,r0,r12
@L910:
	ld	 r12,r11[r12]
	bcnd	 ne0,r12,@L911
@L909:
	bcnd.n	 eq0,r25,@L906
	or.u	 r13,r0,hi16(_mov_optab)
	ld	 r13,r13,lo16(_mov_optab)
	lda.d	 r13,r13[r25]
	ld	 r11,r13,4
	cmp	 r13,r11,210
	bb0	 ne,r13,@L915
	ld	 r12,r24[r25]
	cmp	 r13,r12,8
	bb1.n	 gt,r13,@L916
	cmp	 r13,r22,7
	cmp	 r13,r22,r12
	bb1.n	 ge,r13,@L1267
	or.u	 r13,r0,hi16(_insn_gen_function)
	br	 @L915
	align	 4
@L916:
	bb0.n	 gt,r13,@L915
	or.u	 r13,r0,hi16(_insn_gen_function)
@L1267:
	or	 r13,r13,lo16(_insn_gen_function)
	or	 r3,r0,r25
	ld	 r2,r13[r11]
	bsr.n	 _move_by_pieces_1
	addu	 r4,r31,104
@L915:
	ld	 r23,r24[r25]
	cmp	 r13,r23,1
	bb1.n	 gt,r13,@L1268
	or.u	 r13,r0,hi16(_class_narrowest_mode+4)
@L906:
	ld	 r13,r31,136
	bcnd	 eq0,r13,@L840
	bsr	 _abort
	align	 4
@L873:
@L1263:
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or.u	 r13,r0,hi16(_class_narrowest_mode+4)
	ld	 r17,r13,lo16(_class_narrowest_mode+4)
	bcnd.n	 eq0,r17,@L922
	st	 r2,r31,164
	or.u	 r13,r0,hi16(_mode_size)
	or.u	 r12,r0,hi16(_mode_class)
	or	 r15,r13,lo16(_mode_size)
	or.u	 r13,r0,hi16(_movstr_optab)
@L1281:
	or	 r13,r13,lo16(_movstr_optab)
	ld	 r13,r13[r17]
	st	 r13,r31,172
	cmp	 r13,r13,210
	bb0.n	 ne,r13,@L1269
	or.u	 r13,r0,hi16(_mode_wider_mode)
	ld	 r13,r15[r17]
	mak	 r12,r13,0<3>
	cmp	 r13,r12,31
	ld	 r11,r16,4
	bb1.n	 gt,r13,@L927
	or	 r13,r0,1
	mak	 r13,r13,r12
	subu	 r13,r13,1
	cmp	 r13,r11,r13
	bb0.n	 ls,r13,@L1269
	or.u	 r13,r0,hi16(_mode_wider_mode)
@L927:
	ld	 r14,r31,172
	mul	 r25,r14,40
	or.u	 r13,r0,hi16(_insn_operand_predicate)
	or	 r24,r13,lo16(_insn_operand_predicate)
	ld	 r13,r25,r24
	bcnd	 eq0,r13,@L928
	ld	 r2,r31,156
	jsr.n	 r13
	or	 r3,r0,16
	bcnd.n	 eq0,r2,@L1269
	or.u	 r13,r0,hi16(_mode_wider_mode)
@L928:
	addu	 r25,r25,r24
	ld	 r13,r25,4
	bcnd	 eq0,r13,@L929
	ld	 r2,r31,212
	jsr.n	 r13
	or	 r3,r0,16
	bcnd.n	 eq0,r2,@L1269
	or.u	 r13,r0,hi16(_mode_wider_mode)
@L929:
	ld	 r13,r25,12
	bcnd	 eq0,r13,@L930
	ld	 r2,r31,164
	jsr.n	 r13
	or	 r3,r0,0
	bcnd.n	 eq0,r2,@L1269
	or.u	 r13,r0,hi16(_mode_wider_mode)
@L930:
	bsr.n	 _get_last_insn
	or	 r25,r0,r16
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
	ld	 r11,r0,r16
	and	 r13,r11,0x8
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L932
	st	 r2,r31,180
	ld	 r13,r16,4
	ld.bu	 r13,r13,2
	ld	 r12,r15[r17]
	ld	 r13,r15[r13]
	cmp	 r13,r13,r12
	bb0	 ge,r13,@L932
	bb0.n	 (31-26),r11,@L932
	or	 r2,r0,r17
	bsr.n	 _gen_lowpart
	or	 r3,r0,r16
	or	 r25,r0,r2
@L932:
	ld.bu	 r13,r25,2
	cmp	 r13,r17,r13
	bb0.n	 ne,r13,@L931
	or.u	 r18,r0,hi16(_mode_class)
	or	 r18,r18,lo16(_mode_class)
	ld	 r13,r18[r17]
	cmp	 r13,r13,1
	bb1	 ne,r13,@L934
	ld	 r13,r15[r17]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,64
	bb1	 ne,r13,@L934
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,46
	bb1	 ne,r13,@L1173
	ld	 r2,r25,4
	bcnd.n	 ge0,r2,@L934
	or	 r3,r0,0
	bsr.n	 _immed_double_const
	or	 r4,r0,r17
	br.n	 @L931
	or	 r25,r0,r2
	align	 4
@L934:
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,46
	bb0.n	 ne,r13,@L1270
	or	 r2,r0,r17
@L1173:
	or.u	 r14,r0,hi16(_mode_class)
	or	 r14,r14,lo16(_mode_class)
	ld	 r13,r14[r17]
	cmp	 r13,r13,1
	bb1	 ne,r13,@L935
	ld.bu	 r12,r25,2
	ld	 r13,r14[r12]
	cmp	 r13,r13,1
	bb1	 ne,r13,@L935
	ld.hu	 r11,r0,r25
	cmp	 r13,r11,47
	bb0	 ne,r13,@L936
	ld	 r13,r15[r17]
	ld	 r12,r15[r12]
	cmp	 r13,r13,r12
	bb1	 gt,r13,@L935
	ld	 r13,r0,r25
	or.u	 r12,r0,0x37
	and	 r13,r13,0x10
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L1271
	cmp	 r13,r11,51
	or.u	 r13,r0,hi16(_direct_load)
	or	 r13,r13,lo16(_direct_load)
	ld.b	 r13,r17,r13
	bcnd.n	 ne0,r13,@L1270
	or	 r2,r0,r17
	cmp	 r13,r11,51
@L1271:
	bb1	 ne,r13,@L935
@L936:
	or	 r2,r0,r17
@L1270:
	bsr.n	 _gen_lowpart
	or	 r3,r0,r25
	br.n	 @L931
	or	 r25,r0,r2
	align	 4
@L935:
	bsr.n	 _gen_reg_rtx
	or	 r2,r0,r17
	or	 r19,r0,r2
	or	 r23,r0,r25
	or.u	 r18,r0,hi16(_mode_class)
	ld.bu	 r21,r19,2
	or	 r18,r18,lo16(_mode_class)
	ld.bu	 r22,r23,2
	ld	 r13,r18[r21]
	ld	 r12,r18[r22]
	cmp	 r13,r13,2
	extu	 r13,r13,1<eq>
	st	 r13,r31,196
	cmp	 r12,r12,2
	ld.hu	 r11,r0,r19
	or	 r20,r0,r19
	extu	 r12,r12,1<eq>
	cmp	 r13,r11,59
	bb0.n	 ne,r13,@L942
	st	 r12,r31,188
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L945
	cmp	 r13,r11,63
	ld	 r2,r19,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L946
	st	 r2,r19,4
	align	 4
@L945:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L946
	ld	 r2,r19,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r19,4
	ld	 r2,r19,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r19,8
@L946:
	br.n	 @L941
	or	 r2,r0,r20
	align	 4
@L942:
	ld	 r13,r19,8
	bcnd	 ne0,r13,@L948
	ld	 r2,r19,4
	br	 @L941
	align	 4
@L948:
	ld	 r2,r19,12
	bcnd	 ne0,r2,@L941
	ld	 r13,r19,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r19,4
	bsr.n	 _gen_move_insn
	st	 r2,r19,12
	bsr.n	 _emit_insn_before
	ld	 r3,r19,8
	ld	 r2,r19,12
@L941:
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L951
	or	 r20,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L1272
	cmp	 r13,r12,63
	ld.bu	 r13,r23,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L952
	ld	 r24,r23,4
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L952
	ld	 r13,r24,4
	st	 r13,r23,4
	ld	 r13,r24,8
	bcnd	 eq0,r13,@L955
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r23,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r23
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	br.n	 @L950
	or	 r2,r0,r25
	align	 4
@L952:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L954
	cmp	 r13,r12,63
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L955
	st	 r2,r23,4
	align	 4
@L954:
@L1272:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L955
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,4
	ld	 r2,r23,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,8
@L955:
	br.n	 @L950
	or	 r2,r0,r23
	align	 4
@L951:
	ld	 r13,r23,8
	bcnd	 ne0,r13,@L957
	ld	 r2,r23,4
	br	 @L950
	align	 4
@L957:
	ld	 r2,r23,12
	bcnd	 ne0,r2,@L950
	ld	 r13,r23,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r23,4
	bsr.n	 _gen_move_insn
	st	 r2,r23,12
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	ld	 r2,r23,12
@L950:
	ld	 r14,r31,196
	ld	 r18,r31,188
	cmp	 r13,r14,r18
	bb0.n	 ne,r13,@L959
	or	 r23,r0,r2
	bsr	 _abort
	align	 4
@L959:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
	ld	 r11,r0,r23
	and	 r13,r11,0x8
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L1273
	ld	 r13,r23,4
	ld.bu	 r13,r13,2
	ld	 r12,r15[r21]
	ld	 r13,r15[r13]
	cmp	 r13,r13,r12
	bb0	 ge,r13,@L960
	bb0.n	 (31-26),r11,@L960
	or	 r2,r0,r21
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	or	 r22,r0,r21
	or	 r23,r0,r2
@L960:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
@L1273:
	ld	 r13,r0,r20
	and	 r13,r13,0x8
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L961
	cmp	 r13,r21,r22
	bsr	 _abort
	align	 4
@L961:
	bb0.n	 ne,r13,@L1274
	or	 r2,r0,r20
	bcnd	 ne0,r22,@L962
	ld.hu	 r12,r0,r23
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1274
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1274
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L962
@L1274:
	or	 r3,r0,r23
	bsr.n	 _emit_move_insn
	addu	 r1,r1,@L1298
@L1299:
	align	 4
@L962:
	ld	 r14,r31,196
	bcnd.n	 eq0,r14,@L964
	cmp	 r5,r22,8
	cmp	 r13,r21,9
	extu	 r11,r5,1<eq>
	extu	 r7,r13,1<eq>
	and	 r13,r11,r7
	bcnd.n	 ne0,r13,@L1249
	or	 r2,r0,108
	cmp	 r6,r21,11
	extu	 r12,r6,1<eq>
	and	 r13,r11,r12
	bcnd.n	 ne0,r13,@L1249
	or	 r2,r0,109
	cmp	 r8,r22,9
	extu	 r10,r8,1<eq>
	and	 r13,r10,r12
	bcnd.n	 eq0,r13,@L967
	cmp	 r4,r21,11
	br.n	 @L1249
	or	 r2,r0,110
	align	 4
@L967:
	cmp	 r9,r21,8
	extu	 r11,r9,1<eq>
	and	 r13,r10,r11
	bcnd.n	 ne0,r13,@L1249
	or	 r2,r0,111
	cmp	 r10,r22,11
	extu	 r12,r10,1<eq>
	and	 r13,r12,r11
	bcnd.n	 ne0,r13,@L1249
	or	 r2,r0,112
	and	 r13,r12,r7
	bcnd.n	 eq0,r13,@L970
	cmp	 r12,r21,9
	or	 r2,r0,113
@L1249:
	or	 r3,r0,r20
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _emit_unop_insn
	addu	 r1,r1,@L1300
@L1301:
	align	 4
@L970:
	bb0.n	 ne,r8,@L980
	or	 r2,r0,0
	bb0.n	 ls,r8,@L1002
	cmp	 r13,r22,10
	bb0.n	 ne,r5,@L972
	cmp	 r13,r21,10
	br	 @L971
	align	 4
@L1002:
	bb0	 ne,r13,@L988
	bb0	 ne,r10,@L994
	br	 @L971
	align	 4
@L972:
	bb0	 ne,r13,@L975
	bb0	 ls,r13,@L979
	bb0.n	 ne,r12,@L974
	or.u	 r13,r0,hi16(_extendsfdf2_libfunc)
	br	 @L971
	align	 4
@L979:
	bb0.n	 ne,r4,@L976
	or.u	 r13,r0,hi16(_extendsftf2_libfunc)
	br	 @L971
	align	 4
@L974:
	ld	 r2,r13,lo16(_extendsfdf2_libfunc)
	br	 @L971
	align	 4
@L975:
	or.u	 r13,r0,hi16(_extendsfxf2_libfunc)
	ld	 r2,r13,lo16(_extendsfxf2_libfunc)
	br	 @L971
	align	 4
@L976:
	ld	 r2,r13,lo16(_extendsftf2_libfunc)
	br	 @L971
	align	 4
@L980:
	cmp	 r13,r21,10
	bb0	 ne,r13,@L983
	bb0	 ls,r13,@L987
	bb0.n	 ne,r9,@L982
	or.u	 r13,r0,hi16(_truncdfsf2_libfunc)
	br	 @L971
	align	 4
@L987:
	bb0.n	 ne,r6,@L984
	or.u	 r13,r0,hi16(_extenddftf2_libfunc)
	br	 @L971
	align	 4
@L982:
	ld	 r2,r13,lo16(_truncdfsf2_libfunc)
	br	 @L971
	align	 4
@L983:
	or.u	 r13,r0,hi16(_extenddfxf2_libfunc)
	ld	 r2,r13,lo16(_extenddfxf2_libfunc)
	br	 @L971
	align	 4
@L984:
	ld	 r2,r13,lo16(_extenddftf2_libfunc)
	br	 @L971
	align	 4
@L988:
	bb0.n	 ne,r9,@L990
	or.u	 r13,r0,hi16(_truncxfsf2_libfunc)
	bb0.n	 ne,r12,@L991
	or.u	 r13,r0,hi16(_truncxfdf2_libfunc)
	br	 @L971
	align	 4
@L990:
	ld	 r2,r13,lo16(_truncxfsf2_libfunc)
	br	 @L971
	align	 4
@L991:
	ld	 r2,r13,lo16(_truncxfdf2_libfunc)
	br	 @L971
	align	 4
@L994:
	bb0.n	 ne,r9,@L996
	or.u	 r13,r0,hi16(_trunctfsf2_libfunc)
	bb0.n	 ne,r12,@L997
	or.u	 r13,r0,hi16(_trunctfdf2_libfunc)
	br	 @L971
	align	 4
@L996:
	ld	 r2,r13,lo16(_trunctfsf2_libfunc)
	br	 @L971
	align	 4
@L997:
	ld	 r2,r13,lo16(_trunctfdf2_libfunc)
@L971:
	bcnd.n	 ne0,r2,@L1003
	or	 r3,r0,1
	bsr	 _abort
	align	 4
@L1003:
	or	 r4,r0,r21
	or	 r5,r0,1
	or	 r6,r0,r23
	bsr.n	 _emit_library_call
	or	 r7,r0,r22
	or	 r2,r0,r21
	bsr.n	 _hard_libcall_value
	addu	 r1,r1,@L1302
@L1303:
	align	 4
@L964:
	ld	 r13,r15[r22]
	ld	 r11,r15[r21]
	mak	 r13,r13,0<3>
	mak	 r12,r11,0<3>
	cmp	 r13,r13,r12
	bb1.n	 ge,r13,@L1004
	cmp	 r13,r12,32
	bb0.n	 gt,r13,@L1004
	addu	 r13,r11,3
	bcnd	 ge0,r13,@L1005
	addu	 r13,r11,6
@L1005:
	ext	 r13,r13,0<2>
	or	 r2,r0,r21
	or	 r3,r0,r22
	or	 r4,r0,1
	bsr.n	 _can_extend_p
	st	 r13,r31,196
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb1.n	 ne,r13,@L1275
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r15[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L1008
	or.u	 r24,r0,hi16(_word_mode)
	or	 r2,r0,r21
	ld	 r3,r24,lo16(_word_mode)
	bsr.n	 _can_extend_p
	or	 r4,r0,1
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0	 ne,r13,@L1008
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	or	 r3,r0,r23
	bsr.n	 _convert_move
	or	 r4,r0,1
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	or	 r4,r0,r2
	or	 r2,r0,r25
	br.n	 @L1251
	or	 r3,r0,r20
	align	 4
@L1008:
	bsr	 _start_sequence
	ld	 r13,r15[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L1010
	or	 r24,r0,r22
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r24,r13,lo16(_word_mode)
	br.n	 @L1276
	or	 r2,r0,r24
	align	 4
@L1010:
	or	 r2,r0,r24
@L1276:
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,1
	or	 r25,r0,r2
	or	 r2,r0,r24
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	bsr.n	 _emit_move_insn
	or	 r3,r0,r25
	ld	 r2,r15[r24]
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r24,r13,lo16(_const0_rtx)
	bcnd	 ge0,r2,@L1016
	addu	 r2,r2,3
@L1016:
	ld	 r18,r31,196
	ext	 r22,r2,0<2>
	cmp	 r13,r22,r18
	bb0.n	 lt,r13,@L1018
	subu	 r13,r18,r22
	mask	 r12,r13,3
	bcnd.n	 eq0,r12,@L1020
	subu	 r25,r18,r22
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L1215
	cmp	 r13,r12,2
	bb0.n	 gt,r13,@L1216
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L1220
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L1220:
	bb1	 eq,r13,@L1218
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L1218:
	addu	 r22,r22,1
@L1216:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L1224
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L1224:
	bb1	 eq,r13,@L1222
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L1222:
	addu	 r22,r22,1
@L1215:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L1228
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L1228:
	bb1	 eq,r13,@L1226
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L1226:
	ld	 r14,r31,196
	addu	 r22,r22,1
	cmp	 r13,r22,r14
	bb0	 lt,r13,@L1018
@L1020:
	or	 r2,r0,r20
@L1277:
	subu	 r3,r25,1
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L1232
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L1232:
	bb1	 eq,r13,@L1230
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L1230:
	or	 r2,r0,r20
	subu	 r3,r25,2
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L1236
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L1236:
	bb1	 eq,r13,@L1234
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L1234:
	or	 r2,r0,r20
	subu	 r3,r25,3
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L1240
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L1240:
	bb1	 eq,r13,@L1238
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L1238:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,4
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L1244
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L1244:
	bb1	 eq,r13,@L1242
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L1242:
	ld	 r18,r31,196
	addu	 r22,r22,4
	cmp	 r13,r22,r18
	bb1.n	 lt,r13,@L1277
	or	 r2,r0,r20
@L1018:
	bsr	 _get_insns
	bsr.n	 _end_sequence
	or	 r25,r0,r2
	or	 r2,r0,100
	or	 r3,r0,r21
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r6,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,r20
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _emit_no_conflict_block
	addu	 r1,r1,@L1304
@L1305:
	align	 4
@L1004:
	ld	 r13,r15[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,32
	bb0.n	 gt,r13,@L1024
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r2,r13,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	or	 r2,r0,r20
	br.n	 @L1252
	or	 r4,r0,0
	align	 4
@L1024:
	cmp	 r13,r21,3
	bb1.n	 ne,r13,@L1025
	cmp	 r13,r22,3
	cmp	 r13,r22,4
	bb0.n	 ne,r13,@L1026
	or	 r2,r0,4
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,1
@L1026:
	bsr	 _abort
	align	 4
@L1025:
	bb1.n	 ne,r13,@L1027
	cmp	 r13,r21,4
	bb0.n	 ne,r13,@L1028
	or	 r2,r0,4
	or	 r3,r0,r23
	or	 r4,r0,1
	bsr.n	 _convert_to_mode
	or	 r22,r0,4
	br.n	 @L1027
	or	 r23,r0,r2
	align	 4
@L1028:
	bsr	 _abort
	align	 4
@L1027:
	ld	 r12,r15[r21]
	ld	 r13,r15[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb1	 ge,r12,@L1030
	ld	 r13,r0,r23
	or.u	 r12,r0,0x37
	and	 r13,r13,0x10
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L1032
	or.u	 r13,r0,hi16(_direct_load)
	or	 r13,r13,lo16(_direct_load)
	ld.b	 r13,r21,r13
	bcnd	 eq0,r13,@L1032
	bsr.n	 _mode_dependent_address_p
	ld	 r2,r23,4
	bcnd.n	 eq0,r2,@L1278
	or	 r2,r0,r21
@L1032:
	ld.hu	 r13,r0,r23
	cmp	 r12,r13,51
	cmp	 r13,r13,53
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L1030
	or	 r2,r0,r21
@L1278:
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	addu	 r1,r1,@L1306
@L1307:
	align	 4
@L1030:
	ld	 r12,r15[r21]
	ld	 r13,r15[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb0.n	 gt,r12,@L1033
	or	 r2,r0,r21
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,1
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0.n	 ne,r13,@L1034
	or.u	 r13,r0,hi16(_optimize)
@L1275:
	ld	 r13,r13,lo16(_optimize)
	bcnd	 le0,r13,@L1035
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L1279
	or	 r2,r0,r25
	or	 r2,r0,r22
	bsr.n	 _force_reg
	or	 r3,r0,r23
	or	 r23,r0,r2
@L1035:
	or	 r2,r0,r25
@L1279:
	or	 r3,r0,r20
	or	 r4,r0,r23
@L1251:
	or	 r5,r0,100
	bsr.n	 _emit_unop_insn
	addu	 r1,r1,@L1308
@L1309:
	align	 4
@L1034:
	or	 r25,r0,r22
	bcnd.n	 eq0,r25,@L1038
	or.u	 r13,r0,hi16(_mode_wider_mode)
	or	 r24,r13,lo16(_mode_wider_mode)
	or	 r2,r0,r21
@L1280:
	or	 r3,r0,r25
	bsr.n	 _can_extend_p
	or	 r4,r0,1
	cmp	 r2,r2,210
	bb1.n	 eq,r2,@L1039
	or	 r2,r0,r25
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,1
	cmp	 r2,r2,210
	bb1.n	 ne,r2,@L1175
	or	 r2,r0,r25
@L1039:
	ld	 r25,r24[r25]
	bcnd.n	 ne0,r25,@L1280
	or	 r2,r0,r21
@L1038:
	bsr	 _abort
	align	 4
@L1033:
	cmp	 r13,r22,6
	extu	 r11,r13,1<eq>
	cmp	 r13,r21,4
	extu	 r13,r13,1<eq>
	and	 r13,r11,r13
	bcnd.n	 eq0,r13,@L1043
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L1310
@L1311:
	align	 4
@L1043:
	cmp	 r13,r21,2
	extu	 r9,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L1044
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L1312
@L1313:
	align	 4
@L1044:
	cmp	 r13,r21,1
	extu	 r10,r13,1<eq>
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L1045
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L1314
@L1315:
	align	 4
@L1045:
	cmp	 r13,r22,4
	extu	 r11,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L1046
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L1316
@L1317:
	align	 4
@L1046:
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L1047
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L1318
@L1319:
	align	 4
@L1047:
	cmp	 r13,r22,2
	extu	 r13,r13,1<eq>
	and	 r13,r13,r10
	bcnd.n	 eq0,r13,@L1048
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L1320
@L1321:
	align	 4
@L1048:
	bb1.n	 ge,r12,@L1049
	or	 r2,r0,r21
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	bsr.n	 _force_reg
	or	 r2,r0,r21
@L1250:
	or	 r3,r0,r2
	or	 r2,r0,r20
	bsr.n	 _emit_move_insn
	addu	 r1,r1,@L1322
@L1323:
	align	 4
@L1049:
	bsr	 _abort
	align	 4
@L1175:
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,1
@L1253:
	or	 r3,r0,r2
	or	 r2,r0,r20
	or	 r4,r0,1
@L1252:
	bsr	 _convert_move
@L938:
	or	 r25,r0,r19
@L931:
	ld	 r14,r31,172
	mul	 r12,r14,40
	or.u	 r13,r0,hi16(_insn_operand_predicate)
	or	 r13,r13,lo16(_insn_operand_predicate)
	addu	 r12,r12,r13
	ld	 r13,r12,8
	bcnd.n	 eq0,r13,@L1050
	or	 r2,r0,r25
	jsr.n	 r13
	or	 r3,r0,r17
	bcnd.n	 ne0,r2,@L1050
	or	 r2,r0,r17
	bsr.n	 _copy_to_mode_reg
	or	 r3,r0,r25
	or	 r25,r0,r2
@L1050:
	ld	 r2,r31,156
	ld	 r3,r31,212
	ld	 r18,r31,172
	or.u	 r13,r0,hi16(_insn_gen_function)
	ld	 r5,r31,164
	or	 r13,r13,lo16(_insn_gen_function)
	ld	 r13,r13[r18]
	jsr.n	 r13
	or	 r4,r0,r25
	bcnd	 ne0,r2,@L1176
	bsr.n	 _delete_insns_since
	ld	 r2,r31,180
	or.u	 r13,r0,hi16(_mode_wider_mode)
@L1269:
	or	 r13,r13,lo16(_mode_wider_mode)
	ld	 r17,r13[r17]
	bcnd.n	 ne0,r17,@L1281
	or.u	 r13,r0,hi16(_movstr_optab)
@L922:
	or	 r25,r0,r16
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
	ld	 r11,r0,r25
	and	 r13,r11,0x8
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L1055
	or	 r24,r0,4
	ld	 r13,r25,4
	or.u	 r12,r0,hi16(_mode_size)
	ld.bu	 r13,r13,2
	or	 r12,r12,lo16(_mode_size)
	ld	 r13,r12[r13]
	ld	 r12,r12,16
	cmp	 r13,r13,r12
	bb0	 ge,r13,@L1055
	bb0.n	 (31-26),r11,@L1055
	or	 r2,r0,4
	bsr.n	 _gen_lowpart
	or	 r3,r0,r25
	or	 r25,r0,r2
@L1055:
	ld.bu	 r13,r25,2
	cmp	 r13,r24,r13
	bb1.n	 ne,r13,@L1056
	or.u	 r13,r0,hi16(_mode_class+16)
	br.n	 @L1054
	or	 r2,r0,r25
	align	 4
@L1056:
	ld	 r13,r13,lo16(_mode_class+16)
	cmp	 r13,r13,1
	bb1.n	 ne,r13,@L1057
	or.u	 r13,r0,hi16(_mode_size+16)
	ld	 r13,r13,lo16(_mode_size+16)
	mak	 r13,r13,0<3>
	cmp	 r13,r13,64
	bb1	 ne,r13,@L1057
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,46
	bb1	 ne,r13,@L1174
	ld	 r2,r25,4
	bcnd.n	 ge0,r2,@L1057
	or	 r3,r0,0
	or	 r4,r0,4
	bsr.n	 _immed_double_const
	addu	 r1,r1,@L1324
@L1325:
	align	 4
@L1057:
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,46
	bb0.n	 ne,r13,@L1282
	or	 r2,r0,4
@L1174:
	or.u	 r13,r0,hi16(_mode_class)
	or	 r12,r13,lo16(_mode_class)
	ld	 r13,r12,16
	cmp	 r13,r13,1
	bb1	 ne,r13,@L1058
	ld.bu	 r11,r25,2
	ld	 r13,r12[r11]
	cmp	 r13,r13,1
	bb1	 ne,r13,@L1058
	ld.hu	 r10,r0,r25
	cmp	 r13,r10,47
	bb0.n	 ne,r13,@L1059
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13,16
	ld	 r13,r13[r11]
	cmp	 r12,r12,r13
	bb1	 gt,r12,@L1058
	ld	 r13,r0,r25
	or.u	 r12,r0,0x37
	and	 r13,r13,0x10
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L1283
	cmp	 r13,r10,51
	or.u	 r13,r0,hi16(_direct_load+4)
	ld.b	 r13,r13,lo16(_direct_load+4)
	bcnd.n	 ne0,r13,@L1282
	or	 r2,r0,4
	cmp	 r13,r10,51
@L1283:
	bb1	 ne,r13,@L1058
@L1059:
	or	 r2,r0,4
@L1282:
	or	 r3,r0,r25
	bsr.n	 _gen_lowpart
	addu	 r1,r1,@L1326
@L1327:
	align	 4
@L1058:
	bsr.n	 _gen_reg_rtx
	or	 r2,r0,4
	or	 r19,r0,r2
	or	 r23,r0,r25
	ld.bu	 r21,r19,2
	ld.bu	 r22,r23,2
	or.u	 r12,r0,hi16(_mode_class)
	ld.hu	 r11,r0,r19
	or	 r12,r12,lo16(_mode_class)
	ld	 r13,r12[r21]
	or	 r16,r0,100
	ld	 r12,r12[r22]
	or	 r20,r0,r19
	cmp	 r13,r13,2
	cmp	 r12,r12,2
	extu	 r15,r13,1<eq>
	cmp	 r13,r11,59
	bb0.n	 ne,r13,@L1065
	extu	 r17,r12,1<eq>
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L1068
	cmp	 r13,r11,63
	ld	 r2,r19,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L1069
	st	 r2,r19,4
	align	 4
@L1068:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L1069
	ld	 r2,r19,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r19,4
	ld	 r2,r19,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r19,8
@L1069:
	br.n	 @L1064
	or	 r2,r0,r20
	align	 4
@L1065:
	ld	 r13,r19,8
	bcnd	 ne0,r13,@L1071
	ld	 r2,r19,4
	br	 @L1064
	align	 4
@L1071:
	ld	 r2,r19,12
	bcnd	 ne0,r2,@L1064
	ld	 r13,r19,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r19,4
	bsr.n	 _gen_move_insn
	st	 r2,r19,12
	bsr.n	 _emit_insn_before
	ld	 r3,r19,8
	ld	 r2,r19,12
@L1064:
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L1074
	or	 r20,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L1284
	cmp	 r13,r12,63
	ld.bu	 r13,r23,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L1075
	ld	 r24,r23,4
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L1075
	ld	 r13,r24,4
	st	 r13,r23,4
	ld	 r13,r24,8
	bcnd	 eq0,r13,@L1078
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r23,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r23
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	br.n	 @L1073
	or	 r2,r0,r25
	align	 4
@L1075:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L1077
	cmp	 r13,r12,63
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L1078
	st	 r2,r23,4
	align	 4
@L1077:
@L1284:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L1078
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,4
	ld	 r2,r23,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,8
@L1078:
	br.n	 @L1073
	or	 r2,r0,r23
	align	 4
@L1074:
	ld	 r13,r23,8
	bcnd	 ne0,r13,@L1080
	ld	 r2,r23,4
	br.n	 @L1285
	cmp	 r13,r15,r17
	align	 4
@L1080:
	ld	 r2,r23,12
	bcnd.n	 ne0,r2,@L1285
	cmp	 r13,r15,r17
	ld	 r13,r23,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r23,4
	bsr.n	 _gen_move_insn
	st	 r2,r23,12
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	ld	 r2,r23,12
@L1073:
	cmp	 r13,r15,r17
@L1285:
	bb0.n	 ne,r13,@L1082
	or	 r23,r0,r2
	bsr	 _abort
	align	 4
@L1082:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
	ld	 r11,r0,r23
	and	 r13,r11,0x8
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L1286
	ld	 r13,r23,4
	or.u	 r12,r0,hi16(_mode_size)
	ld.bu	 r13,r13,2
	or	 r12,r12,lo16(_mode_size)
	ld	 r13,r12[r13]
	ld	 r12,r12[r21]
	cmp	 r13,r13,r12
	bb0	 ge,r13,@L1083
	bb0.n	 (31-26),r11,@L1083
	or	 r2,r0,r21
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	or	 r22,r0,r21
	or	 r23,r0,r2
@L1083:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
@L1286:
	ld	 r13,r0,r20
	and	 r13,r13,0x8
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L1084
	cmp	 r13,r21,r22
	bsr	 _abort
	align	 4
@L1084:
	bb0.n	 ne,r13,@L1287
	or	 r2,r0,r20
	bcnd	 ne0,r22,@L1085
	ld.hu	 r12,r0,r23
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1287
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1287
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L1085
@L1287:
	or	 r3,r0,r23
	bsr.n	 _emit_move_insn
	addu	 r1,r1,@L1328
@L1329:
	align	 4
@L1085:
	bcnd.n	 eq0,r15,@L1087
	cmp	 r5,r22,8
	cmp	 r13,r21,9
	extu	 r11,r5,1<eq>
	extu	 r7,r13,1<eq>
	and	 r13,r11,r7
	bcnd.n	 ne0,r13,@L1254
	or	 r2,r0,108
	cmp	 r6,r21,11
	extu	 r12,r6,1<eq>
	and	 r13,r11,r12
	bcnd.n	 ne0,r13,@L1254
	or	 r2,r0,109
	cmp	 r8,r22,9
	extu	 r9,r8,1<eq>
	and	 r13,r9,r12
	bcnd.n	 eq0,r13,@L1090
	cmp	 r4,r21,11
	br.n	 @L1254
	or	 r2,r0,110
	align	 4
@L1090:
	cmp	 r10,r21,8
	extu	 r11,r10,1<eq>
	and	 r13,r9,r11
	bcnd.n	 ne0,r13,@L1254
	or	 r2,r0,111
	cmp	 r9,r22,11
	extu	 r12,r9,1<eq>
	and	 r13,r12,r11
	bcnd.n	 ne0,r13,@L1254
	or	 r2,r0,112
	and	 r13,r12,r7
	bcnd.n	 eq0,r13,@L1093
	cmp	 r12,r21,9
	or	 r2,r0,113
@L1254:
	or	 r3,r0,r20
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _emit_unop_insn
	addu	 r1,r1,@L1330
@L1331:
	align	 4
@L1093:
	bb0.n	 ne,r8,@L1103
	or	 r2,r0,0
	bb0.n	 ls,r8,@L1125
	cmp	 r13,r22,10
	bb0.n	 ne,r5,@L1095
	cmp	 r13,r21,10
	br	 @L1094
	align	 4
@L1125:
	bb0	 ne,r13,@L1111
	bb0	 ne,r9,@L1117
	br	 @L1094
	align	 4
@L1095:
	bb0	 ne,r13,@L1098
	bb0	 ls,r13,@L1102
	bb0.n	 ne,r12,@L1097
	or.u	 r13,r0,hi16(_extendsfdf2_libfunc)
	br	 @L1094
	align	 4
@L1102:
	bb0.n	 ne,r4,@L1099
	or.u	 r13,r0,hi16(_extendsftf2_libfunc)
	br	 @L1094
	align	 4
@L1097:
	ld	 r2,r13,lo16(_extendsfdf2_libfunc)
	br	 @L1094
	align	 4
@L1098:
	or.u	 r13,r0,hi16(_extendsfxf2_libfunc)
	ld	 r2,r13,lo16(_extendsfxf2_libfunc)
	br	 @L1094
	align	 4
@L1099:
	ld	 r2,r13,lo16(_extendsftf2_libfunc)
	br	 @L1094
	align	 4
@L1103:
	cmp	 r13,r21,10
	bb0	 ne,r13,@L1106
	bb0	 ls,r13,@L1110
	bb0.n	 ne,r10,@L1105
	or.u	 r13,r0,hi16(_truncdfsf2_libfunc)
	br	 @L1094
	align	 4
@L1110:
	bb0.n	 ne,r6,@L1107
	or.u	 r13,r0,hi16(_extenddftf2_libfunc)
	br	 @L1094
	align	 4
@L1105:
	ld	 r2,r13,lo16(_truncdfsf2_libfunc)
	br	 @L1094
	align	 4
@L1106:
	or.u	 r13,r0,hi16(_extenddfxf2_libfunc)
	ld	 r2,r13,lo16(_extenddfxf2_libfunc)
	br	 @L1094
	align	 4
@L1107:
	ld	 r2,r13,lo16(_extenddftf2_libfunc)
	br	 @L1094
	align	 4
@L1111:
	bb0.n	 ne,r10,@L1113
	or.u	 r13,r0,hi16(_truncxfsf2_libfunc)
	bb0.n	 ne,r12,@L1114
	or.u	 r13,r0,hi16(_truncxfdf2_libfunc)
	br	 @L1094
	align	 4
@L1113:
	ld	 r2,r13,lo16(_truncxfsf2_libfunc)
	br	 @L1094
	align	 4
@L1114:
	ld	 r2,r13,lo16(_truncxfdf2_libfunc)
	br	 @L1094
	align	 4
@L1117:
	bb0.n	 ne,r10,@L1119
	or.u	 r13,r0,hi16(_trunctfsf2_libfunc)
	bb0.n	 ne,r12,@L1120
	or.u	 r13,r0,hi16(_trunctfdf2_libfunc)
	br	 @L1094
	align	 4
@L1119:
	ld	 r2,r13,lo16(_trunctfsf2_libfunc)
	br	 @L1094
	align	 4
@L1120:
	ld	 r2,r13,lo16(_trunctfdf2_libfunc)
@L1094:
	bcnd.n	 ne0,r2,@L1126
	or	 r3,r0,1
	bsr	 _abort
	align	 4
@L1126:
	or	 r4,r0,r21
	or	 r5,r0,1
	or	 r6,r0,r23
	bsr.n	 _emit_library_call
	or	 r7,r0,r22
	or	 r2,r0,r21
	bsr.n	 _hard_libcall_value
	addu	 r1,r1,@L1332
@L1333:
	align	 4
@L1087:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r24,r13,lo16(_mode_size)
	ld	 r13,r24[r22]
	ld	 r12,r24[r21]
	mak	 r13,r13,0<3>
	mak	 r11,r12,0<3>
	cmp	 r13,r13,r11
	bb1.n	 ge,r13,@L1288
	or.u	 r13,r0,hi16(_mode_size)
	cmp	 r13,r11,32
	bb0.n	 gt,r13,@L1127
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L1128
	addu	 r13,r12,6
@L1128:
	or	 r2,r0,r21
	or	 r3,r0,r22
	or	 r4,r0,1
	bsr.n	 _can_extend_p
	ext	 r17,r13,0<2>
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb1.n	 ne,r13,@L1289
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r24[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L1131
	or.u	 r24,r0,hi16(_word_mode)
	or	 r2,r0,r21
	ld	 r3,r24,lo16(_word_mode)
	bsr.n	 _can_extend_p
	or	 r4,r0,1
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0	 ne,r13,@L1131
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	or	 r3,r0,r23
	bsr.n	 _convert_move
	or	 r4,r0,1
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	or	 r4,r0,r2
	or	 r2,r0,r25
	br.n	 @L1256
	or	 r3,r0,r20
	align	 4
@L1131:
	bsr	 _start_sequence
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L1133
	or	 r24,r0,r22
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r24,r13,lo16(_word_mode)
	br.n	 @L1290
	or	 r2,r0,r24
	align	 4
@L1133:
	or	 r2,r0,r24
@L1290:
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,1
	or	 r25,r0,r2
	or	 r2,r0,r24
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	bsr.n	 _emit_move_insn
	or	 r3,r0,r25
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r2,r13[r24]
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r24,r13,lo16(_const0_rtx)
	bcnd	 ge0,r2,@L1139
	addu	 r2,r2,3
@L1139:
	ext	 r22,r2,0<2>
	cmp	 r13,r22,r17
	bb0.n	 lt,r13,@L1141
	subu	 r13,r17,r22
	mask	 r12,r13,3
	bcnd.n	 eq0,r12,@L1143
	subu	 r25,r17,r22
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L1181
	cmp	 r13,r12,2
	bb0.n	 gt,r13,@L1182
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L1186
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L1186:
	bb1	 eq,r13,@L1184
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L1184:
	addu	 r22,r22,1
@L1182:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L1190
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L1190:
	bb1	 eq,r13,@L1188
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L1188:
	addu	 r22,r22,1
@L1181:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L1194
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L1194:
	bb1	 eq,r13,@L1192
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L1192:
	addu	 r22,r22,1
	cmp	 r13,r22,r17
	bb0	 lt,r13,@L1141
@L1143:
	or	 r2,r0,r20
@L1291:
	subu	 r3,r25,1
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L1198
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L1198:
	bb1	 eq,r13,@L1196
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L1196:
	or	 r2,r0,r20
	subu	 r3,r25,2
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L1202
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L1202:
	bb1	 eq,r13,@L1200
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L1200:
	or	 r2,r0,r20
	subu	 r3,r25,3
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L1206
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L1206:
	bb1	 eq,r13,@L1204
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L1204:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,4
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L1210
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L1210:
	bb1	 eq,r13,@L1208
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L1208:
	addu	 r22,r22,4
	cmp	 r13,r22,r17
	bb1.n	 lt,r13,@L1291
	or	 r2,r0,r20
@L1141:
	bsr	 _get_insns
	bsr.n	 _end_sequence
	or	 r25,r0,r2
	or	 r2,r0,r16
	or	 r3,r0,r21
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r6,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,r20
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _emit_no_conflict_block
	addu	 r1,r1,@L1334
@L1335:
	align	 4
@L1127:
	or.u	 r13,r0,hi16(_mode_size)
@L1288:
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,32
	bb0.n	 gt,r13,@L1147
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r2,r13,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	or	 r2,r0,r20
	br.n	 @L1257
	or	 r4,r0,0
	align	 4
@L1147:
	cmp	 r13,r21,3
	bb1.n	 ne,r13,@L1148
	cmp	 r13,r22,3
	cmp	 r13,r22,4
	bb0.n	 ne,r13,@L1149
	or	 r2,r0,4
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,1
@L1149:
	bsr	 _abort
	align	 4
@L1148:
	bb1.n	 ne,r13,@L1292
	or.u	 r13,r0,hi16(_mode_size)
	cmp	 r13,r21,4
	bb0.n	 ne,r13,@L1151
	or	 r2,r0,4
	or	 r3,r0,r23
	or	 r4,r0,1
	bsr.n	 _convert_to_mode
	or	 r22,r0,4
	br.n	 @L1150
	or	 r23,r0,r2
	align	 4
@L1151:
	bsr	 _abort
	align	 4
@L1150:
	or.u	 r13,r0,hi16(_mode_size)
@L1292:
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r21]
	ld	 r13,r13[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb1.n	 ge,r12,@L1293
	or.u	 r13,r0,hi16(_mode_size)
	ld	 r13,r0,r23
	or.u	 r12,r0,0x37
	and	 r13,r13,0x10
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L1155
	or.u	 r13,r0,hi16(_direct_load)
	or	 r13,r13,lo16(_direct_load)
	ld.b	 r13,r21,r13
	bcnd	 eq0,r13,@L1155
	bsr.n	 _mode_dependent_address_p
	ld	 r2,r23,4
	bcnd.n	 eq0,r2,@L1294
	or	 r2,r0,r21
@L1155:
	ld.hu	 r13,r0,r23
	cmp	 r12,r13,51
	cmp	 r13,r13,53
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L1153
	or	 r2,r0,r21
@L1294:
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	addu	 r1,r1,@L1336
@L1337:
	align	 4
@L1153:
	or.u	 r13,r0,hi16(_mode_size)
@L1293:
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r21]
	ld	 r13,r13[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb0.n	 gt,r12,@L1156
	or	 r2,r0,r21
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,1
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0.n	 ne,r13,@L1157
	or.u	 r13,r0,hi16(_optimize)
@L1289:
	ld	 r13,r13,lo16(_optimize)
	bcnd	 le0,r13,@L1158
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L1295
	or	 r2,r0,r25
	or	 r2,r0,r22
	bsr.n	 _force_reg
	or	 r3,r0,r23
	or	 r23,r0,r2
@L1158:
	or	 r2,r0,r25
@L1295:
	or	 r3,r0,r20
	or	 r4,r0,r23
@L1256:
	or	 r5,r0,r16
	bsr.n	 _emit_unop_insn
	addu	 r1,r1,@L1338
@L1339:
	align	 4
@L1157:
	or	 r25,r0,r22
	bcnd.n	 eq0,r25,@L1161
	or.u	 r13,r0,hi16(_mode_wider_mode)
	or	 r24,r13,lo16(_mode_wider_mode)
	or	 r2,r0,r21
@L1296:
	or	 r3,r0,r25
	bsr.n	 _can_extend_p
	or	 r4,r0,1
	cmp	 r2,r2,210
	bb1.n	 eq,r2,@L1162
	or	 r2,r0,r25
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,1
	cmp	 r2,r2,210
	bb0.n	 eq,r2,@L1177
	or	 r2,r0,r25
@L1162:
	ld	 r25,r24[r25]
	bcnd.n	 ne0,r25,@L1296
	or	 r2,r0,r21
@L1161:
	bsr	 _abort
	align	 4
@L1156:
	cmp	 r13,r22,6
	extu	 r11,r13,1<eq>
	cmp	 r13,r21,4
	extu	 r13,r13,1<eq>
	and	 r13,r11,r13
	bcnd.n	 eq0,r13,@L1166
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L1340
@L1341:
	align	 4
@L1166:
	cmp	 r13,r21,2
	extu	 r9,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L1167
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L1342
@L1343:
	align	 4
@L1167:
	cmp	 r13,r21,1
	extu	 r10,r13,1<eq>
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L1168
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L1344
@L1345:
	align	 4
@L1168:
	cmp	 r13,r22,4
	extu	 r11,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L1169
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L1346
@L1347:
	align	 4
@L1169:
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L1170
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L1348
@L1349:
	align	 4
@L1170:
	cmp	 r13,r22,2
	extu	 r13,r13,1<eq>
	and	 r13,r13,r10
	bcnd.n	 eq0,r13,@L1171
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L1350
@L1351:
	align	 4
@L1171:
	bb1.n	 ge,r12,@L1172
	or	 r2,r0,r21
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	bsr.n	 _force_reg
	or	 r2,r0,r21
@L1255:
	or	 r3,r0,r2
	or	 r2,r0,r20
	bsr.n	 _emit_move_insn
	addu	 r1,r1,@L1352
@L1353:
	align	 4
@L1172:
	bsr	 _abort
	align	 4
@L1176:
	bsr.n	 _emit_insn
	addu	 r1,r1,@L1354
@L1355:
	align	 4
@L1177:
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,1
@L1258:
	or	 r3,r0,r2
	or	 r2,r0,r20
	or	 r4,r0,1
@L1257:
	bsr	 _convert_move
@L1061:
	or	 r2,r0,r19
@L1054:
	ld	 r14,r31,156
	ld	 r18,r31,212
	or	 r3,r0,0
	ld	 r6,r14,4
	or	 r4,r0,0
	ld	 r8,r18,4
	or.u	 r13,r0,hi16(_memcpy_libfunc)
	or	 r5,r0,3
	st	 r2,r31,32
	or	 r7,r0,4
	ld	 r2,r13,lo16(_memcpy_libfunc)
	or	 r9,r0,4
	or	 r13,r0,4
	bsr.n	 _emit_library_call
	st	 r13,r31,36
@L840:
@Lte12:
	ld	 r1,r31,96
	ld.d	 r24,r31,88
	ld.d	 r22,r31,80
	ld.d	 r20,r31,72
	ld.d	 r18,r31,64
	ld.d	 r16,r31,56
	ld.d	 r14,r31,48
	jmp.n	 r1
	addu	 r31,r31,224
	def	 @L1354,@L840-@L1355
	def	 @L1352,@L1061-@L1353
	def	 @L1350,@L1258-@L1351
	def	 @L1348,@L1258-@L1349
	def	 @L1346,@L1258-@L1347
	def	 @L1344,@L1258-@L1345
	def	 @L1342,@L1258-@L1343
	def	 @L1340,@L1258-@L1341
	def	 @L1338,@L1061-@L1339
	def	 @L1336,@L1255-@L1337
	def	 @L1334,@L1061-@L1335
	def	 @L1332,@L1255-@L1333
	def	 @L1330,@L1061-@L1331
	def	 @L1328,@L1061-@L1329
	def	 @L1326,@L1054-@L1327
	def	 @L1324,@L1054-@L1325
	def	 @L1322,@L938-@L1323
	def	 @L1320,@L1253-@L1321
	def	 @L1318,@L1253-@L1319
	def	 @L1316,@L1253-@L1317
	def	 @L1314,@L1253-@L1315
	def	 @L1312,@L1253-@L1313
	def	 @L1310,@L1253-@L1311
	def	 @L1308,@L938-@L1309
	def	 @L1306,@L1250-@L1307
	def	 @L1304,@L938-@L1305
	def	 @L1302,@L1250-@L1303
	def	 @L1300,@L938-@L1301
	def	 @L1298,@L938-@L1299

	align	 8
	global	 _move_block_to_reg
_move_block_to_reg:
	subu	 r31,r31,80
	st	 r1,r31,64
	st	 r19,r31,36
	st.d	 r24,r31,56
	st.d	 r22,r31,48
	or	 r22,r0,r3
	st.d	 r20,r31,40
@Ltb13:
	ld.hu	 r12,r0,r22
	subu	 r13,r12,56
	or	 r25,r0,r2
	mask	 r13,r13,0xffff
	or	 r19,r0,r4
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1366
	or	 r21,r0,r5
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1366
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L1365
@L1366:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,47
	bb1	 ne,r13,@L1365
	ld.bu	 r13,r22,2
	bcnd.n	 eq0,r13,@L1365
	or	 r2,r0,r21
	bsr.n	 _force_const_mem
	or	 r3,r0,r22
	bsr	 _validize_mem
	or	 r22,r0,r2
@L1365:
	bcnd.n	 le0,r19,@L1368
	or	 r24,r0,0
	or	 r23,r0,r25
	mask	 r12,r19,3
	bcnd.n	 eq0,r12,@L1370
	or.u	 r20,r0,hi16(_word_mode)
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L1374
	cmp	 r13,r12,2
	bb0.n	 gt,r13,@L1375
	or	 r2,r0,51
	ld	 r3,r20,lo16(_word_mode)
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r25,r0,r2
	or	 r2,r0,r22
	or	 r3,r0,0
	or	 r4,r0,r21
	bsr.n	 _operand_subword_force
	addu	 r23,r23,1
	or	 r3,r0,r2
	or	 r2,r0,r25
	bsr.n	 _emit_move_insn
	or	 r24,r0,1
@L1375:
	ld	 r3,r20,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r25,r0,r2
	or	 r2,r0,r22
	or	 r3,r0,r24
	or	 r4,r0,r21
	bsr.n	 _operand_subword_force
	addu	 r23,r23,1
	or	 r3,r0,r2
	or	 r2,r0,r25
	bsr.n	 _emit_move_insn
	addu	 r24,r24,1
@L1374:
	ld	 r3,r20,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r25,r0,r2
	or	 r2,r0,r22
	or	 r3,r0,r24
	bsr.n	 _operand_subword_force
	or	 r4,r0,r21
	or	 r3,r0,r2
	or	 r2,r0,r25
	bsr.n	 _emit_move_insn
	addu	 r24,r24,1
	cmp	 r13,r24,r19
	bb0.n	 lt,r13,@L1368
	addu	 r23,r23,1
@L1370:
	ld	 r3,r20,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r25,r0,r2
	or	 r2,r0,r22
	or	 r3,r0,r24
	bsr.n	 _operand_subword_force
	or	 r4,r0,r21
	or	 r3,r0,r2
	bsr.n	 _emit_move_insn
	or	 r2,r0,r25
	ld	 r3,r20,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	addu	 r4,r23,1
	addu	 r3,r24,1
	or	 r25,r0,r2
	or	 r2,r0,r22
	bsr.n	 _operand_subword_force
	or	 r4,r0,r21
	or	 r3,r0,r2
	bsr.n	 _emit_move_insn
	or	 r2,r0,r25
	ld	 r3,r20,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	addu	 r4,r23,2
	addu	 r3,r24,2
	or	 r25,r0,r2
	or	 r2,r0,r22
	bsr.n	 _operand_subword_force
	or	 r4,r0,r21
	or	 r3,r0,r2
	bsr.n	 _emit_move_insn
	or	 r2,r0,r25
	ld	 r3,r20,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	addu	 r4,r23,3
	addu	 r3,r24,3
	or	 r25,r0,r2
	or	 r2,r0,r22
	bsr.n	 _operand_subword_force
	or	 r4,r0,r21
	or	 r3,r0,r2
	or	 r2,r0,r25
	bsr.n	 _emit_move_insn
	addu	 r24,r24,4
	cmp	 r13,r24,r19
	bb1.n	 lt,r13,@L1370
	addu	 r23,r23,4
@L1368:
@Lte13:
	ld	 r1,r31,64
	ld	 r19,r31,36
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	jmp.n	 r1
	addu	 r31,r31,80

	align	 8
	global	 _move_block_from_reg
_move_block_from_reg:
	subu	 r31,r31,80
	st	 r1,r31,64
	st.d	 r20,r31,40
	or	 r21,r0,r3
	st	 r19,r31,36
	or	 r19,r0,r4
	st.d	 r22,r31,48
	or	 r23,r0,0
	bcnd.n	 le0,r19,@L1400
	st.d	 r24,r31,56
@Ltb14:
	or	 r22,r0,r2
	mask	 r12,r19,3
	bcnd.n	 eq0,r12,@L1402
	or.u	 r20,r0,hi16(_word_mode)
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L1407
	cmp	 r13,r12,2
	bb0.n	 gt,r13,@L1408
	or	 r2,r0,r21
	or	 r3,r0,0
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,16
	or	 r25,r0,r2
	bcnd.n	 ne0,r25,@L1411
	or	 r2,r0,51
	bsr	 _abort
	align	 4
@L1411:
	ld	 r3,r20,lo16(_word_mode)
	or	 r4,r0,r22
	bsr.n	 _gen_rtx
	addu	 r22,r22,1
	or	 r3,r0,r2
	or	 r2,r0,r25
	bsr.n	 _emit_move_insn
	or	 r23,r0,1
@L1408:
	or	 r2,r0,r21
	or	 r3,r0,r23
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,16
	or	 r25,r0,r2
	bcnd.n	 ne0,r25,@L1414
	or	 r2,r0,51
	bsr	 _abort
	align	 4
@L1414:
	ld	 r3,r20,lo16(_word_mode)
	or	 r4,r0,r22
	bsr.n	 _gen_rtx
	addu	 r22,r22,1
	or	 r3,r0,r2
	or	 r2,r0,r25
	bsr.n	 _emit_move_insn
	addu	 r23,r23,1
@L1407:
	or	 r2,r0,r21
	or	 r3,r0,r23
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,16
	or	 r25,r0,r2
	bcnd.n	 ne0,r25,@L1417
	or	 r2,r0,51
	bsr	 _abort
	align	 4
@L1417:
	ld	 r3,r20,lo16(_word_mode)
	bsr.n	 _gen_rtx
	or	 r4,r0,r22
	or	 r3,r0,r2
	or	 r2,r0,r25
	bsr.n	 _emit_move_insn
	addu	 r23,r23,1
	cmp	 r13,r23,r19
	bb0.n	 lt,r13,@L1400
	addu	 r22,r22,1
@L1402:
	or	 r2,r0,r21
	or	 r3,r0,r23
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,16
	or	 r25,r0,r2
	bcnd	 ne0,r25,@L1420
	bsr	 _abort
	align	 4
@L1420:
	ld	 r3,r20,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	or	 r4,r0,r22
	or	 r3,r0,r2
	bsr.n	 _emit_move_insn
	or	 r2,r0,r25
	or	 r2,r0,r21
	addu	 r3,r23,1
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,16
	or	 r24,r0,r2
	bcnd.n	 ne0,r24,@L1423
	addu	 r25,r22,1
	bsr	 _abort
	align	 4
@L1423:
	ld	 r3,r20,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r3,r0,r2
	bsr.n	 _emit_move_insn
	or	 r2,r0,r24
	or	 r2,r0,r21
	addu	 r3,r23,2
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,16
	or	 r24,r0,r2
	bcnd.n	 ne0,r24,@L1426
	addu	 r25,r22,2
	bsr	 _abort
	align	 4
@L1426:
	ld	 r3,r20,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r3,r0,r2
	bsr.n	 _emit_move_insn
	or	 r2,r0,r24
	or	 r2,r0,r21
	addu	 r3,r23,3
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,16
	or	 r24,r0,r2
	bcnd.n	 ne0,r24,@L1429
	addu	 r25,r22,3
	bsr	 _abort
	align	 4
@L1429:
	ld	 r3,r20,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r3,r0,r2
	or	 r2,r0,r24
	bsr.n	 _emit_move_insn
	addu	 r23,r23,4
	cmp	 r13,r23,r19
	bb1.n	 lt,r13,@L1402
	addu	 r22,r22,4
@L1400:
@Lte14:
	ld	 r1,r31,64
	ld	 r19,r31,36
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	jmp.n	 r1
	addu	 r31,r31,80

	align	 8
	global	 _use_regs
_use_regs:
	subu	 r31,r31,64
	st.d	 r22,r31,32
	or	 r22,r0,r3
	st.d	 r24,r31,40
	or	 r24,r0,0
	bcnd.n	 le0,r22,@L1439
	st	 r1,r31,48
@Ltb15:
	or	 r25,r0,r2
	mask	 r12,r22,3
	bcnd.n	 eq0,r12,@L1441
	or.u	 r23,r0,hi16(_word_mode)
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L1445
	cmp	 r13,r12,2
	bb0	 gt,r13,@L1446
	ld	 r3,r23,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,41
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	addu	 r25,r25,1
	bsr.n	 _emit_insn
	or	 r24,r0,1
@L1446:
	ld	 r3,r23,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,41
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	addu	 r25,r25,1
	bsr.n	 _emit_insn
	addu	 r24,r24,1
@L1445:
	ld	 r3,r23,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,41
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	bsr.n	 _emit_insn
	addu	 r24,r24,1
	cmp	 r13,r24,r22
	bb0.n	 lt,r13,@L1439
	addu	 r25,r25,1
@L1441:
	ld	 r3,r23,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,41
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	bsr.n	 _emit_insn
	addu	 r24,r24,4
	ld	 r3,r23,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	addu	 r4,r25,1
	or	 r4,r0,r2
	or	 r2,r0,41
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	bsr	 _emit_insn
	ld	 r3,r23,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	addu	 r4,r25,2
	or	 r4,r0,r2
	or	 r2,r0,41
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	bsr	 _emit_insn
	ld	 r3,r23,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	addu	 r4,r25,3
	or	 r4,r0,r2
	or	 r2,r0,41
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	bsr.n	 _emit_insn
	addu	 r25,r25,4
	cmp	 r13,r24,r22
	bb1	 lt,r13,@L1441
@L1439:
@Lte15:
	ld	 r1,r31,48
	ld.d	 r24,r31,40
	ld.d	 r22,r31,32
	jmp.n	 r1
	addu	 r31,r31,64

	align	 8
	global	 _clear_storage
_clear_storage:
	subu	 r31,r31,64
	st	 r25,r31,48
	or	 r25,r0,r2
	st	 r1,r31,52
@Ltb16:
	ld.bu	 r13,r25,2
	cmp	 r13,r13,16
	bb1.n	 ne,r13,@L1469
	or	 r4,r0,r3
	or	 r2,r0,46
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	ld	 r6,r25,4
	st	 r2,r31,32
	or.u	 r13,r0,hi16(_memset_libfunc)
	or	 r3,r0,0
	or	 r4,r0,0
	or	 r5,r0,3
	ld	 r2,r13,lo16(_memset_libfunc)
	or.u	 r13,r0,hi16(_const0_rtx)
	or	 r7,r0,4
	ld	 r8,r13,lo16(_const0_rtx)
	or	 r9,r0,4
	or	 r13,r0,4
	st	 r13,r31,36
	bsr.n	 _emit_library_call
	addu	 r1,r1,@L1471
@L1472:
	align	 4
@L1469:
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r3,r13,lo16(_const0_rtx)
	bsr.n	 _emit_move_insn
	or	 r2,r0,r25
@L1470:
@Lte16:
	ld	 r1,r31,52
	ld	 r25,r31,48
	jmp.n	 r1
	addu	 r31,r31,64
	def	 @L1471,@L1470-@L1472

	align	 8
	global	 _emit_move_insn
_emit_move_insn:
	subu	 r31,r31,80
	st	 r1,r31,64
	st.d	 r24,r31,56
	st.d	 r22,r31,48
	st.d	 r20,r31,40
	or	 r22,r0,r2
	st.d	 r18,r31,32
@Ltb17:
	or.u	 r13,r0,hi16(_mode_class)
	ld.hu	 r11,r0,r22
	ld.bu	 r21,r22,2
	or	 r13,r13,lo16(_mode_class)
	cmp	 r12,r11,59
	ld	 r19,r13[r21]
	bb0.n	 ne,r12,@L1534
	or	 r24,r0,r3
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L1537
	cmp	 r13,r11,63
	ld	 r2,r22,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L1538
	st	 r2,r22,4
	align	 4
@L1537:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L1538
	ld	 r2,r22,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r22,4
	ld	 r2,r22,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r22,8
@L1538:
	br.n	 @L1533
	or	 r2,r0,r22
	align	 4
@L1534:
	ld	 r13,r22,8
	bcnd	 ne0,r13,@L1540
	ld	 r2,r22,4
	br	 @L1533
	align	 4
@L1540:
	ld	 r2,r22,12
	bcnd	 ne0,r2,@L1533
	ld	 r13,r22,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r22,4
	bsr.n	 _gen_move_insn
	st	 r2,r22,12
	bsr.n	 _emit_insn_before
	ld	 r3,r22,8
	ld	 r2,r22,12
@L1533:
	ld.hu	 r12,r0,r24
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L1543
	or	 r22,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L1595
	cmp	 r13,r12,63
	ld.bu	 r13,r24,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L1544
	ld	 r23,r24,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L1544
	ld	 r13,r23,4
	st	 r13,r24,4
	ld	 r13,r23,8
	bcnd	 eq0,r13,@L1547
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r24,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r24
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	br.n	 @L1542
	or	 r2,r0,r25
	align	 4
@L1544:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L1546
	cmp	 r13,r12,63
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L1547
	st	 r2,r24,4
	align	 4
@L1546:
@L1595:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L1547
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,4
	ld	 r2,r24,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,8
@L1547:
	br.n	 @L1542
	or	 r2,r0,r24
	align	 4
@L1543:
	ld	 r13,r24,8
	bcnd	 ne0,r13,@L1549
	ld	 r2,r24,4
	br.n	 @L1596
	cmp	 r13,r21,16
	align	 4
@L1549:
	ld	 r2,r24,12
	bcnd.n	 ne0,r2,@L1596
	cmp	 r13,r21,16
	ld	 r13,r24,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r24,4
	bsr.n	 _gen_move_insn
	st	 r2,r24,12
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	ld	 r2,r24,12
@L1542:
	cmp	 r13,r21,16
@L1596:
	bb0.n	 ne,r13,@L1552
	or	 r24,r0,r2
	ld.bu	 r13,r24,2
	cmp	 r13,r13,r21
	bb0	 ne,r13,@L1551
	ld.bu	 r13,r24,2
	bcnd	 eq0,r13,@L1551
@L1552:
	bsr	 _abort
	align	 4
@L1551:
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1554
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1554
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L1553
@L1554:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,47
	bb1	 ne,r13,@L1553
	ld.bu	 r13,r24,2
	bcnd.n	 eq0,r13,@L1553
	or	 r2,r0,r21
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
@L1553:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,55
	bb1	 ne,r13,@L1555
	ld.bu	 r2,r22,2
	bsr.n	 _memory_address_p
	ld	 r3,r22,4
	bcnd.n	 ne0,r2,@L1597
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld.bu	 r3,r22,2
	bsr.n	 _push_operand
	or	 r2,r0,r22
	bcnd.n	 eq0,r2,@L1556
	or.u	 r13,r0,hi16(_flag_force_addr)
@L1597:
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L1555
	ld	 r13,r22,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1556
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1556
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L1555
@L1556:
	ld	 r4,r22,4
	or	 r2,r0,r22
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r22,r0,r2
@L1555:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L1598
	cmp	 r13,r21,16
	ld.bu	 r2,r24,2
	bsr.n	 _memory_address_p
	ld	 r3,r24,4
	bcnd.n	 eq0,r2,@L1559
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L1558
	ld	 r13,r24,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1559
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1559
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L1598
	cmp	 r13,r21,16
@L1559:
	ld	 r4,r24,4
	or	 r2,r0,r24
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r24,r0,r2
@L1558:
	cmp	 r13,r21,16
@L1598:
	bb1.n	 ne,r13,@L1560
	subu	 r13,r19,5
	bsr	 _abort
	align	 4
@L1560:
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L1561
	or.u	 r13,r0,hi16(_mode_unit_size)
	or	 r13,r13,lo16(_mode_unit_size)
	ld	 r12,r13[r21]
	or	 r3,r0,2
	cmp	 r13,r19,5
	bb1.n	 ne,r13,@L1562
	mak	 r2,r12,0<3>
	or	 r3,r0,1
@L1562:
	bsr.n	 _mode_for_size
	or	 r4,r0,0
	or	 r20,r0,r2
@L1561:
	or.u	 r23,r0,hi16(_mov_optab)
	ld	 r11,r23,lo16(_mov_optab)
	lda.d	 r13,r11[r21]
	ld	 r12,r13,4
	cmp	 r13,r12,210
	bb0.n	 ne,r13,@L1564
	or.u	 r13,r0,hi16(_insn_gen_function)
	or	 r13,r13,lo16(_insn_gen_function)
	or	 r2,r0,r22
	ld	 r13,r13[r12]
	jsr.n	 r13
	or	 r3,r0,r24
	bsr.n	 _emit_insn
	addu	 r1,r1,@L1600
@L1601:
	align	 4
@L1564:
	cmp	 r12,r20,16
	subu	 r13,r19,5
	extu	 r12,r12,1<ne>
	cmp	 r13,r13,1
	extu	 r13,r13,1<ls>
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L1566
	mak	 r25,r20,0<3>
	addu	 r13,r11,r25
	ld	 r13,r13,4
	cmp	 r13,r13,210
	bb0	 ne,r13,@L1566
	ld.bu	 r3,r22,2
	bsr.n	 _push_operand
	or	 r2,r0,r22
	bsr.n	 _get_last_insn
	or	 r21,r0,r2
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L1567
	or	 r18,r0,r2
	or	 r2,r0,42
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r22
	bsr	 _emit_insn
@L1567:
	ld	 r13,r23,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	addu	 r13,r13,r25
	ld	 r23,r13,4
	bcnd.n	 eq0,r21,@L1568
	or	 r19,r12,lo16(_insn_gen_function)
	or	 r2,r0,r22
	or	 r3,r0,r20
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L1602
@L1603:
	align	 4
@L1568:
	or	 r2,r0,r20
	bsr.n	 _gen_highpart
	or	 r3,r0,r22
@L1592:
	or	 r25,r0,r2
	or	 r2,r0,r20
	bsr.n	 _gen_highpart
	or	 r3,r0,r24
	ld	 r13,r19[r23]
	or	 r3,r0,r2
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	or.u	 r13,r0,hi16(_mov_optab)
	ld	 r13,r13,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	lda.d	 r13,r13[r20]
	ld	 r23,r13,4
	bcnd.n	 eq0,r21,@L1570
	or	 r19,r12,lo16(_insn_gen_function)
	or	 r2,r0,r22
	or	 r3,r0,r20
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L1604
@L1605:
	align	 4
@L1570:
	or	 r2,r0,r20
	bsr.n	 _gen_lowpart
	or	 r3,r0,r22
@L1593:
	or	 r25,r0,r2
	or	 r2,r0,r20
	bsr.n	 _gen_lowpart
	or	 r3,r0,r24
	ld	 r13,r19[r23]
	or	 r3,r0,r2
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	bcnd	 eq0,r18,@L1573
	ld	 r24,r18,12
	br	 @L1574
	align	 4
@L1573:
	bsr	 _get_insns
	or	 r24,r0,r2
@L1574:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	st	 r2,r24,28
	bsr.n	 _get_last_insn
	addu	 r1,r1,@L1606
@L1607:
	align	 4
@L1566:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r20,r13,lo16(_mode_size)
	ld	 r13,r20[r21]
	cmp	 r13,r13,4
	bb0	 gt,r13,@L1576
	bsr.n	 _get_last_insn
	or	 r23,r0,0
	or	 r19,r0,r2
	or	 r25,r0,0
@L1577:
	ld	 r12,r20[r21]
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L1581
	addu	 r13,r12,6
@L1581:
	ext	 r13,r13,0<2>
	cmp	 r13,r25,r13
	bb0.n	 lt,r13,@L1578
	or	 r2,r0,r22
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	or	 r23,r0,r2
	or	 r2,r0,r24
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	or	 r3,r0,r2
	bcnd.n	 ne0,r3,@L1599
	cmp	 r13,r23,0
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1583
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1583
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L1582
	or	 r2,r0,r24
@L1583:
	or	 r2,r0,r21
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
	or	 r3,r0,r25
	or	 r4,r0,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	addu	 r1,r1,@L1608
@L1609:
	align	 4
@L1582:
	or	 r3,r0,r25
	bsr.n	 _operand_subword_force
	or	 r4,r0,r21
@L1594:
	or	 r3,r0,r2
	cmp	 r13,r23,0
@L1599:
	cmp	 r12,r3,0
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L1586
	or	 r2,r0,r23
	bsr	 _abort
	align	 4
@L1586:
	bsr.n	 _emit_move_insn
	addu	 r25,r25,1
	br.n	 @L1577
	or	 r23,r0,r2
	align	 4
@L1578:
	bcnd	 eq0,r19,@L1588
	ld	 r24,r19,12
	br	 @L1589
	align	 4
@L1588:
	bsr	 _get_insns
	or	 r24,r0,r2
@L1589:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	st	 r2,r24,28
	br.n	 @L1591
	or	 r2,r0,r23
	align	 4
@L1576:
	bsr	 _abort
	align	 4
@L1591:
@Lte17:
	ld	 r1,r31,64
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	ld.d	 r18,r31,32
	jmp.n	 r1
	addu	 r31,r31,80
	def	 @L1608,@L1594-@L1609
	def	 @L1606,@L1591-@L1607
	def	 @L1604,@L1593-@L1605
	def	 @L1602,@L1592-@L1603
	def	 @L1600,@L1591-@L1601

	align	 8
	global	 _push_block
_push_block:
	subu	 r31,r31,64
	st	 r1,r31,48
	st.d	 r24,r31,40
	or	 r10,r0,r2
	st.d	 r22,r31,32
@Ltb18:
	ld.hu	 r12,r0,r10
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	or	 r23,r0,r3
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1620
	or	 r22,r0,r4
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1620
	mask	 r11,r12,0xffff
	cmp	 r13,r11,49
	cmp	 r12,r11,113
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L1619
	cmp	 r13,r11,51
@L1620:
	or	 r2,r0,r10
	or	 r3,r0,r23
	bsr.n	 _plus_constant_wide
	addu	 r1,r1,@L1627
@L1628:
	align	 4
@L1619:
	cmp	 r12,r23,0
	and	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 ne0,r13,@L1626
	or	 r2,r0,r10
	or	 r2,r0,4
	bsr.n	 _copy_to_mode_reg
	or	 r3,r0,r10
	bcnd.n	 eq0,r23,@L1624
	or	 r24,r0,r2
	or	 r2,r0,46
	or	 r3,r0,0
	or.u	 r13,r0,hi16(_add_optab)
	or	 r4,r0,r23
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_add_optab)
	or	 r5,r0,r2
	or	 r2,r0,4
	or	 r4,r0,r24
	or	 r7,r0,0
	or	 r8,r0,3
	or	 r6,r0,r4
	bsr.n	 _expand_binop
	or	 r3,r0,r25
	or	 r24,r0,r2
@L1624:
	or	 r2,r0,r24
@L1626:
	bsr	 _anti_adjust_stack
	cmp	 r13,r23,0
	cmp	 r12,r22,0
	or	 r13,r13,r12
	or.u	 r12,r0,hi16(_virtual_outgoing_args_rtx)
	extu	 r11,r13,1<eq>
	xor	 r13,r11,1
	ld	 r3,r12,lo16(_virtual_outgoing_args_rtx)
	bcnd.n	 eq0,r13,@L1625
	or	 r2,r0,r3
	bsr.n	 _plus_constant_wide
	or	 r3,r0,r23
	or	 r3,r0,r2
@L1625:
	or.u	 r13,r0,hi16(_class_narrowest_mode+4)
	bsr.n	 _memory_address
	ld	 r2,r13,lo16(_class_narrowest_mode+4)
@Lte18:
	ld	 r1,r31,48
	ld.d	 r24,r31,40
	ld.d	 r22,r31,32
	jmp.n	 r1
	addu	 r31,r31,64
	def	 @L1627,@L1626-@L1628

	align	 8
	global	 _gen_push_operand
_gen_push_operand:
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	subu	 r31,r31,48
	ld	 r4,r13,lo16(_stack_pointer_rtx)
	or	 r2,r0,85
	st	 r1,r31,36
@Ltb19:
	bsr.n	 _gen_rtx
	or	 r3,r0,4
@Lte19:
	ld	 r1,r31,36
	jmp.n	 r1
	addu	 r31,r31,48

	align	 8
	global	 _emit_push_insn
_emit_push_insn:
	subu	 r31,r31,208
	st.d	 r20,r31,72
	ld	 r21,r31,244
	st	 r1,r31,96
	st.d	 r24,r31,88
	st.d	 r22,r31,80
	or	 r20,r0,r2
	st.d	 r16,r31,56
	or	 r17,r0,r3
	st.d	 r18,r31,64
	or	 r2,r0,r4
	st.d	 r14,r31,48
@Ltb20:
	or	 r22,r0,r5
	st	 r7,r31,156
	or	 r14,r0,r6
	st	 r8,r31,164
	cmp	 r13,r17,16
	bb1.n	 ne,r13,@L1807
	st	 r9,r31,172
	bcnd	 eq0,r2,@L1805
	ld	 r13,r2,16
	ld.bu	 r13,r13,8
	cmp	 r13,r13,25
	bb1.n	 ne,r13,@L2011
	or	 r15,r0,1
	bsr	 _int_size_in_bytes
	cmp	 r2,r2,3
	bb0.n	 gt,r2,@L2011
	or	 r15,r0,2
	br.n	 @L2011
	or	 r15,r0,1
	align	 4
@L1807:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r17]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L2011
	or	 r15,r0,1
	br.n	 @L2011
	or	 r15,r0,2
	align	 4
@L1805:
	or	 r15,r0,1
@L2011:
	st	 r15,r31,180
	ld.hu	 r12,r0,r20
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L1814
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L2020
	cmp	 r13,r12,63
	ld.bu	 r13,r20,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L1815
	ld	 r24,r20,4
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L1815
	ld	 r13,r24,4
	st	 r13,r20,4
	ld	 r13,r24,8
	bcnd	 eq0,r13,@L1818
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r20,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r20
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	br.n	 @L1813
	or	 r2,r0,r25
	align	 4
@L1815:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L1817
	cmp	 r13,r12,63
	ld	 r2,r20,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L1818
	st	 r2,r20,4
	align	 4
@L1817:
@L2020:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L1818
	ld	 r2,r20,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r20,4
	ld	 r2,r20,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r20,8
@L1818:
	br.n	 @L1813
	or	 r2,r0,r20
	align	 4
@L1814:
	ld	 r13,r20,8
	bcnd	 ne0,r13,@L1820
	ld	 r2,r20,4
	br.n	 @L2021
	or	 r20,r0,r2
	align	 4
@L1820:
	ld	 r2,r20,12
	bcnd	 ne0,r2,@L1813
	ld	 r13,r20,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r20,4
	bsr.n	 _gen_move_insn
	st	 r2,r20,12
	bsr.n	 _emit_insn_before
	ld	 r3,r20,8
	ld	 r2,r20,12
@L1813:
	or	 r20,r0,r2
@L2021:
	cmp	 r13,r17,16
	bb1.n	 ne,r13,@L1822
	or	 r18,r0,r20
	ld	 r15,r31,156
	mak	 r25,r15,0<2>
	bcnd.n	 ge0,r25,@L1823
	or	 r13,r0,r25
	addu	 r13,r25,3
@L1823:
	and	 r13,r13,0xfffc
	bcnd.n	 ne0,r22,@L1824
	subu	 r13,r25,r13
	bsr	 _abort
	align	 4
@L1824:
	ld	 r15,r31,156
	bcnd.n	 eq0,r15,@L2036
	subu	 r25,r25,r13
	ld	 r2,r20,4
	bsr.n	 _plus_constant_wide
	or	 r3,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,r20
	bsr.n	 _change_address
	or	 r3,r0,16
	or	 r18,r0,r2
	ld	 r15,r31,156
@L2036:
	bcnd.n	 eq0,r15,@L1826
	or	 r23,r0,r25
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,46
	bb1.n	 ne,r13,@L1827
	or	 r2,r0,46
	ld	 r4,r22,4
	or	 r3,r0,0
	subu	 r4,r4,r23
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L2037
@L2038:
	align	 4
@L1827:
	ld.bu	 r24,r22,2
	or	 r3,r0,0
	or.u	 r13,r0,hi16(_sub_optab)
	or	 r4,r0,r23
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_sub_optab)
	or	 r4,r0,r22
	or	 r6,r0,0
	or	 r7,r0,0
	or	 r8,r0,3
	or	 r5,r0,r2
	or	 r2,r0,r24
	bsr.n	 _expand_binop
	or	 r3,r0,r25
@L2012:
	or	 r22,r0,r2
@L1826:
	ld	 r15,r31,240
	bcnd	 ne0,r15,@L1829
	ld.hu	 r11,r0,r22
	ld	 r15,r31,180
	subu	 r13,r11,56
	mask	 r13,r13,0xffff
	cmp	 r12,r15,2
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1832
	extu	 r23,r12,1<eq>
	subu	 r13,r11,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1832
	mask	 r11,r11,0xffff
	cmp	 r13,r11,49
	cmp	 r12,r11,113
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L1831
	cmp	 r13,r11,51
@L1832:
	ld	 r3,r31,172
	or	 r2,r0,r22
	bsr.n	 _plus_constant_wide
	addu	 r1,r1,@L2039
@L2040:
	align	 4
@L1831:
	ld	 r15,r31,172
	cmp	 r12,r15,0
	and	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 ne0,r13,@L2013
	or	 r2,r0,r22
	or	 r2,r0,4
	bsr.n	 _copy_to_mode_reg
	or	 r3,r0,r22
	ld	 r15,r31,172
	bcnd.n	 eq0,r15,@L1836
	or	 r24,r0,r2
	ld	 r4,r31,172
	or	 r2,r0,46
	or.u	 r13,r0,hi16(_add_optab)
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_add_optab)
	or	 r5,r0,r2
	or	 r2,r0,4
	or	 r4,r0,r24
	or	 r7,r0,0
	or	 r8,r0,3
	or	 r6,r0,r4
	bsr.n	 _expand_binop
	or	 r3,r0,r25
	or	 r24,r0,r2
@L1836:
	or	 r2,r0,r24
@L2013:
	bsr	 _anti_adjust_stack
	ld	 r15,r31,172
	subu	 r12,r0,r23
	cmp	 r13,r15,0
	subu	 r12,r0,r12
	extu	 r13,r13,1<ne>
	or.u	 r11,r0,hi16(_virtual_outgoing_args_rtx)
	and	 r13,r13,r12
	ld	 r3,r11,lo16(_virtual_outgoing_args_rtx)
	bcnd.n	 eq0,r13,@L1837
	or	 r2,r0,r3
	bsr.n	 _plus_constant_wide
	ld	 r3,r31,172
	or	 r3,r0,r2
@L1837:
	or.u	 r13,r0,hi16(_class_narrowest_mode+4)
	ld	 r2,r13,lo16(_class_narrowest_mode+4)
	br.n	 @L2014
	st	 r0,r31,172
	align	 4
@L1829:
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,46
	bb1.n	 ne,r13,@L1839
	or	 r2,r0,63
	ld	 r3,r21,4
	ld	 r2,r31,240
	br.n	 @L2015
	addu	 r3,r23,r3
	align	 4
@L1839:
	ld	 r4,r31,240
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r5,r0,r21
	or	 r3,r0,r23
@L2015:
	bsr	 _plus_constant_wide
	or	 r3,r0,r2
	or	 r2,r0,16
@L2014:
	bsr	 _memory_address
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,46
	bb1.n	 ne,r13,@L1841
	or	 r4,r0,r2
	ld	 r7,r22,4
	cmp	 r13,r14,8
	cmp	 r12,r14,7
	or	 r5,r0,r14
	or	 r13,r13,r12
	or	 r6,r0,0
	extu	 r13,r13,1<gt>
	bcnd.n	 eq0,r13,@L1843
	or	 r10,r0,9
	or	 r5,r0,8
@L1843:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r8,r13,lo16(_mode_size)
	or.u	 r13,r0,hi16(_class_narrowest_mode+4)
@L2023:
	ld	 r12,r13,lo16(_class_narrowest_mode+4)
	bcnd.n	 eq0,r12,@L1848
	or	 r11,r0,0
	or.u	 r13,r0,hi16(_mode_wider_mode)
	or	 r9,r13,lo16(_mode_wider_mode)
@L1850:
	ld	 r13,r8[r12]
	cmp	 r13,r13,r10
	bb1	 ge,r13,@L1849
	or	 r11,r0,r12
@L1849:
	ld	 r12,r9[r12]
	bcnd	 ne0,r12,@L1850
@L1848:
	bcnd.n	 eq0,r11,@L1845
	or.u	 r13,r0,hi16(_mov_optab)
	ld	 r13,r13,lo16(_mov_optab)
	lda.d	 r13,r13[r11]
	ld	 r13,r13,4
	cmp	 r13,r13,210
	bb0	 ne,r13,@L1854
	ld	 r12,r8[r11]
	cmp	 r13,r12,8
	bb1.n	 gt,r13,@L1855
	cmp	 r13,r5,7
	cmp	 r13,r5,r12
	bb0	 ge,r13,@L1854
	br	 @L2022
	align	 4
@L1855:
	bb0	 gt,r13,@L1854
	ld	 r12,r8[r11]
@L2022:
	divu	 r13,r7,r12
	bcnd	 ne0,r12,@L1857
	tb0	 0,r0,503
@L1857:
	bcnd.n	 ne0,r12,@L1858
	addu	 r6,r6,r13
	tb0	 0,r0,503
@L1858:
	mul	 r13,r13,r12
	subu	 r7,r7,r13
@L1854:
	ld	 r10,r8[r11]
	cmp	 r13,r10,1
	bb1.n	 gt,r13,@L2023
	or.u	 r13,r0,hi16(_class_narrowest_mode+4)
@L1845:
	cmp	 r13,r6,1
	bb1.n	 gt,r13,@L2024
	or	 r2,r0,55
	bsr.n	 _gen_rtx
	or	 r3,r0,16
	ld	 r3,r22,4
	ld	 r24,r2,4
	ld	 r25,r18,4
	st	 r0,r31,140
	st	 r24,r31,108
	st	 r25,r31,124
	st	 r2,r31,104
	st	 r18,r31,120
	ld.hu	 r11,r0,r24
	subu	 r13,r11,85
	or	 r22,r0,r14
	mask	 r13,r13,0xffff
	or	 r23,r0,9
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1862
	or	 r12,r0,0
	subu	 r13,r11,87
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb0	 ls,r13,@L1861
@L1862:
	or	 r12,r0,1
@L1861:
	st	 r12,r31,112
	ld.hu	 r12,r0,r25
	subu	 r13,r12,85
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1864
	or	 r11,r0,0
	subu	 r13,r12,87
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb0	 ls,r13,@L1863
@L1864:
	or	 r11,r0,1
@L1863:
	st	 r11,r31,128
	st	 r0,r31,132
	st	 r0,r31,116
	ld.hu	 r13,r0,r24
	cmp	 r12,r13,85
	cmp	 r13,r13,87
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L1865
	st	 r12,r31,144
	st	 r3,r31,140
@L1865:
	bcnd.n	 eq0,r11,@L1867
	st	 r3,r31,136
	ld	 r13,r31,112
	bcnd.n	 ne0,r13,@L2025
	cmp	 r13,r22,8
@L1867:
	or	 r2,r0,r3
	bsr.n	 _move_by_pieces_ninsns
	or	 r3,r0,r22
	cmp	 r2,r2,2
	bb0.n	 gt,r2,@L2025
	cmp	 r13,r22,8
	ld	 r13,r31,128
	bcnd	 ne0,r13,@L1868
	ld.hu	 r12,r0,r25
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1869
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1869
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L1868
@L1869:
	bsr.n	 _copy_addr_to_reg
	or	 r2,r0,r25
	st	 r2,r31,124
@L1868:
	ld	 r13,r31,112
	bcnd.n	 ne0,r13,@L2025
	cmp	 r13,r22,8
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1871
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1871
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L2025
	cmp	 r13,r22,8
@L1871:
	bsr.n	 _copy_addr_to_reg
	or	 r2,r0,r24
	st	 r2,r31,108
	cmp	 r13,r22,8
@L2025:
	cmp	 r12,r22,7
	or	 r13,r13,r12
	extu	 r13,r13,1<gt>
	bcnd	 eq0,r13,@L1872
	or	 r22,r0,8
@L1872:
	cmp	 r13,r23,1
	bb0.n	 gt,r13,@L1874
	or.u	 r13,r0,hi16(_mode_size)
	or	 r24,r13,lo16(_mode_size)
	or.u	 r13,r0,hi16(_class_narrowest_mode+4)
@L2027:
	ld	 r12,r13,lo16(_class_narrowest_mode+4)
	bcnd.n	 eq0,r12,@L1877
	or	 r25,r0,0
	or.u	 r13,r0,hi16(_mode_wider_mode)
	or	 r11,r13,lo16(_mode_wider_mode)
@L1879:
	ld	 r13,r24[r12]
	cmp	 r13,r13,r23
	bb1	 ge,r13,@L1878
	or	 r25,r0,r12
@L1878:
	ld	 r12,r11[r12]
	bcnd	 ne0,r12,@L1879
@L1877:
	bcnd.n	 eq0,r25,@L1874
	or.u	 r13,r0,hi16(_mov_optab)
	ld	 r13,r13,lo16(_mov_optab)
	lda.d	 r13,r13[r25]
	ld	 r11,r13,4
	cmp	 r13,r11,210
	bb0	 ne,r13,@L1883
	ld	 r12,r24[r25]
	cmp	 r13,r12,8
	bb1.n	 gt,r13,@L1884
	cmp	 r13,r22,7
	cmp	 r13,r22,r12
	bb1.n	 ge,r13,@L2026
	or.u	 r13,r0,hi16(_insn_gen_function)
	br	 @L1883
	align	 4
@L1884:
	bb0.n	 gt,r13,@L1883
	or.u	 r13,r0,hi16(_insn_gen_function)
@L2026:
	or	 r13,r13,lo16(_insn_gen_function)
	or	 r3,r0,r25
	ld	 r2,r13[r11]
	bsr.n	 _move_by_pieces_1
	addu	 r4,r31,104
@L1883:
	ld	 r23,r24[r25]
	cmp	 r13,r23,1
	bb1.n	 gt,r13,@L2027
	or.u	 r13,r0,hi16(_class_narrowest_mode+4)
@L1874:
	ld	 r13,r31,136
	bcnd	 eq0,r13,@L1888
	bsr	 _abort
	align	 4
@L1841:
	or	 r2,r0,55
@L2024:
	bsr.n	 _gen_rtx
	or	 r3,r0,16
	or	 r25,r0,r2
	or	 r2,r0,46
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r14
	or	 r5,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,r18
	bsr.n	 _gen_movstrsi
	or	 r4,r0,r22
	bsr.n	 _emit_insn
	addu	 r1,r1,@L2041
@L2042:
	align	 4
@L1822:
	ld	 r15,r31,156
	bcnd.n	 le0,r15,@L1891
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r11,r13[r17]
	bcnd	 ge0,r11,@L1892
	addu	 r11,r11,3
@L1892:
	ld	 r15,r31,172
	cmp	 r12,r15,0
	ld	 r15,r31,240
	ext	 r16,r11,0<2>
	cmp	 r13,r15,0
	ld	 r21,r21,4
	and.c	 r12,r13,r12
	or	 r18,r0,0
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L1893
	st	 r21,r31,196
	ld	 r15,r31,180
	cmp	 r13,r15,0
	cmp	 r12,r15,2
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L1893
	or	 r2,r0,46
	ld	 r4,r31,172
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	bsr	 _anti_adjust_stack
@L1893:
	ld	 r15,r31,240
	ld.hu	 r11,r0,r20
	cmp	 r13,r15,0
	ld	 r15,r31,156
	ext	 r13,r13,1<ne>
	subu	 r12,r11,56
	and	 r18,r18,r13
	mask	 r12,r12,0xffff
	subu	 r19,r15,r18
	cmp	 r12,r12,1
	bb1.n	 ls,r12,@L1896
	or	 r21,r0,r19
	subu	 r13,r11,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1896
	mask	 r13,r11,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L1895
@L1896:
	ld.hu	 r13,r0,r20
	cmp	 r13,r13,47
	bb1	 ne,r13,@L1895
	ld.bu	 r13,r20,2
	bcnd.n	 eq0,r13,@L1895
	or	 r2,r0,r17
	bsr.n	 _force_const_mem
	or	 r3,r0,r20
	bsr	 _validize_mem
	or	 r20,r0,r2
@L1895:
	ld.hu	 r13,r0,r20
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L2028
	or	 r23,r0,r21
	ld	 r13,r20,4
	cmp	 r13,r13,63
	bb1.n	 gt,r13,@L2029
	cmp	 r13,r23,r16
	or.u	 r13,r0,hi16(_mode_class)
	ld.bu	 r12,r20,2
	or	 r13,r13,lo16(_mode_class)
	ld	 r13,r13[r12]
	cmp	 r13,r13,1
	bb0.n	 ne,r13,@L2029
	cmp	 r13,r23,r16
	bsr.n	 _copy_to_reg
	or	 r2,r0,r20
	or	 r20,r0,r2
	or	 r23,r0,r21
@L2028:
	cmp	 r13,r23,r16
@L2029:
	bb1.n	 ge,r13,@L1888
	subu	 r13,r16,r23
	bb0.n	 (31-31),r13,@L2030
	addu	 r22,r21,r18
	addu	 r13,r23,r18
	cmp	 r13,r23,r13
	bb1.n	 lt,r13,@L1999
	or	 r2,r0,r20
	or	 r3,r0,r23
	bsr.n	 _operand_subword_force
	or	 r4,r0,r17
	ld	 r15,r31,196
	or	 r25,r0,r2
	or	 r2,r0,46
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	lda	 r4,r15[r19]
	ld	 r15,r31,240
	st	 r2,r31,36
	or	 r2,r0,r25
	or	 r4,r0,0
	or	 r5,r0,0
	or	 r6,r0,r14
	or.u	 r13,r0,hi16(_word_mode)
	or	 r7,r0,0
	ld	 r3,r13,lo16(_word_mode)
	or	 r8,r0,0
	or	 r9,r0,0
	bsr.n	 _emit_push_insn
	st	 r15,r31,32
@L1999:
	addu	 r23,r23,1
	cmp	 r13,r23,r16
	bb1.n	 ge,r13,@L1888
	addu	 r22,r21,r18
@L2030:
	cmp	 r13,r23,r22
	bb1.n	 lt,r13,@L2002
	or	 r2,r0,r20
	or	 r3,r0,r23
	bsr.n	 _operand_subword_force
	or	 r4,r0,r17
	ld	 r15,r31,196
	or	 r25,r0,r2
	subu	 r4,r23,r21
	or	 r2,r0,46
	addu	 r4,r4,r19
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	lda	 r4,r15[r4]
	ld	 r15,r31,240
	st	 r2,r31,36
	or	 r2,r0,r25
	or	 r4,r0,0
	or	 r5,r0,0
	or	 r6,r0,r14
	or.u	 r13,r0,hi16(_word_mode)
	or	 r7,r0,0
	ld	 r3,r13,lo16(_word_mode)
	or	 r8,r0,0
	or	 r9,r0,0
	bsr.n	 _emit_push_insn
	st	 r15,r31,32
@L2002:
	addu	 r24,r23,1
	cmp	 r13,r24,r22
	bb1.n	 lt,r13,@L2005
	or	 r2,r0,r20
	or	 r3,r0,r24
	bsr.n	 _operand_subword_force
	or	 r4,r0,r17
	ld	 r15,r31,196
	or	 r25,r0,r2
	subu	 r4,r24,r21
	or	 r2,r0,46
	addu	 r4,r4,r19
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	lda	 r4,r15[r4]
	ld	 r15,r31,240
	st	 r2,r31,36
	or	 r2,r0,r25
	or	 r4,r0,0
	or	 r5,r0,0
	or	 r6,r0,r14
	or.u	 r13,r0,hi16(_word_mode)
	or	 r7,r0,0
	ld	 r3,r13,lo16(_word_mode)
	or	 r8,r0,0
	or	 r9,r0,0
	bsr.n	 _emit_push_insn
	st	 r15,r31,32
@L2005:
	addu	 r23,r23,2
	cmp	 r13,r23,r16
	bb1.n	 lt,r13,@L2030
	addu	 r22,r21,r18
	br	 @L1888
	align	 4
@L1891:
	ld	 r15,r31,172
	cmp	 r13,r15,0
	ld	 r15,r31,240
	cmp	 r12,r15,0
	and.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L1905
	ld	 r15,r31,180
	cmp	 r13,r15,0
	cmp	 r12,r15,2
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L1905
	or	 r2,r0,46
	ld	 r4,r31,172
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	bsr	 _anti_adjust_stack
@L1905:
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,46
	bb1	 ne,r13,@L1906
	ld	 r3,r21,4
	ld	 r2,r31,240
	bsr.n	 _plus_constant_wide
	addu	 r1,r1,@L2043
@L2044:
	align	 4
@L1906:
	ld	 r4,r31,240
	or	 r2,r0,63
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r5,r0,r21
@L2016:
	or	 r3,r0,r2
	bsr.n	 _memory_address
	or	 r2,r0,r17
	or	 r4,r0,r2
	or	 r2,r0,55
	bsr.n	 _gen_rtx
	or	 r3,r0,r17
	or	 r22,r0,r2
	ld.hu	 r11,r0,r22
	or.u	 r13,r0,hi16(_mode_class)
	ld.bu	 r21,r22,2
	or	 r13,r13,lo16(_mode_class)
	cmp	 r12,r11,59
	ld	 r18,r13[r21]
	bb0.n	 ne,r12,@L1910
	or	 r24,r0,r20
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L1913
	cmp	 r13,r11,63
	ld	 r2,r22,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L1914
	st	 r2,r22,4
	align	 4
@L1913:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L1914
	ld	 r2,r22,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r22,4
	ld	 r2,r22,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r22,8
@L1914:
	br.n	 @L1909
	or	 r2,r0,r22
	align	 4
@L1910:
	ld	 r13,r22,8
	bcnd	 ne0,r13,@L1916
	ld	 r2,r22,4
	br	 @L1909
	align	 4
@L1916:
	ld	 r2,r22,12
	bcnd	 ne0,r2,@L1909
	ld	 r13,r22,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r22,4
	bsr.n	 _gen_move_insn
	st	 r2,r22,12
	bsr.n	 _emit_insn_before
	ld	 r3,r22,8
	ld	 r2,r22,12
@L1909:
	ld.hu	 r12,r0,r24
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L1919
	or	 r22,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L2031
	cmp	 r13,r12,63
	ld.bu	 r13,r24,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L1920
	ld	 r23,r24,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L1920
	ld	 r13,r23,4
	st	 r13,r24,4
	ld	 r13,r23,8
	bcnd	 eq0,r13,@L1923
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r24,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r24
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	br.n	 @L1918
	or	 r2,r0,r25
	align	 4
@L1920:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L1922
	cmp	 r13,r12,63
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L1923
	st	 r2,r24,4
	align	 4
@L1922:
@L2031:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L1923
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,4
	ld	 r2,r24,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,8
@L1923:
	br.n	 @L1918
	or	 r2,r0,r24
	align	 4
@L1919:
	ld	 r13,r24,8
	bcnd	 ne0,r13,@L1925
	ld	 r2,r24,4
	br.n	 @L2032
	cmp	 r13,r21,16
	align	 4
@L1925:
	ld	 r2,r24,12
	bcnd.n	 ne0,r2,@L2032
	cmp	 r13,r21,16
	ld	 r13,r24,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r24,4
	bsr.n	 _gen_move_insn
	st	 r2,r24,12
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	ld	 r2,r24,12
@L1918:
	cmp	 r13,r21,16
@L2032:
	bb0.n	 ne,r13,@L1928
	or	 r24,r0,r2
	ld.bu	 r13,r24,2
	cmp	 r13,r13,r21
	bb0	 ne,r13,@L1927
	ld.bu	 r13,r24,2
	bcnd	 eq0,r13,@L1927
@L1928:
	bsr	 _abort
	align	 4
@L1927:
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1930
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1930
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L1929
@L1930:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,47
	bb1	 ne,r13,@L1929
	ld.bu	 r13,r24,2
	bcnd.n	 eq0,r13,@L1929
	or	 r2,r0,r21
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
@L1929:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,55
	bb1	 ne,r13,@L1931
	ld.bu	 r2,r22,2
	bsr.n	 _memory_address_p
	ld	 r3,r22,4
	bcnd.n	 ne0,r2,@L2033
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld.bu	 r3,r22,2
	bsr.n	 _push_operand
	or	 r2,r0,r22
	bcnd.n	 eq0,r2,@L1932
	or.u	 r13,r0,hi16(_flag_force_addr)
@L2033:
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L1931
	ld	 r13,r22,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1932
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1932
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L1931
@L1932:
	ld	 r4,r22,4
	or	 r2,r0,r22
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r22,r0,r2
@L1931:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L2034
	cmp	 r13,r21,16
	ld.bu	 r2,r24,2
	bsr.n	 _memory_address_p
	ld	 r3,r24,4
	bcnd.n	 eq0,r2,@L1935
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L1934
	ld	 r13,r24,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1935
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1935
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L2034
	cmp	 r13,r21,16
@L1935:
	ld	 r4,r24,4
	or	 r2,r0,r24
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r24,r0,r2
@L1934:
	cmp	 r13,r21,16
@L2034:
	bb1.n	 ne,r13,@L1936
	subu	 r13,r18,5
	bsr	 _abort
	align	 4
@L1936:
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L1937
	or.u	 r13,r0,hi16(_mode_unit_size)
	or	 r13,r13,lo16(_mode_unit_size)
	ld	 r12,r13[r21]
	or	 r3,r0,2
	cmp	 r13,r18,5
	bb1.n	 ne,r13,@L1938
	mak	 r2,r12,0<3>
	or	 r3,r0,1
@L1938:
	bsr.n	 _mode_for_size
	or	 r4,r0,0
	or	 r19,r0,r2
@L1937:
	or.u	 r23,r0,hi16(_mov_optab)
	ld	 r11,r23,lo16(_mov_optab)
	lda.d	 r13,r11[r21]
	ld	 r12,r13,4
	cmp	 r13,r12,210
	bb0.n	 ne,r13,@L1940
	or.u	 r13,r0,hi16(_insn_gen_function)
	or	 r13,r13,lo16(_insn_gen_function)
	or	 r2,r0,r22
	ld	 r13,r13[r12]
	jsr.n	 r13
	or	 r3,r0,r24
	bsr.n	 _emit_insn
	addu	 r1,r1,@L2045
@L2046:
	align	 4
@L1940:
	cmp	 r12,r19,16
	subu	 r13,r18,5
	extu	 r12,r12,1<ne>
	cmp	 r13,r13,1
	extu	 r13,r13,1<ls>
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L1942
	mak	 r25,r19,0<3>
	addu	 r13,r11,r25
	ld	 r13,r13,4
	cmp	 r13,r13,210
	bb0	 ne,r13,@L1942
	ld.bu	 r3,r22,2
	bsr.n	 _push_operand
	or	 r2,r0,r22
	bsr.n	 _get_last_insn
	or	 r21,r0,r2
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L1943
	or	 r16,r0,r2
	or	 r2,r0,42
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r22
	bsr	 _emit_insn
@L1943:
	ld	 r13,r23,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	addu	 r13,r13,r25
	ld	 r23,r13,4
	bcnd.n	 eq0,r21,@L1944
	or	 r18,r12,lo16(_insn_gen_function)
	or	 r2,r0,r22
	or	 r3,r0,r19
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L2047
@L2048:
	align	 4
@L1944:
	or	 r2,r0,r19
	bsr.n	 _gen_highpart
	or	 r3,r0,r22
@L2017:
	or	 r25,r0,r2
	or	 r2,r0,r19
	bsr.n	 _gen_highpart
	or	 r3,r0,r24
	ld	 r13,r18[r23]
	or	 r3,r0,r2
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	or.u	 r13,r0,hi16(_mov_optab)
	ld	 r13,r13,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	lda.d	 r13,r13[r19]
	ld	 r23,r13,4
	bcnd.n	 eq0,r21,@L1946
	or	 r18,r12,lo16(_insn_gen_function)
	or	 r2,r0,r22
	or	 r3,r0,r19
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L2049
@L2050:
	align	 4
@L1946:
	or	 r2,r0,r19
	bsr.n	 _gen_lowpart
	or	 r3,r0,r22
@L2018:
	or	 r25,r0,r2
	or	 r2,r0,r19
	bsr.n	 _gen_lowpart
	or	 r3,r0,r24
	ld	 r13,r18[r23]
	or	 r3,r0,r2
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	bcnd	 eq0,r16,@L1949
	ld	 r24,r16,12
	br	 @L1950
	align	 4
@L1949:
	bsr	 _get_insns
	or	 r24,r0,r2
@L1950:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	st	 r2,r24,28
	bsr.n	 _get_last_insn
	addu	 r1,r1,@L2051
@L2052:
	align	 4
@L1942:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r23,r13,lo16(_mode_size)
	ld	 r13,r23[r21]
	cmp	 r13,r13,4
	bb0	 gt,r13,@L1952
	bsr.n	 _get_last_insn
	or	 r25,r0,0
	or	 r19,r0,r2
	or	 r18,r0,r23
@L1953:
	ld	 r12,r18[r21]
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L1957
	addu	 r13,r12,6
@L1957:
	ext	 r13,r13,0<2>
	cmp	 r13,r25,r13
	bb0.n	 lt,r13,@L1954
	or	 r2,r0,r22
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	or	 r23,r0,r2
	or	 r2,r0,r24
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	or	 r3,r0,r2
	bcnd.n	 ne0,r3,@L2035
	cmp	 r13,r23,0
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1959
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1959
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L1958
	or	 r2,r0,r24
@L1959:
	or	 r2,r0,r21
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
	or	 r3,r0,r25
	or	 r4,r0,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	addu	 r1,r1,@L2053
@L2054:
	align	 4
@L1958:
	or	 r3,r0,r25
	bsr.n	 _operand_subword_force
	or	 r4,r0,r21
@L2019:
	or	 r3,r0,r2
	cmp	 r13,r23,0
@L2035:
	cmp	 r12,r3,0
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L1962
	or	 r2,r0,r23
	bsr	 _abort
	align	 4
@L1962:
	addu	 r25,r25,1
	bsr.n	 _emit_move_insn
	subu	 r1,r1,@L2055
@L2056:
	align	 4
@L1954:
	bcnd	 eq0,r19,@L1964
	ld	 r24,r19,12
	br	 @L1965
	align	 4
@L1964:
	bsr	 _get_insns
	or	 r24,r0,r2
@L1965:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	br.n	 @L1888
	st	 r2,r24,28
	align	 4
@L1952:
	bsr	 _abort
	align	 4
@L1888:
	ld	 r15,r31,156
	bcnd	 le0,r15,@L1967
	or	 r22,r0,r20
	ld.hu	 r12,r0,r22
	subu	 r13,r12,56
	ld	 r15,r31,164
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	ld	 r25,r15,4
	bb1.n	 ls,r13,@L1970
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1970
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L1969
@L1970:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,47
	bb1	 ne,r13,@L1969
	ld.bu	 r13,r22,2
	bcnd.n	 eq0,r13,@L1969
	or	 r2,r0,r17
	bsr.n	 _force_const_mem
	or	 r3,r0,r22
	bsr	 _validize_mem
	or	 r22,r0,r2
@L1969:
	ld	 r15,r31,156
	bcnd.n	 le0,r15,@L1967
	or	 r24,r0,0
	or	 r23,r0,r25
	mask	 r12,r15,3
	bcnd.n	 eq0,r12,@L1974
	or.u	 r21,r0,hi16(_word_mode)
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L1979
	cmp	 r13,r12,2
	bb0	 gt,r13,@L1980
	or	 r2,r0,51
	ld	 r3,r21,lo16(_word_mode)
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r25,r0,r2
	or	 r2,r0,r22
	or	 r3,r0,0
	or	 r4,r0,r17
	bsr.n	 _operand_subword_force
	addu	 r23,r23,1
	or	 r3,r0,r2
	or	 r2,r0,r25
	bsr.n	 _emit_move_insn
	or	 r24,r0,1
@L1980:
	ld	 r3,r21,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r25,r0,r2
	or	 r2,r0,r22
	or	 r3,r0,r24
	or	 r4,r0,r17
	bsr.n	 _operand_subword_force
	addu	 r23,r23,1
	or	 r3,r0,r2
	or	 r2,r0,r25
	bsr.n	 _emit_move_insn
	addu	 r24,r24,1
@L1979:
	ld	 r3,r21,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r25,r0,r2
	or	 r2,r0,r22
	or	 r3,r0,r24
	bsr.n	 _operand_subword_force
	or	 r4,r0,r17
	or	 r3,r0,r2
	bsr.n	 _emit_move_insn
	or	 r2,r0,r25
	ld	 r15,r31,156
	addu	 r24,r24,1
	cmp	 r13,r24,r15
	bb0.n	 lt,r13,@L1967
	addu	 r23,r23,1
@L1974:
	ld	 r3,r21,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r25,r0,r2
	or	 r2,r0,r22
	or	 r3,r0,r24
	bsr.n	 _operand_subword_force
	or	 r4,r0,r17
	or	 r3,r0,r2
	bsr.n	 _emit_move_insn
	or	 r2,r0,r25
	ld	 r3,r21,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	addu	 r4,r23,1
	addu	 r3,r24,1
	or	 r25,r0,r2
	or	 r2,r0,r22
	bsr.n	 _operand_subword_force
	or	 r4,r0,r17
	or	 r3,r0,r2
	bsr.n	 _emit_move_insn
	or	 r2,r0,r25
	ld	 r3,r21,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	addu	 r4,r23,2
	addu	 r3,r24,2
	or	 r25,r0,r2
	or	 r2,r0,r22
	bsr.n	 _operand_subword_force
	or	 r4,r0,r17
	or	 r3,r0,r2
	bsr.n	 _emit_move_insn
	or	 r2,r0,r25
	ld	 r3,r21,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	addu	 r4,r23,3
	addu	 r3,r24,3
	or	 r25,r0,r2
	or	 r2,r0,r22
	bsr.n	 _operand_subword_force
	or	 r4,r0,r17
	or	 r3,r0,r2
	bsr.n	 _emit_move_insn
	or	 r2,r0,r25
	ld	 r15,r31,156
	addu	 r24,r24,4
	cmp	 r13,r24,r15
	bb1.n	 lt,r13,@L1974
	addu	 r23,r23,4
@L1967:
	ld	 r15,r31,172
	cmp	 r13,r15,0
	ld	 r15,r31,240
	cmp	 r12,r15,0
	and.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L1976
	ld	 r15,r31,180
	cmp	 r13,r15,2
	bb1.n	 ne,r13,@L1976
	or	 r2,r0,46
	ld	 r4,r31,172
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	bsr	 _anti_adjust_stack
@L1976:
@Lte20:
	ld	 r1,r31,96
	ld.d	 r24,r31,88
	ld.d	 r22,r31,80
	ld.d	 r20,r31,72
	ld.d	 r18,r31,64
	ld.d	 r16,r31,56
	ld.d	 r14,r31,48
	jmp.n	 r1
	addu	 r31,r31,208
	def	 @L2055,@L2056-@L1953
	def	 @L2053,@L2019-@L2054
	def	 @L2051,@L1888-@L2052
	def	 @L2049,@L2018-@L2050
	def	 @L2047,@L2017-@L2048
	def	 @L2045,@L1888-@L2046
	def	 @L2043,@L2016-@L2044
	def	 @L2041,@L1888-@L2042
	def	 @L2039,@L2013-@L2040
	def	 @L2037,@L2012-@L2038

