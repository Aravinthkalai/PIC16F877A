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
	FNCALL	_main,_lcd_int
	FNCALL	_main,_show
	FNCALL	_main,_cmd
	FNCALL	_main,_adc
	FNCALL	_adc,___lwdiv
	FNCALL	_adc,_dat
	FNCALL	_adc,___lwmod
	FNCALL	_show,_dat
	FNCALL	_lcd_int,_cmd
	FNCALL	_dat,_delay
	FNCALL	_cmd,_delay
	FNROOT	_main
	global	_ADCON0
psect	text206,local,class=CODE,delta=2
global __ptext206
__ptext206:
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_PORTD
_PORTD	set	8
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_GO_nDONE
_GO_nDONE	set	250
	global	_RC4
_RC4	set	60
	global	_RC5
_RC5	set	61
	global	_RC6
_RC6	set	62
	global	_ADCON1
_ADCON1	set	159
	global	_ADRESL
_ADRESL	set	158
	global	_TRISC
_TRISC	set	135
	global	_TRISD
_TRISD	set	136
	global	_TRISA0
_TRISA0	set	1064
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
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	
STR_1:	
	retlw	65	;'A'
	retlw	68	;'D'
	retlw	67	;'C'
	retlw	32	;' '
	retlw	86	;'V'
	retlw	97	;'a'
	retlw	108	;'l'
	retlw	117	;'u'
	retlw	101	;'e'
	retlw	32	;' '
	retlw	58	;':'
	retlw	0
psect	strings
	file	"ADC.as"
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
	global	?_lcd_int
?_lcd_int:	; 0 bytes @ 0x0
	global	?_show
?_show:	; 0 bytes @ 0x0
	global	?_cmd
?_cmd:	; 0 bytes @ 0x0
	global	?_adc
?_adc:	; 0 bytes @ 0x0
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_dat
?_dat:	; 0 bytes @ 0x0
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x0
	global	delay@L
delay@L:	; 2 bytes @ 0x0
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x0
	ds	2
	global	??_delay
??_delay:	; 0 bytes @ 0x2
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x2
	ds	1
	global	delay@i
delay@i:	; 2 bytes @ 0x3
	ds	1
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0x4
	ds	1
	global	delay@j
delay@j:	; 2 bytes @ 0x5
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x5
	ds	2
	global	??_cmd
??_cmd:	; 0 bytes @ 0x7
	global	??_dat
??_dat:	; 0 bytes @ 0x7
	global	cmd@a
cmd@a:	; 1 bytes @ 0x7
	global	dat@b
dat@b:	; 1 bytes @ 0x7
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x7
	ds	1
	global	??_lcd_int
??_lcd_int:	; 0 bytes @ 0x8
	global	??_show
??_show:	; 0 bytes @ 0x8
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x8
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x8
	ds	1
	global	show@s
show@s:	; 1 bytes @ 0x9
	ds	1
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0xA
	ds	2
	global	??___lwmod
??___lwmod:	; 0 bytes @ 0xC
	ds	1
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0xD
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0xE
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_adc
??_adc:	; 0 bytes @ 0x0
	ds	2
	global	adc@adcval
adc@adcval:	; 2 bytes @ 0x2
	ds	2
