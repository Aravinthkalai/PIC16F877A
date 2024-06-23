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
	FNROOT	_main
	global	_CCP1CON
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:
_CCP1CON	set	23
	global	_CCPR1L
_CCPR1L	set	21
	global	_T2CON
_T2CON	set	18
	global	_TMR2
_TMR2	set	17
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_TMR2IF
_TMR2IF	set	97
	global	_TMR2ON
_TMR2ON	set	146
	global	_PR2
_PR2	set	146
	global	_TRISC2
_TRISC2	set	1082
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
	file	"5khz pwm.as"
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
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	??_main
??_main:	; 0 bytes @ 0x0
	ds	3
	global	main@i
main@i:	; 2 bytes @ 0x3
	ds	2
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      5       5
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
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
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 5     5      0      45
;;                                              0 COMMON     5     5      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 0
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      5       5       1       35.7%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       0       2        0.0%
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
;;		line 4 in file "F:\Basic Microcontroller\PIC16F877A\ccp\5KHZ pwm\5KHZ pwm.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    3[COMMON] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, btemp+1
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"F:\Basic Microcontroller\PIC16F877A\ccp\5KHZ pwm\5KHZ pwm.c"
	line	4
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg+status,2+btemp+1]
	line	6
	
l2600:	
;5KHZ pwm.c: 5: int i;
;5KHZ pwm.c: 6: TRISC2=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1082/8)^080h,(1082)&7
	line	7
	
l2602:	
;5KHZ pwm.c: 7: CCP1CON=0b00001100;
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(23)	;volatile
	line	8
;5KHZ pwm.c: 8: T2CON=0b00000010;
	movlw	(02h)
	movwf	(18)	;volatile
	line	9
;5KHZ pwm.c: 9: PR2=61;
	movlw	(03Dh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	10
	
l2604:	
;5KHZ pwm.c: 10: for(i=0;i<58;i++)
	clrf	(main@i)
	clrf	(main@i+1)
	
l2606:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u2225
	movlw	low(03Ah)
	subwf	(main@i),w
u2225:

	skipc
	goto	u2221
	goto	u2220
u2221:
	goto	l2610
u2220:
	goto	l693
	
l2608:	
	goto	l693
	line	11
	
l687:	
	line	12
	
l2610:	
;5KHZ pwm.c: 11: {
;5KHZ pwm.c: 12: CCPR1L=i;
	movf	(main@i),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	13
	
l2612:	
;5KHZ pwm.c: 13: TMR2IF=0;
	bcf	(97/8),(97)&7
	line	14
	
l2614:	
;5KHZ pwm.c: 14: TMR2=0X00;
	clrf	(17)	;volatile
	line	15
	
l2616:	
;5KHZ pwm.c: 15: TMR2ON=1;
	bsf	(146/8),(146)&7
	line	16
;5KHZ pwm.c: 16: while(TMR2IF==0);
	goto	l689
	
l690:	
	
l689:	
	btfss	(97/8),(97)&7
	goto	u2231
	goto	u2230
u2231:
	goto	l689
u2230:
	goto	l2618
	
l691:	
	line	17
	
l2618:	
;5KHZ pwm.c: 17: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
movwf	((??_main+0)+0+2),f
movlw	138
movwf	((??_main+0)+0+1),f
	movlw	86
movwf	((??_main+0)+0),f
u2257:
	decfsz	((??_main+0)+0),f
	goto	u2257
	decfsz	((??_main+0)+0+1),f
	goto	u2257
	decfsz	((??_main+0)+0+2),f
	goto	u2257
	nop2
opt asmopt_on

	line	10
	movlw	low(01h)
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	
l2620:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u2245
	movlw	low(03Ah)
	subwf	(main@i),w
u2245:

	skipc
	goto	u2241
	goto	u2240
u2241:
	goto	l2610
u2240:
	goto	l693
	
l688:	
	goto	l693
	line	19
;5KHZ pwm.c: 18: }
;5KHZ pwm.c: 19: while(1)
	
l692:	
	line	22
;5KHZ pwm.c: 20: {
	
l693:	
	line	19
	goto	l693
	
l694:	
	line	23
	
l695:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
psect	maintext
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
