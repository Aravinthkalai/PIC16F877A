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
	FNCALL	_main,_delay
	FNROOT	_main
	global	_CCP1CON
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:
_CCP1CON	set	23
	global	_CCPR1L
_CCPR1L	set	21
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_TMR2ON
_TMR2ON	set	146
	global	_PR2
_PR2	set	146
	global	_TRISC
_TRISC	set	135
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
	file	"pwm.as"
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
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
	global	delay@cnt
delay@cnt:	; 2 bytes @ 0x0
	ds	2
	global	??_delay
??_delay:	; 0 bytes @ 0x2
	global	??_main
??_main:	; 0 bytes @ 0x2
	ds	1
	global	main@dutyCycle
main@dutyCycle:	; 1 bytes @ 0x3
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      4       4
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_delay
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
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
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 2     2      0     105
;;                                              2 COMMON     2     2      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (1) _delay                                                2     0      2      15
;;                                              0 COMMON     2     0      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _delay
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      4       4       1       28.6%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       1       2        0.0%
;;ABS                  0      0       0       3        0.0%
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
;;DATA                 0      0       0      12        0.0%

	global	_main
psect	maintext

;; *************** function _main *****************
;; Defined at:
;;		line 7 in file "F:\Basic Microcontroller\PIC16F877A\PWM\pwm.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  dutyCycle       1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2  690[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_delay
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"F:\Basic Microcontroller\PIC16F877A\PWM\pwm.c"
	line	7
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	8
	
l2607:	
;pwm.c: 8: char dutyCycle = 0;
	clrf	(main@dutyCycle)
	line	10
	
l2609:	
;pwm.c: 10: TRISC = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(135)^080h	;volatile
	line	12
	
l2611:	
;pwm.c: 12: CCP1CON = 0x0F;
	movlw	(0Fh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(23)	;volatile
	line	13
	
l2613:	
;pwm.c: 13: PR2 = 100;
	movlw	(064h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	14
	
l2615:	
;pwm.c: 14: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	15
	
l2617:	
;pwm.c: 15: TMR2ON = 1;
	bsf	(146/8),(146)&7
	goto	l2619
	line	18
;pwm.c: 18: while (1) {
	
l691:	
	line	19
	
l2619:	
;pwm.c: 19: for (dutyCycle = 0; dutyCycle < 100; dutyCycle++)
	clrf	(main@dutyCycle)
	
l2621:	
	movlw	(064h)
	subwf	(main@dutyCycle),w
	skipc
	goto	u2231
	goto	u2230
u2231:
	goto	l2625
u2230:
	goto	l2633
	
l2623:	
	goto	l2633
	line	20
	
l692:	
	line	21
	
l2625:	
;pwm.c: 20: {
;pwm.c: 21: CCPR1L = dutyCycle;
	movf	(main@dutyCycle),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	22
	
l2627:	
;pwm.c: 22: delay(1000);
	movlw	low(03E8h)
	movwf	(?_delay)
	movlw	high(03E8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	19
	
l2629:	
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	addwf	(main@dutyCycle),f
	
l2631:	
	movlw	(064h)
	subwf	(main@dutyCycle),w
	skipc
	goto	u2241
	goto	u2240
u2241:
	goto	l2625
u2240:
	goto	l2633
	
l693:	
	line	25
	
l2633:	
;pwm.c: 23: }
;pwm.c: 25: for (dutyCycle = 100; dutyCycle > 0; dutyCycle--)
	movlw	(064h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@dutyCycle)
	
l2635:	
	movf	(main@dutyCycle),f
	skipz
	goto	u2251
	goto	u2250
u2251:
	goto	l2639
u2250:
	goto	l2619
	
l2637:	
	goto	l2619
	line	26
	
l694:	
	line	27
	
l2639:	
;pwm.c: 26: {
;pwm.c: 27: CCPR1L = dutyCycle;
	movf	(main@dutyCycle),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	28
	
l2641:	
;pwm.c: 28: delay(1000);
	movlw	low(03E8h)
	movwf	(?_delay)
	movlw	high(03E8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	25
	
l2643:	
	movlw	low(01h)
	subwf	(main@dutyCycle),f
	
l2645:	
	movf	(main@dutyCycle),f
	skipz
	goto	u2261
	goto	u2260
u2261:
	goto	l2639
u2260:
	goto	l2619
	
l695:	
	goto	l2619
	line	30
	
l696:	
	line	18
	goto	l2619
	
l697:	
	line	31
	
l698:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_delay
psect	text71,local,class=CODE,delta=2
global __ptext71
__ptext71:

;; *************** function _delay *****************
;; Defined at:
;;		line 3 in file "F:\Basic Microcontroller\PIC16F877A\PWM\pwm.c"
;; Parameters:    Size  Location     Type
;;  cnt             2    0[COMMON] int 
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
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text71
	file	"F:\Basic Microcontroller\PIC16F877A\PWM\pwm.c"
	line	3
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 7
; Regs used in _delay: [wreg]
	line	4
	
l1745:	
;pwm.c: 4: while (cnt--);
	goto	l1747
	
l686:	
	goto	l1747
	
l685:	
	
l1747:	
	movlw	low(-1)
	addwf	(delay@cnt),f
	skipnc
	incf	(delay@cnt+1),f
	movlw	high(-1)
	addwf	(delay@cnt+1),f
	movlw	high(-1)
	xorwf	((delay@cnt+1)),w
	skipz
	goto	u15
	movlw	low(-1)
	xorwf	((delay@cnt)),w
u15:

	skipz
	goto	u11
	goto	u10
u11:
	goto	l1747
u10:
	goto	l688
	
l687:	
	line	5
	
l688:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
psect	text72,local,class=CODE,delta=2
global __ptext72
__ptext72:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
