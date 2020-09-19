	IFND	VECTORS_I
VECTORS_I	SET	1

SR_TRACE		EQU	$8000
SR_SUPERVISOR		EQU	$2000
SR_IPL1			EQU	$0100
SR_IPL2			EQU	$0200
SR_IPL3			EQU	$0400

BUS_ERR_VECTOR		EQU	$8
ADDR_ERR_VECTOR		EQU	$C
ILLEGAL_VECTOR		EQU	$10
ZERO_DEVIDE_VECTOR	EQU	$14
CHK_VECTOR		EQU	$18
TRAPV_VECTOR		EQU	$1C
PIVILIGE_VIOL_VECTOR	EQU	$20
TRACE_VECTOR		EQU	$24
LINEA_VECTOR		EQU	$28
LINEF_VECTOR		EQU	$2C
TRAP0_VECTOR		EQU	$80
TRAP1_VECTOR		EQU	$84
TRAP2_VECTOR		EQU	$88
TRAP3_VECTOR		EQU	$8C
TRAP4_VECTOR		EQU	$90
TRAP5_VECTOR		EQU	$94
TRAP6_VECTOR		EQU	$98
TRAP7_VECTOR		EQU	$9C
TRAP8_VECTOR		EQU	$A0
TRAP9_VECTOR		EQU	$A4
TRAPA_VECTOR		EQU	$A8
TRAPB_VECTOR		EQU	$AC
TRAPC_VECTOR		EQU	$B0
TRAPD_VECTOR		EQU	$B4
TRAPE_VECTOR		EQU	$B8
TRAPF_VECTOR		EQU	$BC

	ENDC
