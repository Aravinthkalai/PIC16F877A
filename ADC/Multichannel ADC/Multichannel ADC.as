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
	FNCALL	_main,_delay
	FNCALL	_adc,_cmd
	FNCALL	_adc,_adc_con
	FNCALL	_adc_con,___lwdiv
	FNCALL	_adc_con,_dat
	FNCALL	_adc_con,___lwmod
	FNCALL	_show,_dat
	FNCALL	_lcd_int,_cmd
	FNCALL	_dat,_delay
	FNCALL	_cmd,_delay
	FNROOT	_main
	global	_ADCON0
psect	text230,local,class=CODE,delta=2
global __ptext230
__ptext230:
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
	file	"Multichannel ADC.as"
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
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	?_adc_con
?_adc_con:	; 0 bytes @ 0x0
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
	global	??_adc
??_adc:	; 0 bytes @ 0xE
	global	??_main
??_main:	; 0 bytes @ 0xE
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_adc_con
??_adc_con:	; 0 bytes @ 0x0
	ds	2
	global	adc_con@adcval
adc_con@adcval:	; 2 bytes @ 0x2
	ds	2
	global	?_adc
?_adc:	; 0 bytes @ 0x4
	global	adc@i
adc@i:	; 2 bytes @ 0x4
	ds	2
	global	main@i
main@i:	; 2 bytes @ 0x6
	ds	2
;;Data sizes: Strings 12, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80      8       8
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
;;   _adc_con->___lwmod
;;   _show->_dat
;;   _lcd_int->_cmd
;;   _dat->_delay
;;   _cmd->_delay
;;   ___lwmod->___lwdiv
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_adc
;;   _adc->_adc_con
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
;; (0) _main                                                 2     2      0    1207
;;                                              6 BANK0      2     2      0
;;                            _lcd_int
;;                               _show
;;                                _cmd
;;                                _adc
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (1) _adc                                                  2     0      2     660
;;                                              4 BANK0      2     0      2
;;                                _cmd
;;                            _adc_con
;; ---------------------------------------------------------------------------------
;; (2) _adc_con                                              4     4      0     524
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
;; (3) _dat                                                  1     1      0     114
;;                                              7 COMMON     1     1      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (2) _cmd                                                  1     1      0     114
;;                                              7 COMMON     1     1      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (3) ___lwmod                                              6     2      4     159
;;                                              8 COMMON     6     2      4
;;                            ___lwdiv (ARG)
;; ---------------------------------------------------------------------------------
;; (3) ___lwdiv                                              8     4      4     162
;;                                              0 COMMON     8     4      4
;; ---------------------------------------------------------------------------------
;; (1) _delay                                                7     5      2      92
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
;;     _cmd
;;       _delay
;;     _adc_con
;;       ___lwdiv
;;       _dat
;;         _delay
;;       ___lwmod
;;         ___lwdiv (ARG)
;;   _delay
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
;;STACK                0      0       4       2        0.0%
;;ABS                  0      0       0       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      8       8       5       10.0%
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
;;		line 14 in file "F:\Basic Microcontroller\PIC16F877A\ADC\Multichannel ADC\multi channel ADC .c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    6[BANK0 ] int 
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
;;      Locals:         0       2       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_lcd_int
;;		_show
;;		_cmd
;;		_adc
;;		_delay
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"F:\Basic Microcontroller\PIC16F877A\ADC\Multichannel ADC\multi channel ADC .c"
	line	14
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 4
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	16
	
l3016:	
;multi channel ADC .c: 15: int i;
;multi channel ADC .c: 16: TRISD=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	17
;multi channel ADC .c: 17: TRISC=0;
	clrf	(135)^080h	;volatile
	line	18
	
l3018:	
;multi channel ADC .c: 18: TRISA0=1;
	bsf	(1064/8)^080h,(1064)&7
	line	19
	
l3020:	
;multi channel ADC .c: 19: lcd_int();
	fcall	_lcd_int
	line	20
	
l3022:	
;multi channel ADC .c: 20: show("ADC Value :");
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_show
	goto	l3024
	line	21
;multi channel ADC .c: 21: while(1)
	
l697:	
	line	23
	
