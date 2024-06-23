opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 9453"

opt pagewidth 120

	opt lm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_I2C_Initialize
	FNCALL	_main,_I2C_Begin
	FNCALL	_main,_I2C_Write
	FNCALL	_main,_I2C_End
	FNCALL	_I2C_End,_I2C_Hold
	FNCALL	_I2C_Write,_I2C_Hold
	FNCALL	_I2C_Begin,_I2C_Hold
	FNCALL	_I2C_Initialize,___lmul
	FNCALL	_I2C_Initialize,___lldiv
	FNROOT	_main
	global	_SSPBUF
psect	text211,local,class=CODE,delta=2
global __ptext211
__ptext211:
_SSPBUF	set	19
	global	_SSPCON
_SSPCON	set	20
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_SSPADD
_SSPADD	set	147
	global	_SSPCON2
_SSPCON2	set	145
	global	_SSPSTAT
_SSPSTAT	set	148
	global	_ACKDT
_ACKDT	set	1165
	global	_ACKEN
_ACKEN	set	1164
	global	_PEN
_PEN	set	1162
	global	_RCEN
_RCEN	set	1163
	global	_SEN
_SEN	set	1160
	global	_TRISC3
_TRISC3	set	1083
	global	_TRISC4
_TRISC4	set	1084
	global	_EEADR
_EEADR	set	269
	global	_EEDATA
_EEDATA	set	268
	global	_EECON1
_EECON1	set	396
	global	_EECON2
_EECON2	set	397
	global	_RD
_RD	set	3168
	global	_WR
_WR	set	3169
	global	_WREN
_WREN	set	3170
	file	"I2C Master.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_I2C_Begin
?_I2C_Begin:	; 0 bytes @ 0x0
	global	??_I2C_Begin
??_I2C_Begin:	; 0 bytes @ 0x0
	global	?_I2C_Write
?_I2C_Write:	; 0 bytes @ 0x0
	global	?_I2C_End
?_I2C_End:	; 0 bytes @ 0x0
	global	??_I2C_End
??_I2C_End:	; 0 bytes @ 0x0
	global	?_I2C_Hold
?_I2C_Hold:	; 0 bytes @ 0x0
	global	??_I2C_Hold
??_I2C_Hold:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
	global	?___lmul
?___lmul:	; 4 bytes @ 0x0
	global	I2C_Write@data
I2C_Write@data:	; 2 bytes @ 0x0
	global	___lmul@multiplier
___lmul@multiplier:	; 4 bytes @ 0x0
	ds	2
	global	??_I2C_Write
??_I2C_Write:	; 0 bytes @ 0x2
	ds	2
	global	___lmul@multiplicand
___lmul@multiplicand:	; 4 bytes @ 0x4
	ds	4
	global	??___lmul
??___lmul:	; 0 bytes @ 0x8
	ds	1
	global	___lmul@product
___lmul@product:	; 4 bytes @ 0x9
	ds	4
	global	??___lldiv
??___lldiv:	; 0 bytes @ 0xD
	ds	1
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?___lldiv
?___lldiv:	; 4 bytes @ 0x0
	global	___lldiv@divisor
___lldiv@divisor:	; 4 bytes @ 0x0
	ds	4
	global	___lldiv@dividend
___lldiv@dividend:	; 4 bytes @ 0x4
	ds	4
	global	___lldiv@quotient
___lldiv@quotient:	; 4 bytes @ 0x8
	ds	4
	global	___lldiv@counter
___lldiv@counter:	; 1 bytes @ 0xC
	ds	1
	global	?_I2C_Initialize
?_I2C_Initialize:	; 0 bytes @ 0xD
	global	I2C_Initialize@feq_K
I2C_Initialize@feq_K:	; 4 bytes @ 0xD
	ds	4
	global	??_I2C_Initialize
??_I2C_Initialize:	; 0 bytes @ 0x11
	ds	4
	global	??_main
