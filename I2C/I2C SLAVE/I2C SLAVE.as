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
	FNCALL	_main,_I2C_Slave_Init
	FNROOT	_main
	FNCALL	intlevel1,_I2C_Slave_Read
	global	intlevel1
	FNROOT	intlevel1
	global	_z
	global	_PORTB
psect	text88,local,class=CODE,delta=2
global __ptext88
__ptext88:
_PORTB	set	6
	global	_PORTD
_PORTD	set	8
	global	_SSPBUF
_SSPBUF	set	19
	global	_SSPCON
_SSPCON	set	20
	global	_SSPCONbits
_SSPCONbits	set	20
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_PEIE
_PEIE	set	94
	global	_SSPIF
_SSPIF	set	99
	global	_SSPADD
_SSPADD	set	147
	global	_SSPCON2
_SSPCON2	set	145
	global	_SSPSTAT
_SSPSTAT	set	148
	global	_SSPSTATbits
_SSPSTATbits	set	148
	global	_TRISB
_TRISB	set	134
	global	_TRISD
_TRISD	set	136
	global	_BF
_BF	set	1184
	global	_SSPIE
_SSPIE	set	1123
	global	_TRISC3
_TRISC3	set	1083
	global	_TRISC4
_TRISC4	set	1084
	global	_nRBPU
_nRBPU	set	1039
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
	file	"I2C SLAVE.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_z:
       ds      2

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_I2C_Slave_Read
?_I2C_Slave_Read:	; 0 bytes @ 0x0
	global	??_I2C_Slave_Read
??_I2C_Slave_Read:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
	ds	6
	global	?_I2C_Slave_Init
?_I2C_Slave_Init:	; 0 bytes @ 0x6
	global	I2C_Slave_Init@address
I2C_Slave_Init@address:	; 2 bytes @ 0x6
	ds	2
	global	??_I2C_Slave_Init
??_I2C_Slave_Init:	; 0 bytes @ 0x8
	global	??_main
??_main:	; 0 bytes @ 0x8
;;Data sizes: Strings 0, constant 0, data 0, bss 2, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      8      10
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_I2C_Slave_Init
;;
;; Critical Paths under _I2C_Slave_Read in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _I2C_Slave_Read in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _I2C_Slave_Read in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _I2C_Slave_Read in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _I2C_Slave_Read in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0      15
;;                     _I2C_Slave_Init
;; ---------------------------------------------------------------------------------
;; (1) _I2C_Slave_Init                                       2     0      2      15
;;                                              6 COMMON     2     0      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (2) _I2C_Slave_Read                                       6     6      0       0
;;                                              0 COMMON     6     6      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _I2C_Slave_Init
;;
;; _I2C_Slave_Read (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      8       A       1       71.4%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       1       2        0.0%
;;ABS                  0      0       A       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0       B      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 6 in file "C:\Users\ELCOT\Desktop\pic16f877a I2C\I2C SLAVE\I2C SLAVE.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  688[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_I2C_Slave_Init
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\ELCOT\Desktop\pic16f877a I2C\I2C SLAVE\I2C SLAVE.c"
	line	6
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	7
	
l2662:	
;I2C SLAVE.c: 7: nRBPU = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1039/8)^080h,(1039)&7
	line	8
	
l2664:	
;I2C SLAVE.c: 8: TRISB = 0xFF;
	movlw	(0FFh)
	movwf	(134)^080h	;volatile
	line	9
	
l2666:	
;I2C SLAVE.c: 9: TRISD = 0x00;
	clrf	(136)^080h	;volatile
	line	10
	
l2668:	
;I2C SLAVE.c: 10: PORTD = 0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	11
	
l2670:	
;I2C SLAVE.c: 11: I2C_Slave_Init(0xD0);
	movlw	low(0D0h)
	movwf	(?_I2C_Slave_Init)
	movlw	high(0D0h)
	movwf	((?_I2C_Slave_Init))+1
	fcall	_I2C_Slave_Init
	goto	l690
	line	12
;I2C SLAVE.c: 12: while(1)
	
l689:	
	line	14