l3024:	
;multi channel ADC .c: 22: {
;multi channel ADC .c: 23: for(i=0;i<2;i++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@i)
	clrf	(main@i+1)
	
l3026:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(02h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2475
	movlw	low(02h)
	subwf	(main@i),w
u2475:

	skipc
	goto	u2471
	goto	u2470
u2471:
	goto	l3030
u2470:
	goto	l3024
	
l3028:	
	goto	l3024
	line	24
	
l698:	
	line	25
	
l3030:	
;multi channel ADC .c: 24: {
;multi channel ADC .c: 25: cmd(0xC0);
	movlw	(0C0h)
	fcall	_cmd
	line	26
	
l3032:	
;multi channel ADC .c: 26: adc(i);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@i+1),w
	clrf	(?_adc+1)
	addwf	(?_adc+1)
	movf	(main@i),w
	clrf	(?_adc)
	addwf	(?_adc)

	fcall	_adc
	line	27
	
l3034:	
;multi channel ADC .c: 27: delay(50);
	movlw	low(032h)
	movwf	(?_delay)
	movlw	high(032h)
	movwf	((?_delay))+1
	fcall	_delay
	line	23
	
l3036:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	
l3038:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(02h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2485
	movlw	low(02h)
	subwf	(main@i),w
u2485:

	skipc
	goto	u2481
	goto	u2480
u2481:
	goto	l3030
u2480:
	goto	l3024
	
l699:	
	goto	l3024
	line	29
	
l700:	
	line	21
	goto	l3024
	
l701:	
	line	30
	
l702:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_adc
psect	text231,local,class=CODE,delta=2
global __ptext231
__ptext231:

;; *************** function _adc *****************
;; Defined at:
;;		line 68 in file "F:\Basic Microcontroller\PIC16F877A\ADC\Multichannel ADC\multi channel ADC .c"
;; Parameters:    Size  Location     Type
;;  i               2    4[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_cmd
;;		_adc_con
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text231
	file	"F:\Basic Microcontroller\PIC16F877A\ADC\Multichannel ADC\multi channel ADC .c"
	line	68
	global	__size_of_adc
	__size_of_adc	equ	__end_of_adc-_adc
	
_adc:	
	opt	stack 4
; Regs used in _adc: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	69
	
l2988:	
;multi channel ADC .c: 69: switch(i)
	goto	l3010
	line	71
;multi channel ADC .c: 70: {
;multi channel ADC .c: 71: case 0:
	
l721:	
	line	72
	
l2990:	
;multi channel ADC .c: 72: ADCON0=0X4D;
	movlw	(04Dh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	73
	
l2992:	
;multi channel ADC .c: 73: cmd(0xc0);
	movlw	(0C0h)
	fcall	_cmd
	line	74
	
l2994:	
;multi channel ADC .c: 74: adc_con();
	fcall	_adc_con
	line	75
;multi channel ADC .c: 75: break;
	goto	l725
	line	76
;multi channel ADC .c: 76: case 1:
	
l723:	
	line	77
	
l2996:	
;multi channel ADC .c: 77: ADCON0=0X55;
	movlw	(055h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	78
	
l2998:	
;multi channel ADC .c: 78: cmd(0xc6);
	movlw	(0C6h)
	fcall	_cmd
	line	79
	
l3000:	
;multi channel ADC .c: 79: adc_con();
	fcall	_adc_con
	line	80
;multi channel ADC .c: 80: break;
	goto	l725
	line	81
;multi channel ADC .c: 81: case 2: ADCON0=0X55;
	
l724:	
	
l3002:	
	movlw	(055h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	82
	
l3004:	
;multi channel ADC .c: 82: cmd(0xca);
	movlw	(0CAh)
	fcall	_cmd
	line	83
	
l3006:	
;multi channel ADC .c: 83: adc_con();
	fcall	_adc_con
	line	84
;multi channel ADC .c: 84: break;
	goto	l725
	line	85
	
l3008:	
;multi channel ADC .c: 85: }
	goto	l725
	line	69
	
l720:	
	
l3010:	
	; Switch on 2 bytes has been partitioned into a top level switch of size 1, and 1 sub-switches
; Switch size 1, requested type "space"
; Number of cases is 1, Range of values is 0 to 0
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            4     3 (average)
; direct_byte           11     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable             5     6 (fixed)
; spacedrange            8     9 (fixed)
; locatedrange           1     3 (fixed)
;	Chosen strategy is simple_byte

	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf (adc@i+1),w
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l3060
	goto	l725
	opt asmopt_on
	
l3060:	
; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 0 to 2
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; direct_byte           17     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable             7     6 (fixed)
; spacedrange           12     9 (fixed)
; locatedrange           3     3 (fixed)
;	Chosen strategy is simple_byte

	movf (adc@i),w
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l2990
	xorlw	1^0	; case 1
	skipnz
	goto	l2996
	xorlw	2^1	; case 2
	skipnz
	goto	l3002
	goto	l725
	opt asmopt_on

	line	85
	
l722:	
	line	86
	
l725:	
	return
	opt stack 0
GLOBAL	__end_of_adc
	__end_of_adc:
;; =============== function _adc ends ============

	signat	_adc,4216
	global	_adc_con
psect	text232,local,class=CODE,delta=2
global __ptext232
__ptext232:

;; *************** function _adc_con *****************
;; Defined at:
;;		line 88 in file "F:\Basic Microcontroller\PIC16F877A\ADC\Multichannel ADC\multi channel ADC .c"
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
;;		_adc
;; This function uses a non-reentrant model
;;
psect	text232
	file	"F:\Basic Microcontroller\PIC16F877A\ADC\Multichannel ADC\multi channel ADC .c"
	line	88
	global	__size_of_adc_con
	__size_of_adc_con	equ	__end_of_adc_con-_adc_con
	
_adc_con:	
	opt	stack 4
; Regs used in _adc_con: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	90
	
l2976:	
;multi channel ADC .c: 89: unsigned int adcval;
;multi channel ADC .c: 90: ADCON1=0x80;
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	92
;multi channel ADC .c: 92: while(GO_nDONE==1);
	goto	l728
	
l729:	
	
l728:	
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(250/8),(250)&7
	goto	u2461
	goto	u2460
u2461:
	goto	l728
u2460:
	goto	l2978
	
l730:	
	line	93
	
l2978:	
;multi channel ADC .c: 93: adcval=((ADRESH<<8)+(ADRESL));
	movf	(30),w	;volatile
	movwf	(??_adc_con+0)+0
	clrf	(??_adc_con+0)+0+1
	movf	(??_adc_con+0)+0,w
	movwf	(??_adc_con+0)+1
	clrf	(??_adc_con+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	0+(??_adc_con+0)+0,w
	movwf	(adc_con@adcval)
	movlw	0
	skipnc
	movlw	1
	addwf	1+(??_adc_con+0)+0,w
	movwf	1+(adc_con@adcval)
	line	94
	
l2980:	
;multi channel ADC .c: 94: dat((adcval/1000)+48);
	movlw	low(03E8h)
	movwf	(?___lwdiv)
	movlw	high(03E8h)
	movwf	((?___lwdiv))+1
	movf	(adc_con@adcval+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(adc_con@adcval),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(0+(?___lwdiv)),w
	addlw	030h
	fcall	_dat
	line	95
	
l2982:	
;multi channel ADC .c: 95: dat(((adcval/100)%10)+48);
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
	movf	(adc_con@adcval+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(adc_con@adcval),w
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
	line	96
	
l2984:	
;multi channel ADC .c: 96: dat(((adcval/10)%10)+48);
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
	movf	(adc_con@adcval+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(adc_con@adcval),w
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
	line	97
	
l2986:	
;multi channel ADC .c: 97: dat((adcval%10)+48);
	movlw	low(0Ah)
	movwf	(?___lwmod)
	movlw	high(0Ah)
	movwf	((?___lwmod))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(adc_con@adcval+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(adc_con@adcval),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	030h
	fcall	_dat
	line	98
	
l731:	
	return
	opt stack 0
GLOBAL	__end_of_adc_con
	__end_of_adc_con:
;; =============== function _adc_con ends ============

	signat	_adc_con,88
	global	_show
psect	text233,local,class=CODE,delta=2
global __ptext233
__ptext233:

;; *************** function _show *****************
;; Defined at:
;;		line 60 in file "F:\Basic Microcontroller\PIC16F877A\ADC\Multichannel ADC\multi channel ADC .c"
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
psect	text233
	file	"F:\Basic Microcontroller\PIC16F877A\ADC\Multichannel ADC\multi channel ADC .c"
	line	60
	global	__size_of_show
	__size_of_show	equ	__end_of_show-_show
	
_show:	
	opt	stack 5
; Regs used in _show: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
;show@s stored from wreg
	movwf	(show@s)
	line	61
	
l2968:	
;multi channel ADC .c: 61: while(*s)
	goto	l2974
	
l715:	
	line	63
	
l2970:	
;multi channel ADC .c: 62: {
;multi channel ADC .c: 63: dat(*s++);
	movf	(show@s),w
	movwf	fsr0
	fcall	stringdir
	fcall	_dat
	
l2972:	
	movlw	(01h)
	movwf	(??_show+0)+0
	movf	(??_show+0)+0,w
	addwf	(show@s),f
	goto	l2974
	line	64
	
l714:	
	line	61
	
l2974:	
	movf	(show@s),w
	movwf	fsr0
	fcall	stringdir
	iorlw	0
	skipz
	goto	u2451
	goto	u2450
u2451:
	goto	l2970
u2450:
	goto	l717
	
l716:	
	line	65
	
l717:	
	return
	opt stack 0
GLOBAL	__end_of_show
	__end_of_show:
;; =============== function _show ends ============

	signat	_show,4216
	global	_lcd_int
psect	text234,local,class=CODE,delta=2
global __ptext234
__ptext234:

;; *************** function _lcd_int *****************
;; Defined at:
;;		line 32 in file "F:\Basic Microcontroller\PIC16F877A\ADC\Multichannel ADC\multi channel ADC .c"
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
psect	text234
	file	"F:\Basic Microcontroller\PIC16F877A\ADC\Multichannel ADC\multi channel ADC .c"
	line	32
	global	__size_of_lcd_int
	__size_of_lcd_int	equ	__end_of_lcd_int-_lcd_int
	
_lcd_int:	
	opt	stack 5
; Regs used in _lcd_int: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	33
	
l2966:	
;multi channel ADC .c: 33: cmd(0x38);
	movlw	(038h)
	fcall	_cmd
	line	34
;multi channel ADC .c: 34: cmd(0x0c);
	movlw	(0Ch)
	fcall	_cmd
	line	35
;multi channel ADC .c: 35: cmd(0x06);
	movlw	(06h)
	fcall	_cmd
	line	36
;multi channel ADC .c: 36: cmd(0x80);
	movlw	(080h)
	fcall	_cmd
	line	37
	
l705:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_int
	__end_of_lcd_int:
;; =============== function _lcd_int ends ============

	signat	_lcd_int,88
	global	_dat
psect	text235,local,class=CODE,delta=2
global __ptext235
__ptext235:

;; *************** function _dat *****************
;; Defined at:
;;		line 50 in file "F:\Basic Microcontroller\PIC16F877A\ADC\Multichannel ADC\multi channel ADC .c"
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
;;		_adc_con
;; This function uses a non-reentrant model
;;
psect	text235
	file	"F:\Basic Microcontroller\PIC16F877A\ADC\Multichannel ADC\multi channel ADC .c"
	line	50
	global	__size_of_dat
	__size_of_dat	equ	__end_of_dat-_dat
	
_dat:	
	opt	stack 4
; Regs used in _dat: [wreg+status,2+status,0+btemp+1+pclath+cstack]
;dat@b stored from wreg
	movwf	(dat@b)
	line	51
	
l2954:	
;multi channel ADC .c: 51: PORTD=b;
	movf	(dat@b),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	52
	
l2956:	
;multi channel ADC .c: 52: RC4=1;
	bsf	(60/8),(60)&7
	line	53
	
l2958:	
;multi channel ADC .c: 53: RC5=0;
	bcf	(61/8),(61)&7
	line	54
	
l2960:	
;multi channel ADC .c: 54: RC6=1;
	bsf	(62/8),(62)&7
	line	55
	
l2962:	
;multi channel ADC .c: 55: delay(10);
	movlw	low(0Ah)
	movwf	(?_delay)
	movlw	high(0Ah)
	movwf	((?_delay))+1
	fcall	_delay
	line	56
	
l2964:	
;multi channel ADC .c: 56: RC6=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(62/8),(62)&7
	line	57
	
l711:	
	return
	opt stack 0
GLOBAL	__end_of_dat
	__end_of_dat:
;; =============== function _dat ends ============

	signat	_dat,4216
	global	_cmd
psect	text236,local,class=CODE,delta=2
global __ptext236
__ptext236:

;; *************** function _cmd *****************
;; Defined at:
;;		line 40 in file "F:\Basic Microcontroller\PIC16F877A\ADC\Multichannel ADC\multi channel ADC .c"
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
;;		_adc
;; This function uses a non-reentrant model
;;
psect	text236
	file	"F:\Basic Microcontroller\PIC16F877A\ADC\Multichannel ADC\multi channel ADC .c"
	line	40
	global	__size_of_cmd
	__size_of_cmd	equ	__end_of_cmd-_cmd
	
_cmd:	
	opt	stack 5
; Regs used in _cmd: [wreg+status,2+status,0+btemp+1+pclath+cstack]
;cmd@a stored from wreg
	movwf	(cmd@a)
	line	41
	
l2942:	
;multi channel ADC .c: 41: PORTD=a;
	movf	(cmd@a),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	42
	
l2944:	
;multi channel ADC .c: 42: RC4=0;
	bcf	(60/8),(60)&7
	line	43
	
l2946:	
;multi channel ADC .c: 43: RC5=0;
	bcf	(61/8),(61)&7
	line	44
	
l2948:	
;multi channel ADC .c: 44: RC6=1;
	bsf	(62/8),(62)&7
	line	45
	
l2950:	
;multi channel ADC .c: 45: delay(10);
	movlw	low(0Ah)
	movwf	(?_delay)
	movlw	high(0Ah)
	movwf	((?_delay))+1
	fcall	_delay
	line	46
	
l2952:	
;multi channel ADC .c: 46: RC6=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(62/8),(62)&7
	line	47
	
l708:	
	return
	opt stack 0
GLOBAL	__end_of_cmd
	__end_of_cmd:
;; =============== function _cmd ends ============

	signat	_cmd,4216
	global	___lwmod
psect	text237,local,class=CODE,delta=2
global __ptext237
__ptext237:

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
;;		_adc_con
;; This function uses a non-reentrant model
;;
psect	text237
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 5
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
l2920:	
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u2391
	goto	u2390
u2391:
	goto	l2938
u2390:
	line	9
	
l2922:	
	clrf	(___lwmod@counter)
	bsf	status,0
	rlf	(___lwmod@counter),f
	line	10
	goto	l2928
	
l1440:	
	line	11
	
l2924:	
	movlw	01h
	
u2405:
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u2405
	line	12
	
l2926:	
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	goto	l2928
	line	13
	
l1439:	
	line	10
	
l2928:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u2411
	goto	u2410
u2411:
	goto	l2924
u2410:
	goto	l2930
	
l1441:	
	goto	l2930
	line	14
	
l1442:	
	line	15
	
l2930:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u2425
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u2425:
	skipc
	goto	u2421
	goto	u2420
u2421:
	goto	l2934
u2420:
	line	16
	
l2932:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	goto	l2934
	
l1443:	
	line	17
	
l2934:	
	movlw	01h
	
u2435:
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u2435
	line	18
	
l2936:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u2441
	goto	u2440
u2441:
	goto	l2930
u2440:
	goto	l2938
	
l1444:	
	goto	l2938
	line	19
	
l1438:	
	line	20
	
l2938:	
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	goto	l1445
	
l2940:	
	line	21
	
l1445:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___lwdiv
psect	text238,local,class=CODE,delta=2
global __ptext238
__ptext238:

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
;;		_adc_con
;; This function uses a non-reentrant model
;;
psect	text238
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 5
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l2894:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
l2896:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u2321
	goto	u2320
u2321:
	goto	l2916
u2320:
	line	11
	
l2898:	
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	line	12
	goto	l2904
	
l1430:	
	line	13
	
l2900:	
	movlw	01h
	
u2335:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u2335
	line	14
	
l2902:	
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	goto	l2904
	line	15
	
l1429:	
	line	12
	
l2904:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u2341
	goto	u2340
u2341:
	goto	l2900
u2340:
	goto	l2906
	
l1431:	
	goto	l2906
	line	16
	
l1432:	
	line	17
	
l2906:	
	movlw	01h
	
u2355:
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u2355
	line	18
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u2365
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u2365:
	skipc
	goto	u2361
	goto	u2360
u2361:
	goto	l2912
u2360:
	line	19
	
l2908:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
l2910:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	goto	l2912
	line	21
	
l1433:	
	line	22
	
l2912:	
	movlw	01h
	
u2375:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u2375
	line	23
	
l2914:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u2381
	goto	u2380
u2381:
	goto	l2906
u2380:
	goto	l2916
	
l1434:	
	goto	l2916
	line	24
	
l1428:	
	line	25
	
l2916:	
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	goto	l1435
	
l2918:	
	line	26
	
l1435:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	_delay
psect	text239,local,class=CODE,delta=2
global __ptext239
__ptext239:

;; *************** function _delay *****************
;; Defined at:
;;		line 100 in file "F:\Basic Microcontroller\PIC16F877A\ADC\Multichannel ADC\multi channel ADC .c"
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
;;		_main
;;		_cmd
;;		_dat
;; This function uses a non-reentrant model
;;
psect	text239
	file	"F:\Basic Microcontroller\PIC16F877A\ADC\Multichannel ADC\multi channel ADC .c"
	line	100
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 7
; Regs used in _delay: [wreg+status,2+btemp+1]
	line	102
	
l2880:	
;multi channel ADC .c: 101: int i,j;
;multi channel ADC .c: 102: for(i=0;i<L;i++)
	clrf	(delay@i)
	clrf	(delay@i+1)
	goto	l734
	line	103
	
l735:	
	line	104
	
l2882:	
;multi channel ADC .c: 103: {
;multi channel ADC .c: 104: for(j=0;j<250;j++)
	clrf	(delay@j)
	clrf	(delay@j+1)
	
l2884:	
	movf	(delay@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0FAh))^80h
	subwf	btemp+1,w
	skipz
	goto	u2295
	movlw	low(0FAh)
	subwf	(delay@j),w
u2295:

	skipc
	goto	u2291
	goto	u2290
u2291:
	goto	l2888
u2290:
	goto	l2892
	
l2886:	
	goto	l2892
	line	105
	
l736:	
	line	104
	
l2888:	
;multi channel ADC .c: 105: {
	movlw	low(01h)
	addwf	(delay@j),f
	skipnc
	incf	(delay@j+1),f
	movlw	high(01h)
	addwf	(delay@j+1),f
	
l2890:	
	movf	(delay@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0FAh))^80h
	subwf	btemp+1,w
	skipz
	goto	u2305
	movlw	low(0FAh)
	subwf	(delay@j),w
u2305:

	skipc
	goto	u2301
	goto	u2300
u2301:
	goto	l2888
u2300:
	goto	l2892
	
l737:	
	line	102
	
l2892:	
	movlw	low(01h)
	addwf	(delay@i),f
	skipnc
	incf	(delay@i+1),f
	movlw	high(01h)
	addwf	(delay@i+1),f
	
l734:	
	movf	(delay@i+1),w
	xorlw	80h
	movwf	(??_delay+0)+0
	movf	(delay@L+1),w
	xorlw	80h
	subwf	(??_delay+0)+0,w
	skipz
	goto	u2315
	movf	(delay@L),w
	subwf	(delay@i),w
u2315:

	skipc
	goto	u2311
	goto	u2310
u2311:
	goto	l2882
u2310:
	goto	l739
	
l738:	
	line	108
	
l739:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
psect	text240,local,class=CODE,delta=2
global __ptext240
__ptext240:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