??_main:	; 0 bytes @ 0x15
	ds	3
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80     24      24
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___lmul	unsigned long  size(1) Largest target is 0
;;
;; ?___lldiv	unsigned long  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _I2C_Initialize->___lldiv
;;   ___lldiv->___lmul
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_I2C_Initialize
;;   _I2C_Initialize->___lldiv
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 3     3      0     259
;;                                             21 BANK0      3     3      0
;;                     _I2C_Initialize
;;                          _I2C_Begin
;;                          _I2C_Write
;;                            _I2C_End
;; ---------------------------------------------------------------------------------
;; (1) _I2C_End                                              0     0      0       0
;;                           _I2C_Hold
;; ---------------------------------------------------------------------------------
;; (1) _I2C_Write                                            2     0      2      15
;;                                              0 COMMON     2     0      2
;;                           _I2C_Hold
;; ---------------------------------------------------------------------------------
;; (1) _I2C_Begin                                            0     0      0       0
;;                           _I2C_Hold
;; ---------------------------------------------------------------------------------
;; (1) _I2C_Initialize                                       8     4      4     244
;;                                             13 BANK0      8     4      4
;;                             ___lmul
;;                            ___lldiv
;; ---------------------------------------------------------------------------------
;; (2) ___lldiv                                             14     6      8     162
;;                                             13 COMMON     1     1      0
;;                                              0 BANK0     13     5      8
;;                             ___lmul (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___lmul                                              13     5      8      60
;;                                              0 COMMON    13     5      8
;; ---------------------------------------------------------------------------------
;; (2) _I2C_Hold                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _I2C_Initialize
;;     ___lmul
;;     ___lldiv
;;       ___lmul (ARG)
;;   _I2C_Begin
;;     _I2C_Hold
;;   _I2C_Write
;;     _I2C_Hold
;;   _I2C_End
;;     _I2C_Hold
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      E       E       1      100.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       2       2        0.0%
;;ABS                  0      0       0       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50     18      18       5       30.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0       0      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 10 in file "C:\Users\ELCOT\Desktop\pic16f877a I2C\I2C M.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  696[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_I2C_Initialize
;;		_I2C_Begin
;;		_I2C_Write
;;		_I2C_End
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\ELCOT\Desktop\pic16f877a I2C\I2C M.c"
	line	10
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	11
	
l2754:	
;I2C M.c: 11: I2C_Initialize(100);
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_I2C_Initialize+3)
	movlw	0
	movwf	(?_I2C_Initialize+2)
	movlw	0
	movwf	(?_I2C_Initialize+1)
	movlw	064h
	movwf	(?_I2C_Initialize)

	fcall	_I2C_Initialize
	line	12
;I2C M.c: 12: while(1)
	
l697:	
	line	14