;I2C SLAVE.c: 13: {
	
l690:	
	line	12
	goto	l690
	
l691:	
	line	15
	
l692:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_I2C_Slave_Init
psect	text89,local,class=CODE,delta=2
global __ptext89
__ptext89:

;; *************** function _I2C_Slave_Init *****************
;; Defined at:
;;		line 17 in file "C:\Users\ELCOT\Desktop\pic16f877a I2C\I2C SLAVE\I2C SLAVE.c"
;; Parameters:    Size  Location     Type
;;  address         2    6[COMMON] short 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
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
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text89
	file	"C:\Users\ELCOT\Desktop\pic16f877a I2C\I2C SLAVE\I2C SLAVE.c"
	line	17
	global	__size_of_I2C_Slave_Init
	__size_of_I2C_Slave_Init	equ	__end_of_I2C_Slave_Init-_I2C_Slave_Init
	
_I2C_Slave_Init:	
	opt	stack 6
; Regs used in _I2C_Slave_Init: [wreg]
	line	18
	
l1758:	
;I2C SLAVE.c: 18: SSPSTAT = 0x80;
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(148)^080h	;volatile
	line	19
;I2C SLAVE.c: 19: SSPADD = address;
	movf	(I2C_Slave_Init@address),w
	movwf	(147)^080h	;volatile
	line	20
;I2C SLAVE.c: 20: SSPCON = 0x36;
	movlw	(036h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	21
;I2C SLAVE.c: 21: SSPCON2 = 0x01;
	movlw	(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(145)^080h	;volatile
	line	22
	
l1760:	
;I2C SLAVE.c: 22: TRISC3 = 1;
	bsf	(1083/8)^080h,(1083)&7
	line	23
	
l1762:	
;I2C SLAVE.c: 23: TRISC4 = 1;
	bsf	(1084/8)^080h,(1084)&7
	line	24
	
l1764:	
;I2C SLAVE.c: 24: GIE = 1;
	bsf	(95/8),(95)&7
	line	25
	
l1766:	
;I2C SLAVE.c: 25: PEIE = 1;
	bsf	(94/8),(94)&7
	line	26
	
l1768:	
;I2C SLAVE.c: 26: SSPIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(99/8),(99)&7
	line	27
	
l1770:	
;I2C SLAVE.c: 27: SSPIE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1123/8)^080h,(1123)&7
	line	28
	
l695:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Slave_Init
	__end_of_I2C_Slave_Init:
;; =============== function _I2C_Slave_Init ends ============

	signat	_I2C_Slave_Init,4216
	global	_I2C_Slave_Read
psect	text90,local,class=CODE,delta=2
global __ptext90
__ptext90:

;; *************** function _I2C_Slave_Read *****************
;; Defined at:
;;		line 30 in file "C:\Users\ELCOT\Desktop\pic16f877a I2C\I2C SLAVE\I2C SLAVE.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          6       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text90
	file	"C:\Users\ELCOT\Desktop\pic16f877a I2C\I2C SLAVE\I2C SLAVE.c"
	line	30
	global	__size_of_I2C_Slave_Read
	__size_of_I2C_Slave_Read	equ	__end_of_I2C_Slave_Read-_I2C_Slave_Read
	
_I2C_Slave_Read:	
	opt	stack 6
; Regs used in _I2C_Slave_Read: [wreg]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_I2C_Slave_Read+2)
	movf	fsr0,w
	movwf	(??_I2C_Slave_Read+3)
	movf	pclath,w
	movwf	(??_I2C_Slave_Read+4)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_I2C_Slave_Read+5)
	ljmp	_I2C_Slave_Read
psect	text90
	line	31
	
i1l1772:	
;I2C SLAVE.c: 31: if(SSPIF == 1)
	btfss	(99/8),(99)&7
	goto	u1_21
	goto	u1_20
u1_21:
	goto	i1l711
u1_20:
	line	33
	