;;Data sizes: Strings 12, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80      4       4
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___lwmod	unsigned int  size(1) Largest target is 0
;;
;; ?___lwdiv	unsigned int  size(1) Largest target is 0
;;
;; show@s	PTR unsigned char  size(1) Largest target is 12
;;		 -> STR_1(CODE[12]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _adc->___lwmod
;;   _show->_dat
;;   _lcd_int->_cmd
;;   _dat->_delay
;;   _cmd->_delay
;;   ___lwmod->___lwdiv
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_adc
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
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0     911
;;                            _lcd_int
;;                               _show
;;                                _cmd
;;                                _adc
;; ---------------------------------------------------------------------------------
;; (1) _adc                                                  4     4      0     524
;;                                              0 BANK0      4     4      0
;;                            ___lwdiv
;;                                _dat
;;                            ___lwmod
;; ---------------------------------------------------------------------------------
;; (1) _show                                                 2     2      0     159
;;                                              8 COMMON     2     2      0
;;                                _dat
;; ---------------------------------------------------------------------------------
;; (1) _lcd_int                                              0     0      0     114
;;                                _cmd
;; ---------------------------------------------------------------------------------
;; (2) _dat                                                  1     1      0     114
;;                                              7 COMMON     1     1      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (1) _cmd                                                  1     1      0     114
;;                                              7 COMMON     1     1      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (2) ___lwmod                                              6     2      4     159
;;                                              8 COMMON     6     2      4
;;                            ___lwdiv (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___lwdiv                                              8     4      4     162
;;                                              0 COMMON     8     4      4
;; ---------------------------------------------------------------------------------
;; (3) _delay                                                7     5      2      92
;;                                              0 COMMON     7     5      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _lcd_int
;;     _cmd
;;       _delay
;;   _show
;;     _dat
;;       _delay
;;   _cmd
;;     _delay
;;   _adc
;;     ___lwdiv
;;     _dat
;;       _delay
;;     ___lwmod
;;       ___lwdiv (ARG)
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
;;STACK                0      0       3       2        0.0%
;;ABS                  0      0       0       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      4       4       5        5.0%
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
;;		line 12 in file "F:\Avinashi lingam\PIC\ADC\ADC.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_int
;;		_show
;;		_cmd
;;		_adc
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"F:\Avinashi lingam\PIC\ADC\ADC.c"
	line	12
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	13
	
l2916:	
;ADC.c: 13: TRISD=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	14
;ADC.c: 14: TRISC=0;
	clrf	(135)^080h	;volatile
	line	15
	
l2918:	
;ADC.c: 15: TRISA0=1;
	bsf	(1064/8)^080h,(1064)&7
	line	16
	
l2920:	
;ADC.c: 16: lcd_int();
	fcall	_lcd_int
	line	17
	
l2922:	
;ADC.c: 17: show("ADC Value :");
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_show
	goto	l2924
	line	18
;ADC.c: 18: while(1)
	
l695:	
	line	20
	
l2924:	
;ADC.c: 19: {
;ADC.c: 20: cmd(0xC0);
	movlw	(0C0h)
	fcall	_cmd
	line	21
	
l2926:	
;ADC.c: 21: adc();
	fcall	_adc
	goto	l2924
	line	22
	
l696:	
	line	18
	goto	l2924
	
l697:	
	line	23
	
l698:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_adc
psect	text207,local,class=CODE,delta=2
global __ptext207
__ptext207:

;; *************** function _adc *****************
;; Defined at:
;;		line 60 in file "F:\Avinashi lingam\PIC\ADC\ADC.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  adcval          2    2[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___lwdiv
;;		_dat
;;		___lwmod
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text207
	file	"F:\Avinashi lingam\PIC\ADC\ADC.c"
	line	60
	global	__size_of_adc
	__size_of_adc	equ	__end_of_adc-_adc
	
_adc:	
	opt	stack 5
; Regs used in _adc: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	62
	
l2904:	
;ADC.c: 61: unsigned int adcval;
;ADC.c: 62: ADCON1=0x80;
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	63
;ADC.c: 63: ADCON0=0x45;
	movlw	(045h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	64
;ADC.c: 64: while(GO_nDONE==1);
	goto	l716
	
l717:	
	
l716:	
	btfsc	(250/8),(250)&7
	goto	u2441
	goto	u2440
u2441:
	goto	l716
u2440:
	goto	l2906
	
l718:	
	line	65
	
l2906:	
;ADC.c: 65: adcval=((ADRESH<<8)+(ADRESL));
	movf	(30),w	;volatile
	movwf	(??_adc+0)+0
	clrf	(??_adc+0)+0+1
	movf	(??_adc+0)+0,w
	movwf	(??_adc+0)+1
	clrf	(??_adc+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	0+(??_adc+0)+0,w
	movwf	(adc@adcval)
	movlw	0
	skipnc
	movlw	1
	addwf	1+(??_adc+0)+0,w
	movwf	1+(adc@adcval)
	line	66
	
l2908:	
;ADC.c: 66: dat((adcval/1000)+48);
	movlw	low(03E8h)
	movwf	(?___lwdiv)
	movlw	high(03E8h)
	movwf	((?___lwdiv))+1
	movf	(adc@adcval+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(adc@adcval),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(0+(?___lwdiv)),w
	addlw	030h
	fcall	_dat
	line	67
	
l2910:	
;ADC.c: 67: dat(((adcval/100)%10)+48);
	movlw	low(0Ah)
	movwf	(?___lwmod)
	movlw	high(0Ah)
	movwf	((?___lwmod))+1
	movlw	low(064h)
	movwf	(?___lwdiv)
	movlw	high(064h)
	movwf	((?___lwdiv))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(adc@adcval+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(adc@adcval),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(0+(?___lwdiv)),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	030h
	fcall	_dat
	line	68
	
l2912:	
;ADC.c: 68: dat(((adcval/10)%10)+48);
	movlw	low(0Ah)
	movwf	(?___lwmod)
	movlw	high(0Ah)
	movwf	((?___lwmod))+1
	movlw	low(0Ah)
	movwf	(?___lwdiv)
	movlw	high(0Ah)
	movwf	((?___lwdiv))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(adc@adcval+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(adc@adcval),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(0+(?___lwdiv)),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	030h
	fcall	_dat
	line	69
	
l2914:	
;ADC.c: 69: dat((adcval%10)+48);
	movlw	low(0Ah)
	movwf	(?___lwmod)
	movlw	high(0Ah)
	movwf	((?___lwmod))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(adc@adcval+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(adc@adcval),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	030h
	fcall	_dat
	line	70
	
l719:	
	return
	opt stack 0
GLOBAL	__end_of_adc
	__end_of_adc:
;; =============== function _adc ends ============

	signat	_adc,88
	global	_show
psect	text208,local,class=CODE,delta=2
global __ptext208
__ptext208:

;; *************** function _show *****************
;; Defined at:
;;		line 53 in file "F:\Avinashi lingam\PIC\ADC\ADC.c"
;; Parameters:    Size  Location     Type
;;  s               1    wreg     PTR unsigned char 
;;		 -> STR_1(12), 
;; Auto vars:     Size  Location     Type
;;  s               1    9[COMMON] PTR unsigned char 
;;		 -> STR_1(12), 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_dat
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text208
	file	"F:\Avinashi lingam\PIC\ADC\ADC.c"
	line	53
	global	__size_of_show
	__size_of_show	equ	__end_of_show-_show
	
_show:	
	opt	stack 5
; Regs used in _show: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
;show@s stored from wreg
	movwf	(show@s)
	line	54
	
l2896:	
;ADC.c: 54: while(*s) {
	goto	l2902
	
l711:	
	line	55
	
l2898:	
;ADC.c: 55: dat(*s++);
	movf	(show@s),w
	movwf	fsr0
	fcall	stringdir
	fcall	_dat
	
l2900:	
	movlw	(01h)
	movwf	(??_show+0)+0
	movf	(??_show+0)+0,w
	addwf	(show@s),f
	goto	l2902
	line	56
	
l710:	
	line	54
	
l2902:	
	movf	(show@s),w
	movwf	fsr0
	fcall	stringdir
	iorlw	0
	skipz
	goto	u2431
	goto	u2430
u2431:
	goto	l2898
u2430:
	goto	l713
	
l712:	
	line	57
	
l713:	
	return
	opt stack 0
GLOBAL	__end_of_show
	__end_of_show:
;; =============== function _show ends ============

	signat	_show,4216
	global	_lcd_int
psect	text209,local,class=CODE,delta=2
global __ptext209
__ptext209:

;; *************** function _lcd_int *****************
;; Defined at:
;;		line 25 in file "F:\Avinashi lingam\PIC\ADC\ADC.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_cmd
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text209
	file	"F:\Avinashi lingam\PIC\ADC\ADC.c"
	line	25
	global	__size_of_lcd_int
	__size_of_lcd_int	equ	__end_of_lcd_int-_lcd_int
	
_lcd_int:	
	opt	stack 5
; Regs used in _lcd_int: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	26
	
l2894:	
;ADC.c: 26: cmd(0x38);
	movlw	(038h)
	fcall	_cmd
	line	27
;ADC.c: 27: cmd(0x0c);
	movlw	(0Ch)
	fcall	_cmd
	line	28
;ADC.c: 28: cmd(0x06);
	movlw	(06h)
	fcall	_cmd
	line	29
;ADC.c: 29: cmd(0x80);
	movlw	(080h)
	fcall	_cmd
	line	30
	
l701:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_int
	__end_of_lcd_int:
;; =============== function _lcd_int ends ============

	signat	_lcd_int,88
	global	_dat
psect	text210,local,class=CODE,delta=2
global __ptext210
__ptext210:

;; *************** function _dat *****************
;; Defined at:
;;		line 43 in file "F:\Avinashi lingam\PIC\ADC\ADC.c"
;; Parameters:    Size  Location     Type
;;  b               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  b               1    7[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_delay
;; This function is called by:
;;		_show
;;		_adc
;; This function uses a non-reentrant model
;;
psect	text210
	file	"F:\Avinashi lingam\PIC\ADC\ADC.c"
	line	43
	global	__size_of_dat
	__size_of_dat	equ	__end_of_dat-_dat
	
_dat:	
	opt	stack 5
; Regs used in _dat: [wreg+status,2+status,0+btemp+1+pclath+cstack]
;dat@b stored from wreg
	movwf	(dat@b)
	line	44
	
l2882:	
;ADC.c: 44: PORTD=b;
	movf	(dat@b),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	45
	
l2884:	
;ADC.c: 45: RC4=1;
	bsf	(60/8),(60)&7
	line	46
	
l2886:	
;ADC.c: 46: RC5=0;
	bcf	(61/8),(61)&7
	line	47
	
l2888:	
;ADC.c: 47: RC6=1;
	bsf	(62/8),(62)&7
	line	48
	
l2890:	
;ADC.c: 48: delay(10);
	movlw	low(0Ah)
	movwf	(?_delay)
	movlw	high(0Ah)
	movwf	((?_delay))+1
	fcall	_delay
	line	49
	
l2892:	
;ADC.c: 49: RC6=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(62/8),(62)&7
	line	50
	
l707:	
	return
	opt stack 0
GLOBAL	__end_of_dat
	__end_of_dat:
;; =============== function _dat ends ============

	signat	_dat,4216
	global	_cmd
psect	text211,local,class=CODE,delta=2
global __ptext211
__ptext211:

;; *************** function _cmd *****************
;; Defined at:
;;		line 33 in file "F:\Avinashi lingam\PIC\ADC\ADC.c"
;; Parameters:    Size  Location     Type
;;  a               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  a               1    7[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_delay
;; This function is called by:
;;		_main
;;		_lcd_int
;; This function uses a non-reentrant model
;;
psect	text211
	file	"F:\Avinashi lingam\PIC\ADC\ADC.c"
	line	33
	global	__size_of_cmd
	__size_of_cmd	equ	__end_of_cmd-_cmd
	
_cmd:	
	opt	stack 6
; Regs used in _cmd: [wreg+status,2+status,0+btemp+1+pclath+cstack]
;cmd@a stored from wreg
	movwf	(cmd@a)
	line	34
	
l2870:	
;ADC.c: 34: PORTD=a;
	movf	(cmd@a),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	35
	
l2872:	
;ADC.c: 35: RC4=0;
	bcf	(60/8),(60)&7
	line	36
	
l2874:	
;ADC.c: 36: RC5=0;
	bcf	(61/8),(61)&7
	line	37
	
l2876:	
;ADC.c: 37: RC6=1;
	bsf	(62/8),(62)&7
	line	38
	
l2878:	
;ADC.c: 38: delay(10);
	movlw	low(0Ah)
	movwf	(?_delay)
	movlw	high(0Ah)
	movwf	((?_delay))+1
	fcall	_delay
	line	39
	
l2880:	
;ADC.c: 39: RC6=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(62/8),(62)&7
	line	40
	
l704:	
	return
	opt stack 0
GLOBAL	__end_of_cmd
	__end_of_cmd:
;; =============== function _cmd ends ============

	signat	_cmd,4216
	global	___lwmod
psect	text212,local,class=CODE,delta=2
global __ptext212
__ptext212:

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lwmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    8[COMMON] unsigned int 
;;  dividend        2   10[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1   13[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    8[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_adc
;; This function uses a non-reentrant model
;;
psect	text212
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 6
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
l2848:	
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u2371
	goto	u2370
u2371:
	goto	l2866
u2370:
	line	9
	
l2850:	
	clrf	(___lwmod@counter)
	bsf	status,0
	rlf	(___lwmod@counter),f
	line	10
	goto	l2856
	
l1428:	
	line	11
	
l2852:	
	movlw	01h
	
u2385:
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u2385
	line	12
	
l2854:	
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	goto	l2856
	line	13
	
l1427:	
	line	10
	
l2856:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u2391
	goto	u2390
u2391:
	goto	l2852
u2390:
	goto	l2858
	
l1429:	
	goto	l2858
	line	14
	
l1430:	
	line	15
	
l2858:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u2405
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u2405:
	skipc
	goto	u2401
	goto	u2400
u2401:
	goto	l2862
u2400:
	line	16
	
l2860:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	goto	l2862
	
l1431:	
	line	17
	
l2862:	
	movlw	01h
	
u2415:
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u2415
	line	18
	
l2864:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u2421
	goto	u2420
u2421:
	goto	l2858
u2420:
	goto	l2866
	
l1432:	
	goto	l2866
	line	19
	
l1426:	
	line	20
	
l2866:	
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	goto	l1433
	
l2868:	
	line	21
	
l1433:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___lwdiv
psect	text213,local,class=CODE,delta=2
global __ptext213
__ptext213:

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] unsigned int 
;;  dividend        2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    5[COMMON] unsigned int 
;;  counter         1    7[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_adc
;; This function uses a non-reentrant model
;;
psect	text213
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 6
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l2822:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
l2824:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u2301
	goto	u2300
u2301:
	goto	l2844
u2300:
	line	11
	
l2826:	
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	line	12
	goto	l2832
	
l1418:	
	line	13
	
l2828:	
	movlw	01h
	
u2315:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u2315
	line	14
	
l2830:	
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	goto	l2832
	line	15
	
l1417:	
	line	12
	
l2832:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u2321
	goto	u2320
u2321:
	goto	l2828
u2320:
	goto	l2834
	
l1419:	
	goto	l2834
	line	16
	
l1420:	
	line	17
	
l2834:	
	movlw	01h
	
u2335:
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u2335
	line	18
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u2345
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u2345:
	skipc
	goto	u2341
	goto	u2340
u2341:
	goto	l2840
u2340:
	line	19
	
l2836:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
l2838:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	goto	l2840
	line	21
	
l1421:	
	line	22
	
l2840:	
	movlw	01h
	
u2355:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u2355
	line	23
	
l2842:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u2361
	goto	u2360
u2361:
	goto	l2834
u2360:
	goto	l2844
	
l1422:	
	goto	l2844
	line	24
	
l1416:	
	line	25
	
l2844:	
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	goto	l1423
	
l2846:	
	line	26
	
l1423:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	_delay
psect	text214,local,class=CODE,delta=2
global __ptext214
__ptext214:

;; *************** function _delay *****************
;; Defined at:
;;		line 72 in file "F:\Avinashi lingam\PIC\ADC\ADC.c"
;; Parameters:    Size  Location     Type
;;  L               2    0[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  j               2    5[COMMON] int 
;;  i               2    3[COMMON] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, btemp+1
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         4       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         7       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_cmd
;;		_dat
;; This function uses a non-reentrant model
;;
psect	text214
	file	"F:\Avinashi lingam\PIC\ADC\ADC.c"
	line	72
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 5
; Regs used in _delay: [wreg+status,2+btemp+1]
	line	74
	
l2808:	
;ADC.c: 73: int i,j;
;ADC.c: 74: for(i=0;i<L;i++)
	clrf	(delay@i)
	clrf	(delay@i+1)
	goto	l722
	line	75
	
l723:	
	line	76
	
l2810:	
;ADC.c: 75: {
;ADC.c: 76: for(j=0;j<250;j++)
	clrf	(delay@j)
	clrf	(delay@j+1)
	
l2812:	
	movf	(delay@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0FAh))^80h
	subwf	btemp+1,w
	skipz
	goto	u2275
	movlw	low(0FAh)
	subwf	(delay@j),w
u2275:

	skipc
	goto	u2271
	goto	u2270
u2271:
	goto	l2816
u2270:
	goto	l2820
	
l2814:	
	goto	l2820
	line	77
	
l724:	
	line	76
	
l2816:	
;ADC.c: 77: {
	movlw	low(01h)
	addwf	(delay@j),f
	skipnc
	incf	(delay@j+1),f
	movlw	high(01h)
	addwf	(delay@j+1),f
	
l2818:	
	movf	(delay@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0FAh))^80h
	subwf	btemp+1,w
	skipz
	goto	u2285
	movlw	low(0FAh)
	subwf	(delay@j),w
u2285:

	skipc
	goto	u2281
	goto	u2280
u2281:
	goto	l2816
u2280:
	goto	l2820
	
l725:	
	line	74
	
l2820:	
	movlw	low(01h)
	addwf	(delay@i),f
	skipnc
	incf	(delay@i+1),f
	movlw	high(01h)
	addwf	(delay@i+1),f
	
l722:	
	movf	(delay@i+1),w
	xorlw	80h
	movwf	(??_delay+0)+0
	movf	(delay@L+1),w
	xorlw	80h
	subwf	(??_delay+0)+0,w
	skipz
	goto	u2295
	movf	(delay@L),w
	subwf	(delay@i),w
u2295:

	skipc
	goto	u2291
	goto	u2290
u2291:
	goto	l2810
u2290:
	goto	l727
	
l726:	
	line	80
	
l727:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
psect	text215,local,class=CODE,delta=2
global __ptext215
__ptext215:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