;I2C M.c: 13: {
;I2C M.c: 14: I2C_Begin();
	fcall	_I2C_Begin
	line	15
;I2C M.c: 15: I2C_Write(0xD0);
	movlw	low(0D0h)
	movwf	(?_I2C_Write)
	movlw	high(0D0h)
	movwf	((?_I2C_Write))+1
	fcall	_I2C_Write
	line	16
;I2C M.c: 16: I2C_Write(0x55);
	movlw	low(055h)
	movwf	(?_I2C_Write)
	movlw	high(055h)
	movwf	((?_I2C_Write))+1
	fcall	_I2C_Write
	line	17
;I2C M.c: 17: I2C_End();
	fcall	_I2C_End
	line	18
	
l2756:	
;I2C M.c: 18: _delay((unsigned long)((1000)*(20000000/4000.0)));
	opt asmopt_off
movlw  26
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	94
movwf	((??_main+0)+0+1),f
	movlw	134
movwf	((??_main+0)+0),f
u2357:
	decfsz	((??_main+0)+0),f
	goto	u2357
	decfsz	((??_main+0)+0+1),f
	goto	u2357
	decfsz	((??_main+0)+0+2),f
	goto	u2357
	clrwdt
opt asmopt_on

	line	19
	
l2758:	
;I2C M.c: 19: I2C_Begin();
	fcall	_I2C_Begin
	line	20
	
l2760:	
;I2C M.c: 20: I2C_Write(0xD0);
	movlw	low(0D0h)
	movwf	(?_I2C_Write)
	movlw	high(0D0h)
	movwf	((?_I2C_Write))+1
	fcall	_I2C_Write
	line	21
	
l2762:	
;I2C M.c: 21: I2C_Write(0x88);
	movlw	low(088h)
	movwf	(?_I2C_Write)
	movlw	high(088h)
	movwf	((?_I2C_Write))+1
	fcall	_I2C_Write
	line	22
	
l2764:	
;I2C M.c: 22: I2C_End();
	fcall	_I2C_End
	line	23
	
l2766:	
;I2C M.c: 23: _delay((unsigned long)((1000)*(20000000/4000.0)));
	opt asmopt_off
movlw  26
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	94
movwf	((??_main+0)+0+1),f
	movlw	134
movwf	((??_main+0)+0),f
u2367:
	decfsz	((??_main+0)+0),f
	goto	u2367
	decfsz	((??_main+0)+0+1),f
	goto	u2367
	decfsz	((??_main+0)+0+2),f
	goto	u2367
	clrwdt
opt asmopt_on

	goto	l697
	line	31
	
l698:	
	line	12
	goto	l697
	
l699:	
	line	32
	
l700:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_I2C_End
psect	text212,local,class=CODE,delta=2
global __ptext212
__ptext212:

;; *************** function _I2C_End *****************
;; Defined at:
;;		line 59 in file "C:\Users\ELCOT\Desktop\pic16f877a I2C\I2C M.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_I2C_Hold
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text212
	file	"C:\Users\ELCOT\Desktop\pic16f877a I2C\I2C M.c"
	line	59
	global	__size_of_I2C_End
	__size_of_I2C_End	equ	__end_of_I2C_End-_I2C_End
	
_I2C_End:	
	opt	stack 6
; Regs used in _I2C_End: [wreg+status,2+status,0+pclath+cstack]
	line	60
	
l2698:	
;I2C M.c: 60: I2C_Hold();
	fcall	_I2C_Hold
	line	61
	
l2700:	
;I2C M.c: 61: PEN = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1162/8)^080h,(1162)&7
	line	62
	
l712:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_End
	__end_of_I2C_End:
;; =============== function _I2C_End ends ============

	signat	_I2C_End,88
	global	_I2C_Write
psect	text213,local,class=CODE,delta=2
global __ptext213
__ptext213:

;; *************** function _I2C_Write *****************
;; Defined at:
;;		line 49 in file "C:\Users\ELCOT\Desktop\pic16f877a I2C\I2C M.c"
;; Parameters:    Size  Location     Type
;;  data            2    0[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_I2C_Hold
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text213
	file	"C:\Users\ELCOT\Desktop\pic16f877a I2C\I2C M.c"
	line	49
	global	__size_of_I2C_Write
	__size_of_I2C_Write	equ	__end_of_I2C_Write-_I2C_Write
	
_I2C_Write:	
	opt	stack 6
; Regs used in _I2C_Write: [wreg+status,2+status,0+pclath+cstack]
	line	50
	
l2694:	
;I2C M.c: 50: I2C_Hold();
	fcall	_I2C_Hold
	line	51
	
l2696:	
;I2C M.c: 51: SSPBUF = data;
	movf	(I2C_Write@data),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(19)	;volatile
	line	52
	
l706:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Write
	__end_of_I2C_Write:
;; =============== function _I2C_Write ends ============

	signat	_I2C_Write,4216
	global	_I2C_Begin
psect	text214,local,class=CODE,delta=2
global __ptext214
__ptext214:

;; *************** function _I2C_Begin *****************
;; Defined at:
;;		line 54 in file "C:\Users\ELCOT\Desktop\pic16f877a I2C\I2C M.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_I2C_Hold
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text214
	file	"C:\Users\ELCOT\Desktop\pic16f877a I2C\I2C M.c"
	line	54
	global	__size_of_I2C_Begin
	__size_of_I2C_Begin	equ	__end_of_I2C_Begin-_I2C_Begin
	
_I2C_Begin:	
	opt	stack 6
; Regs used in _I2C_Begin: [wreg+status,2+status,0+pclath+cstack]
	line	55
	
l2690:	
;I2C M.c: 55: I2C_Hold();
	fcall	_I2C_Hold
	line	56
	
l2692:	
;I2C M.c: 56: SEN = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1160/8)^080h,(1160)&7
	line	57
	