i1l1774:	
;I2C SLAVE.c: 32: {
;I2C SLAVE.c: 33: SSPCONbits.CKP = 0;
	bcf	(20),4	;volatile
	line	35
;I2C SLAVE.c: 35: if ((SSPCONbits.SSPOV) || (SSPCONbits.WCOL))
	btfsc	(20),6	;volatile
	goto	u2_21
	goto	u2_20
u2_21:
	goto	i1l1778
u2_20:
	
i1l1776:	
	btfss	(20),7	;volatile
	goto	u3_21
	goto	u3_20
u3_21:
	goto	i1l1786
u3_20:
	goto	i1l1778
	
i1l701:	
	line	37
	
i1l1778:	
;I2C SLAVE.c: 36: {
;I2C SLAVE.c: 37: z = SSPBUF;
	movf	(19),w	;volatile
	movwf	(??_I2C_Slave_Read+0)+0
	clrf	(??_I2C_Slave_Read+0)+0+1
	movf	0+(??_I2C_Slave_Read+0)+0,w
	movwf	(_z)
	movf	1+(??_I2C_Slave_Read+0)+0,w
	movwf	(_z+1)
	line	38
	
i1l1780:	
;I2C SLAVE.c: 38: SSPCONbits.SSPOV = 0;
	bcf	(20),6	;volatile
	line	39
	
i1l1782:	
;I2C SLAVE.c: 39: SSPCONbits.WCOL = 0;
	bcf	(20),7	;volatile
	line	40
	
i1l1784:	
;I2C SLAVE.c: 40: SSPCONbits.CKP = 1;
	bsf	(20),4	;volatile
	goto	i1l1786
	line	41
	
i1l699:	
	line	43
	
i1l1786:	
;I2C SLAVE.c: 41: }
;I2C SLAVE.c: 43: if(!SSPSTATbits.D_nA && !SSPSTATbits.R_nW)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfsc	(148)^080h,5	;volatile
	goto	u4_21
	goto	u4_20
u4_21:
	goto	i1l702
u4_20:
	
i1l1788:	
	btfsc	(148)^080h,2	;volatile
	goto	u5_21
	goto	u5_20
u5_21:
	goto	i1l702
u5_20:
	line	45
	
i1l1790:	
;I2C SLAVE.c: 44: {
;I2C SLAVE.c: 45: z = SSPBUF;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(19),w	;volatile
	movwf	(??_I2C_Slave_Read+0)+0
	clrf	(??_I2C_Slave_Read+0)+0+1
	movf	0+(??_I2C_Slave_Read+0)+0,w
	movwf	(_z)
	movf	1+(??_I2C_Slave_Read+0)+0,w
	movwf	(_z+1)
	line	46
;I2C SLAVE.c: 46: while(!BF);
	goto	i1l703
	
i1l704:	
	
i1l703:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1184/8)^080h,(1184)&7
	goto	u6_21
	goto	u6_20
u6_21:
	goto	i1l703
u6_20:
	goto	i1l1792
	
i1l705:	
	line	47
	
i1l1792:	
;I2C SLAVE.c: 47: PORTD = SSPBUF;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(19),w	;volatile
	movwf	(8)	;volatile
	line	48
	
i1l1794:	
;I2C SLAVE.c: 48: SSPCONbits.CKP = 1;
	bsf	(20),4	;volatile
	line	49
;I2C SLAVE.c: 49: }
	goto	i1l706
	line	50
	
i1l702:	
;I2C SLAVE.c: 50: else if(!SSPSTATbits.D_nA && SSPSTATbits.R_nW)
	btfsc	(148)^080h,5	;volatile
	goto	u7_21
	goto	u7_20
u7_21:
	goto	i1l706
u7_20:
	
i1l1796:	
	btfss	(148)^080h,2	;volatile
	goto	u8_21
	goto	u8_20
u8_21:
	goto	i1l706
u8_20:
	line	52
	
i1l1798:	
;I2C SLAVE.c: 51: {
;I2C SLAVE.c: 52: z = SSPBUF;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(19),w	;volatile
	movwf	(??_I2C_Slave_Read+0)+0
	clrf	(??_I2C_Slave_Read+0)+0+1
	movf	0+(??_I2C_Slave_Read+0)+0,w
	movwf	(_z)
	movf	1+(??_I2C_Slave_Read+0)+0,w
	movwf	(_z+1)
	line	53
	
i1l1800:	
;I2C SLAVE.c: 53: BF = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1184/8)^080h,(1184)&7
	line	54
;I2C SLAVE.c: 54: SSPBUF = PORTB ;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(6),w	;volatile
	movwf	(19)	;volatile
	line	55
	
i1l1802:	
;I2C SLAVE.c: 55: SSPCONbits.CKP = 1;
	bsf	(20),4	;volatile
	line	56
;I2C SLAVE.c: 56: while(SSPSTATbits.BF);
	goto	i1l708
	
i1l709:	
	
i1l708:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfsc	(148)^080h,0	;volatile
	goto	u9_21
	goto	u9_20
u9_21:
	goto	i1l708
u9_20:
	goto	i1l706
	
i1l710:	
	goto	i1l706
	line	57
	
i1l707:	
	line	58
	
i1l706:	
;I2C SLAVE.c: 57: }
;I2C SLAVE.c: 58: SSPIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(99/8),(99)&7
	goto	i1l711
	line	59
	
i1l698:	
	line	60
	
i1l711:	
	movf	(??_I2C_Slave_Read+5),w
	movwf	btemp+1
	movf	(??_I2C_Slave_Read+4),w
	movwf	pclath
	movf	(??_I2C_Slave_Read+3),w
	movwf	fsr0
	swapf	(??_I2C_Slave_Read+2)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_I2C_Slave_Read
	__end_of_I2C_Slave_Read:
;; =============== function _I2C_Slave_Read ends ============

	signat	_I2C_Slave_Read,88
psect	text91,local,class=CODE,delta=2
global __ptext91
__ptext91:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
