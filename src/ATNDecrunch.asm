
; *** Decrunch a ATN! file
; in: A0: crunched buffer
;     A1: decrunched dest (may be the same)

; out: D0=0 if not a ATN file
	movem.w	D7,-(a7)
	; save header
	move.l	(A0),-(A7)
	move.l	4(A0),-(A7)
	cmp.l	A0,A1
	sne	D7	; D7 != 0 if source != dest
	MOVEM.L	A0-A1,-(A7)
	bsr	.do_atn
	MOVEM.L	(A7)+,A0-A1
	tst.b	D7
	beq.b	.same
	; restore decrunch header if source != dest
	move.l	(A7)+,4(A0)
	move.l	(A7)+,(A0)
	movem.w	(a7)+,D7
	RTS
	
.same
	add.l	#8,A7
	movem.w	(a7)+,D7
	RTS
	
.do_atn
	MOVEM.L	D2-D5/A2-A5,-(A7)
	MOVE.L	A0,A3
	MOVE.L	A1,A4
	MOVE.L	A1,A5
	CMPI.L	#'ATN!',(A0)
	BEQ.B	.decrunch
	CMPI.L	#'IMP!',(A0)
	bne	LB_BA8A

.decrunch
	addq.l	#4,A0
	ADDA.L	(A0)+,A4
	ADDA.L	(A0)+,A3
	MOVE.L	A3,A2
	MOVE.L	(A2)+,-(A0)
	MOVE.L	(A2)+,-(A0)
	MOVE.L	(A2)+,-(A0)
	MOVE.L	(A2)+,D2
	MOVE.W	(A2)+,D3
	BMI.B	LB_BA60
	SUBQ.L	#1,A3
LB_BA60	LEA	-$001C(A7),A7
	MOVE.L	A7,A1
	MOVEQ	#$06,D0
LB_BA68	MOVE.L	(A2)+,(A1)+
	DBF	D0,LB_BA68
	MOVE.L	A7,A1
	MOVEQ	#$00,D4
LB_BA72	TST.L	D2
	BEQ.B	LB_BA7C
LB_BA76	MOVE.B	-(A3),-(A4)
	SUBQ.L	#1,D2
	BNE.B	LB_BA76
LB_BA7C	CMPA.L	A4,A5
	BCS.B	LB_BA94
	LEA	$001C(A7),A7
	MOVEQ	#-$01,D0
	CMPA.L	A3,A0
	BEQ.B	LB_BA8C

LB_BA8A	MOVEQ	#$00,D0
LB_BA8C	MOVEM.L	(A7)+,D2-D5/A2-A5
	TST.L	D0
	RTS

LB_BA94	ADD.B	D3,D3
	BNE.B	LB_BA9C
	MOVE.B	-(A3),D3
	ADDX.B	D3,D3
LB_BA9C	BCC.B	LB_BB02
	ADD.B	D3,D3
	BNE.B	LB_BAA6
	MOVE.B	-(A3),D3
	ADDX.B	D3,D3
LB_BAA6	BCC.B	LB_BAFC
	ADD.B	D3,D3
	BNE.B	LB_BAB0
	MOVE.B	-(A3),D3
	ADDX.B	D3,D3
LB_BAB0	BCC.B	LB_BAF6
	ADD.B	D3,D3
	BNE.B	LB_BABA
	MOVE.B	-(A3),D3
	ADDX.B	D3,D3
LB_BABA	BCC.B	LB_BAF0
	ADD.B	D3,D3
	BNE.B	LB_BAC4
	MOVE.B	-(A3),D3
	ADDX.B	D3,D3
LB_BAC4	BCC.B	LB_BACC
	MOVE.B	-(A3),D4
	MOVEQ	#$03,D0
	BRA.B	LB_BB06
LB_BACC	ADD.B	D3,D3
	BNE.B	LB_BAD4
	MOVE.B	-(A3),D3
	ADDX.B	D3,D3
LB_BAD4	ADDX.B	D4,D4
	ADD.B	D3,D3
	BNE.B	LB_BADE
	MOVE.B	-(A3),D3
	ADDX.B	D3,D3
LB_BADE	ADDX.B	D4,D4
	ADD.B	D3,D3
	BNE.B	LB_BAE8
	MOVE.B	-(A3),D3
	ADDX.B	D3,D3
LB_BAE8	ADDX.B	D4,D4
	ADDQ.B	#6,D4
	MOVEQ	#$03,D0
	BRA.B	LB_BB06
LB_BAF0	MOVEQ	#$05,D4
	MOVEQ	#$03,D0
	BRA.B	LB_BB06
LB_BAF6	MOVEQ	#$04,D4
	MOVEQ	#$02,D0
	BRA.B	LB_BB06
LB_BAFC	MOVEQ	#$03,D4
	MOVEQ	#$01,D0
	BRA.B	LB_BB06
LB_BB02	MOVEQ	#$02,D4
	MOVEQ	#$00,D0
LB_BB06	MOVEQ	#$00,D5
	MOVE.W	D0,D1
	ADD.B	D3,D3
	BNE.B	LB_BB12
	MOVE.B	-(A3),D3
	ADDX.B	D3,D3
LB_BB12	BCC.B	LB_BB2A
	ADD.B	D3,D3
	BNE.B	LB_BB1C
	MOVE.B	-(A3),D3
	ADDX.B	D3,D3
LB_BB1C	BCC.B	LB_BB26
	MOVE.B	LB_BB8A(PC,D0.W),D5
	ADDQ.B	#8,D0
	BRA.B	LB_BB2A
LB_BB26	MOVEQ	#$02,D5
	ADDQ.B	#4,D0
LB_BB2A	MOVE.B	LB_BB8E(PC,D0.W),D0
LB_BB2E	ADD.B	D3,D3
	BNE.B	LB_BB36
	MOVE.B	-(A3),D3
	ADDX.B	D3,D3
LB_BB36	ADDX.W	D2,D2
	SUBQ.B	#1,D0
	BNE.B	LB_BB2E
	ADD.W	D5,D2
	MOVEQ	#$00,D5
	MOVE.L	D5,A2
	MOVE.W	D1,D0
	ADD.B	D3,D3
	BNE.B	LB_BB4C
	MOVE.B	-(A3),D3
	ADDX.B	D3,D3
LB_BB4C	BCC.B	LB_BB68
	ADD.W	D1,D1
	ADD.B	D3,D3
	BNE.B	LB_BB58
	MOVE.B	-(A3),D3
	ADDX.B	D3,D3
LB_BB58	BCC.B	LB_BB62
	MOVE.W	$08(A1,D1.W),A2
	ADDQ.B	#8,D0
	BRA.B	LB_BB68
LB_BB62	MOVE.W	$00(A1,D1.W),A2
	ADDQ.B	#4,D0
LB_BB68	MOVE.B	$10(A1,D0.W),D0
LB_BB6C	ADD.B	D3,D3
	BNE.B	LB_BB74
	MOVE.B	-(A3),D3
	ADDX.B	D3,D3
LB_BB74	ADDX.L	D5,D5
	SUBQ.B	#1,D0
	BNE.B	LB_BB6C
	ADDQ.W	#1,A2
	ADDA.L	D5,A2
	ADDA.L	A4,A2
LB_BB80	MOVE.B	-(A2),-(A4)
	SUBQ.B	#1,D4
	BNE.B	LB_BB80
	BRA.W	LB_BA72
LB_BB8A:
	dc.l	$060A0A12
LB_BB8E:
	dc.l	$01010101
	dc.l	$02030304
	dc.l	$0405070E