l709:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Begin
	__end_of_I2C_Begin:
;; =============== function _I2C_Begin ends ============

	signat	_I2C_Begin,88
	global	_I2C_Initialize
psect	text215,local,class=CODE,delta=2
global __ptext215
__ptext215:

;; *************** function _I2C_Initialize *****************
;; Defined at:
;;		line 68 in file "C:\Users\ELCOT\Desktop\pic16f877a I2C\I2C M.c"
;; Parameters:    Size  Location     Type
;;  feq_K           4   13[BANK0 ] const unsigned long 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0       8       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___lmul
;;		___lldiv
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text215
	file	"C:\Users\ELCOT\Desktop\pic16f877a I2C\I2C M.c"
	line	68
	global	__size_of_I2C_Initialize
	__size_of_I2C_Initialize	equ	__end_of_I2C_Initialize-_I2C_Initialize
	
_I2C_Initialize:	
	opt	stack 6
; Regs used in _I2C_Initialize: [wreg+status,2+status,0+pclath+cstack]
	line	69
	
l2744:	
;I2C M.c: 69: TRISC3 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1083/8)^080h,(1083)&7
	line	70
;I2C M.c: 70: TRISC4 = 1;
	bsf	(1084/8)^080h,(1084)&7
	line	72
	
l2746:	
;I2C M.c: 72: SSPCON = 0b00101000;
	movlw	(028h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	73
	
l2748:	
;I2C M.c: 73: SSPCON2 = 0b00000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(145)^080h	;volatile
	line	75
	
l2750:	
;I2C M.c: 75: SSPADD = (20000000/(4*feq_K*100))-1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(I2C_Initialize@feq_K),w
	movwf	(??_I2C_Initialize+0)+0
	movf	(I2C_Initialize@feq_K+1),w
	movwf	((??_I2C_Initialize+0)+0+1)
	movf	(I2C_Initialize@feq_K+2),w
	movwf	((??_I2C_Initialize+0)+0+2)
	movf	(I2C_Initialize@feq_K+3),w
	movwf	((??_I2C_Initialize+0)+0+3)
	movlw	02h
u2345:
	clrc
	rlf	(??_I2C_Initialize+0)+0,f
	rlf	(??_I2C_Initialize+0)+1,f
	rlf	(??_I2C_Initialize+0)+2,f
	rlf	(??_I2C_Initialize+0)+3,f
u2340:
	addlw	-1
	skipz
	goto	u2345
	movf	3+(??_I2C_Initialize+0)+0,w
	movwf	(?___lmul+3)
	movf	2+(??_I2C_Initialize+0)+0,w
	movwf	(?___lmul+2)
	movf	1+(??_I2C_Initialize+0)+0,w
	movwf	(?___lmul+1)
	movf	0+(??_I2C_Initialize+0)+0,w
	movwf	(?___lmul)

	movlw	0
	movwf	3+(?___lmul)+04h
	movlw	0
	movwf	2+(?___lmul)+04h
	movlw	0
	movwf	1+(?___lmul)+04h
	movlw	064h
	movwf	0+(?___lmul)+04h

	fcall	___lmul
	movf	(3+(?___lmul)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___lldiv+3)
	movf	(2+(?___lmul)),w
	movwf	(?___lldiv+2)
	movf	(1+(?___lmul)),w
	movwf	(?___lldiv+1)
	movf	(0+(?___lmul)),w
	movwf	(?___lldiv)

	movlw	01h
	movwf	3+(?___lldiv)+04h
	movlw	031h
	movwf	2+(?___lldiv)+04h
	movlw	02Dh
	movwf	1+(?___lldiv)+04h
	movlw	0
	movwf	0+(?___lldiv)+04h

	fcall	___lldiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(((0+(?___lldiv)))),w
	addlw	0FFh
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(147)^080h	;volatile
	line	76
	
l2752:	
;I2C M.c: 76: SSPSTAT = 0b00000000;
	clrf	(148)^080h	;volatile
	line	77
	
l721:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Initialize
	__end_of_I2C_Initialize:
;; =============== function _I2C_Initialize ends ============

	signat	_I2C_Initialize,4216
	global	___lldiv
psect	text216,local,class=CODE,delta=2
global __ptext216
__ptext216:

;; *************** function ___lldiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lldiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         4    0[BANK0 ] unsigned long 
;;  dividend        4    4[BANK0 ] unsigned long 
;; Auto vars:     Size  Location     Type
;;  quotient        4    8[BANK0 ] unsigned long 
;;  counter         1   12[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    0[BANK0 ] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       8       0       0       0
;;      Locals:         0       5       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         1      13       0       0       0
;;Total ram usage:       14 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_I2C_Initialize
;; This function uses a non-reentrant model
;;
psect	text216
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lldiv.c"
	line	5
	global	__size_of___lldiv
	__size_of___lldiv	equ	__end_of___lldiv-___lldiv
	
___lldiv:	
	opt	stack 6
; Regs used in ___lldiv: [wreg+status,2+status,0]
	line	9
	
l2720:	
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(___lldiv@quotient+3)
	movlw	0
	movwf	(___lldiv@quotient+2)
	movlw	0
	movwf	(___lldiv@quotient+1)
	movlw	0
	movwf	(___lldiv@quotient)

	line	10
	movf	(___lldiv@divisor+3),w
	iorwf	(___lldiv@divisor+2),w
	iorwf	(___lldiv@divisor+1),w
	iorwf	(___lldiv@divisor),w
	skipnz
	goto	u2271
	goto	u2270
u2271:
	goto	l2740
u2270:
	line	11
	
l2722:	
	clrf	(___lldiv@counter)
	bsf	status,0
	rlf	(___lldiv@counter),f
	line	12
	goto	l2726
	
l1578:	
	line	13
	
l2724:	
	movlw	01h
	movwf	(??___lldiv+0)+0
u2285:
	clrc
	rlf	(___lldiv@divisor),f
	rlf	(___lldiv@divisor+1),f
	rlf	(___lldiv@divisor+2),f
	rlf	(___lldiv@divisor+3),f
	decfsz	(??___lldiv+0)+0
	goto	u2285
	line	14
	movlw	(01h)
	movwf	(??___lldiv+0)+0
	movf	(??___lldiv+0)+0,w
	addwf	(___lldiv@counter),f
	goto	l2726
	line	15
	
l1577:	
	line	12
	
l2726:	
	btfss	(___lldiv@divisor+3),(31)&7
	goto	u2291
	goto	u2290
u2291:
	goto	l2724
u2290:
	goto	l2728
	
l1579:	
	goto	l2728
	line	16
	
l1580:	
	line	17
	
l2728:	
	movlw	01h
	movwf	(??___lldiv+0)+0
u2305:
	clrc
	rlf	(___lldiv@quotient),f
	rlf	(___lldiv@quotient+1),f
	rlf	(___lldiv@quotient+2),f
	rlf	(___lldiv@quotient+3),f
	decfsz	(??___lldiv+0)+0
	goto	u2305
	line	18
	
l2730:	
	movf	(___lldiv@divisor+3),w
	subwf	(___lldiv@dividend+3),w
	skipz
	goto	u2315
	movf	(___lldiv@divisor+2),w
	subwf	(___lldiv@dividend+2),w
	skipz
	goto	u2315
	movf	(___lldiv@divisor+1),w
	subwf	(___lldiv@dividend+1),w
	skipz
	goto	u2315
	movf	(___lldiv@divisor),w
	subwf	(___lldiv@dividend),w
u2315:
	skipc
	goto	u2311
	goto	u2310
u2311:
	goto	l2736
u2310:
	line	19
	
l2732:	
	movf	(___lldiv@divisor),w
	subwf	(___lldiv@dividend),f
	movf	(___lldiv@divisor+1),w
	skipc
	incfsz	(___lldiv@divisor+1),w
	subwf	(___lldiv@dividend+1),f
	movf	(___lldiv@divisor+2),w
	skipc
	incfsz	(___lldiv@divisor+2),w
	subwf	(___lldiv@dividend+2),f
	movf	(___lldiv@divisor+3),w
	skipc
	incfsz	(___lldiv@divisor+3),w
	subwf	(___lldiv@dividend+3),f
	line	20
	
l2734:	
	bsf	(___lldiv@quotient)+(0/8),(0)&7
	goto	l2736
	line	21
	
l1581:	
	line	22
	
l2736:	
	movlw	01h
u2325:
	clrc
	rrf	(___lldiv@divisor+3),f
	rrf	(___lldiv@divisor+2),f
	rrf	(___lldiv@divisor+1),f
	rrf	(___lldiv@divisor),f
	addlw	-1
	skipz
	goto	u2325

	line	23
	
l2738:	
	movlw	low(01h)
	subwf	(___lldiv@counter),f
	btfss	status,2
	goto	u2331
	goto	u2330
u2331:
	goto	l2728
u2330:
	goto	l2740
	
l1582:	
	goto	l2740
	line	24
	
l1576:	
	line	25
	
l2740:	
	movf	(___lldiv@quotient+3),w
	movwf	(?___lldiv+3)
	movf	(___lldiv@quotient+2),w
	movwf	(?___lldiv+2)
	movf	(___lldiv@quotient+1),w
	movwf	(?___lldiv+1)
	movf	(___lldiv@quotient),w
	movwf	(?___lldiv)

	goto	l1583
	
l2742:	
	line	26
	
l1583:	
	return
	opt stack 0
GLOBAL	__end_of___lldiv
	__end_of___lldiv:
;; =============== function ___lldiv ends ============

	signat	___lldiv,8316
	global	___lmul
psect	text217,local,class=CODE,delta=2
global __ptext217
__ptext217:

;; *************** function ___lmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      4    0[COMMON] unsigned long 
;;  multiplicand    4    4[COMMON] unsigned long 
;; Auto vars:     Size  Location     Type
;;  product         4    9[COMMON] unsigned long 
;; Return value:  Size  Location     Type
;;                  4    0[COMMON] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         8       0       0       0       0
;;      Locals:         4       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:        13       0       0       0       0
;;Total ram usage:       13 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_I2C_Initialize
;; This function uses a non-reentrant model
;;
psect	text217
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lmul.c"
	line	3
	global	__size_of___lmul
	__size_of___lmul	equ	__end_of___lmul-___lmul
	
___lmul:	
	opt	stack 6
; Regs used in ___lmul: [wreg+status,2+status,0]
	line	4
	
l2096:	
	movlw	0
	movwf	(___lmul@product+3)
	movlw	0
	movwf	(___lmul@product+2)
	movlw	0
	movwf	(___lmul@product+1)
	movlw	0
	movwf	(___lmul@product)

	goto	l2098
	line	6
	
l1479:	
	line	7
	
l2098:	
	btfss	(___lmul@multiplier),(0)&7
	goto	u741
	goto	u740
u741:
	goto	l2102
u740:
	line	8
	
l2100:	
	movf	(___lmul@multiplicand),w
	addwf	(___lmul@product),f
	movf	(___lmul@multiplicand+1),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u751
	addwf	(___lmul@product+1),f
u751:
	movf	(___lmul@multiplicand+2),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u752
	addwf	(___lmul@product+2),f
u752:
	movf	(___lmul@multiplicand+3),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u753
	addwf	(___lmul@product+3),f
u753:

	goto	l2102
	
l1480:	
	line	9
	
l2102:	
	movlw	01h
	movwf	(??___lmul+0)+0
u765:
	clrc
	rlf	(___lmul@multiplicand),f
	rlf	(___lmul@multiplicand+1),f
	rlf	(___lmul@multiplicand+2),f
	rlf	(___lmul@multiplicand+3),f
	decfsz	(??___lmul+0)+0
	goto	u765
	line	10
	
l2104:	
	movlw	01h
u775:
	clrc
	rrf	(___lmul@multiplier+3),f
	rrf	(___lmul@multiplier+2),f
	rrf	(___lmul@multiplier+1),f
	rrf	(___lmul@multiplier),f
	addlw	-1
	skipz
	goto	u775

	line	11
	movf	(___lmul@multiplier+3),w
	iorwf	(___lmul@multiplier+2),w
	iorwf	(___lmul@multiplier+1),w
	iorwf	(___lmul@multiplier),w
	skipz
	goto	u781
	goto	u780
u781:
	goto	l2098
u780:
	goto	l2106
	
l1481:	
	line	12
	
l2106:	
	movf	(___lmul@product+3),w
	movwf	(?___lmul+3)
	movf	(___lmul@product+2),w
	movwf	(?___lmul+2)
	movf	(___lmul@product+1),w
	movwf	(?___lmul+1)
	movf	(___lmul@product),w
	movwf	(?___lmul)

	goto	l1482
	
l2108:	
	line	13
	
l1482:	
	return
	opt stack 0
GLOBAL	__end_of___lmul
	__end_of___lmul:
;; =============== function ___lmul ends ============

	signat	___lmul,8316
	global	_I2C_Hold
psect	text218,local,class=CODE,delta=2
global __ptext218
__ptext218:

;; *************** function _I2C_Hold *****************
;; Defined at:
;;		line 64 in file "C:\Users\ELCOT\Desktop\pic16f877a I2C\I2C M.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_I2C_Write
;;		_I2C_Begin
;;		_I2C_End
;;		_I2C_Read
;; This function uses a non-reentrant model
;;
psect	text218
	file	"C:\Users\ELCOT\Desktop\pic16f877a I2C\I2C M.c"
	line	64
	global	__size_of_I2C_Hold
	__size_of_I2C_Hold	equ	__end_of_I2C_Hold-_I2C_Hold
	
_I2C_Hold:	
	opt	stack 6
; Regs used in _I2C_Hold: [wreg+status,2]
	line	65
	
l1808:	
;I2C M.c: 65: while ( (SSPCON2 & 0b00011111) || (SSPSTAT & 0b00000100) ) ;
	goto	l1810
	
l716:	
	goto	l1810
	
l715:	
	
l1810:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(145)^080h,w
	andlw	01Fh
	btfss	status,2
	goto	u31
	goto	u30
u31:
	goto	l1810
u30:
	
l1812:	
	btfsc	(148)^080h,(2)&7
	goto	u41
	goto	u40
u41:
	goto	l1810
u40:
	goto	l718
	
l717:	
	line	66
	
l718:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Hold
	__end_of_I2C_Hold:
;; =============== function _I2C_Hold ends ============

	signat	_I2C_Hold,88
psect	text219,local,class=CODE,delta=2
global __ptext219
__ptext219:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
