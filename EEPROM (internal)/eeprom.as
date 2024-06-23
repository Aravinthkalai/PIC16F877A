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
	FNCALL	_main,_lcd_init
	FNCALL	_main,_lcd_string
	FNCALL	_main,_lcd_cmd
	FNCALL	_main,_EEwrite
	FNCALL	_main,_msdelay
	FNCALL	_main,_EEread
	FNCALL	_main,_lcd_data
	FNCALL	_lcd_string,_lcd_data
	FNCALL	_lcd_init,_lcd_cmd
	FNCALL	_lcd_init,_msdelay
	FNCALL	_lcd_data,_msdelay
	FNCALL	_lcd_cmd,_msdelay
	FNROOT	_main
	global	_PORTB
psect	text130,local,class=CODE,delta=2
global __ptext130
__ptext130:
_PORTB	set	6
	global	_PORTC
_PORTC	set	7
	global	_CARRY
_CARRY	set	24
	global	_EEIF
_EEIF	set	108
	global	_GIE
_GIE	set	95
	global	_RB0
_RB0	set	48
	global	_RB1
_RB1	set	49
	global	_RB2
_RB2	set	50
	global	_RD0
_RD0	set	64
	global	_RD5
_RD5	set	69
	global	_TRISB
_TRISB	set	134
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
	global	_EEPGD
_EEPGD	set	3175
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
	retlw	68	;'D'
	retlw	97	;'a'
	retlw	116	;'t'
	retlw	97	;'a'
	retlw	58	;':'
	retlw	32	;' '
	retlw	0
psect	strings
	file	"eeprom.as"
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
	global	?_EEwrite
?_EEwrite:	; 0 bytes @ 0x0
	global	??_EEread
??_EEread:	; 0 bytes @ 0x0
	global	?_msdelay
?_msdelay:	; 0 bytes @ 0x0
	global	?_lcd_cmd
?_lcd_cmd:	; 0 bytes @ 0x0
	global	?_lcd_data
?_lcd_data:	; 0 bytes @ 0x0
	global	?_lcd_init
?_lcd_init:	; 0 bytes @ 0x0
	global	?_lcd_string
?_lcd_string:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_EEread
?_EEread:	; 1 bytes @ 0x0
	global	EEwrite@address
EEwrite@address:	; 1 bytes @ 0x0
	global	msdelay@time
msdelay@time:	; 2 bytes @ 0x0
	ds	1
	global	??_EEwrite
??_EEwrite:	; 0 bytes @ 0x1
	global	EEread@address
EEread@address:	; 1 bytes @ 0x1
	global	EEwrite@data
EEwrite@data:	; 1 bytes @ 0x1
	ds	1
	global	??_msdelay
??_msdelay:	; 0 bytes @ 0x2
	global	EEread@byte
EEread@byte:	; 1 bytes @ 0x2
	global	msdelay@i
msdelay@i:	; 2 bytes @ 0x2
	ds	2
	global	msdelay@j
msdelay@j:	; 2 bytes @ 0x4
	ds	2
	global	??_lcd_cmd
??_lcd_cmd:	; 0 bytes @ 0x6
	global	??_lcd_data
??_lcd_data:	; 0 bytes @ 0x6
	global	lcd_cmd@command
lcd_cmd@command:	; 1 bytes @ 0x6
	global	lcd_data@disp_data
lcd_data@disp_data:	; 1 bytes @ 0x6
	ds	1
	global	??_lcd_init
??_lcd_init:	; 0 bytes @ 0x7
	global	??_lcd_string
??_lcd_string:	; 0 bytes @ 0x7
	global	lcd_string@k
lcd_string@k:	; 2 bytes @ 0x7
	ds	2
	global	lcd_string@str
lcd_string@str:	; 1 bytes @ 0x9
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0xA
	ds	1
	global	main@a
main@a:	; 1 bytes @ 0xB
	ds	1
;;Data sizes: Strings 7, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     12      12
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; lcd_string@str	PTR unsigned char  size(1) Largest target is 7
;;		 -> STR_1(CODE[7]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_lcd_string
;;   _lcd_string->_lcd_data
;;   _lcd_init->_lcd_cmd
;;   _lcd_data->_msdelay
;;   _lcd_cmd->_msdelay
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
;; (0) _main                                                 2     2      0     555
;;                                             10 COMMON     2     2      0
;;                           _lcd_init
;;                         _lcd_string
;;                            _lcd_cmd
;;                            _EEwrite
;;                            _msdelay
;;                             _EEread
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (1) _lcd_string                                           3     3      0     135
;;                                              7 COMMON     3     3      0
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (1) _lcd_init                                             0     0      0     135
;;                            _lcd_cmd
;;                            _msdelay
;; ---------------------------------------------------------------------------------
;; (1) _lcd_data                                             1     1      0      75
;;                                              6 COMMON     1     1      0
;;                            _msdelay
;; ---------------------------------------------------------------------------------
;; (1) _lcd_cmd                                              1     1      0      75
;;                                              6 COMMON     1     1      0
;;                            _msdelay
;; ---------------------------------------------------------------------------------
;; (1) _EEread                                               3     3      0      30
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (1) _EEwrite                                              2     1      1      30
;;                                              0 COMMON     2     1      1
;; ---------------------------------------------------------------------------------
;; (2) _msdelay                                              6     4      2      60
;;                                              0 COMMON     6     4      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _lcd_init
;;     _lcd_cmd
;;       _msdelay
;;     _msdelay
;;   _lcd_string
;;     _lcd_data
;;       _msdelay
;;   _lcd_cmd
;;     _msdelay
;;   _EEwrite
;;   _msdelay
;;   _EEread
;;   _lcd_data
;;     _msdelay
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      C       C       1       85.7%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       3       2        0.0%
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
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 55 in file "C:\Users\ELCOT\Desktop\pic16 internal eeprom test\eeprom.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  a               1   11[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_init
;;		_lcd_string
;;		_lcd_cmd
;;		_EEwrite
;;		_msdelay
;;		_EEread
;;		_lcd_data
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\ELCOT\Desktop\pic16 internal eeprom test\eeprom.c"
	line	55
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	57
	
l2693:	
;eeprom.c: 56: unsigned char a;
;eeprom.c: 57: TRISC=0X00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(135)^080h	;volatile
	line	58
	
l2695:	
;eeprom.c: 58: PORTC=0XFF;
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	59
	
l2697:	
;eeprom.c: 59: TRISB=0X00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	60
;eeprom.c: 60: PORTB=0XFF;
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	61
	
l2699:	
;eeprom.c: 61: EEDATA=0X00;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	(268)^0100h	;volatile
	line	62
	
l2701:	
;eeprom.c: 62: EEADR=0X00;
	clrf	(269)^0100h	;volatile
	line	63
	
l2703:	
;eeprom.c: 63: lcd_init();
	fcall	_lcd_init
	line	64
	
l2705:	
;eeprom.c: 64: lcd_string("Data: ");
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_lcd_string
	line	65
	
l2707:	
;eeprom.c: 65: lcd_cmd(0x88);
	movlw	(088h)
	fcall	_lcd_cmd
	goto	l2709
	line	66
;eeprom.c: 66: while(1)
	
l712:	
	line	68
	
l2709:	
;eeprom.c: 67: {
;eeprom.c: 68: if(RD0==0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(64/8),(64)&7
	goto	u2271
	goto	u2270
u2271:
	goto	l2713
u2270:
	line	70
	
l2711:	
;eeprom.c: 69: {
;eeprom.c: 70: EEwrite('2',0XA0);
	movlw	(0A0h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_EEwrite)
	movlw	(032h)
	fcall	_EEwrite
	line	71
;eeprom.c: 71: msdelay(50);
	movlw	low(032h)
	movwf	(?_msdelay)
	movlw	high(032h)
	movwf	((?_msdelay))+1
	fcall	_msdelay
	goto	l2713
	line	72
	
l713:	
	line	73
	
l2713:	
;eeprom.c: 72: }
;eeprom.c: 73: if(RD5==0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(69/8),(69)&7
	goto	u2281
	goto	u2280
u2281:
	goto	l2709
u2280:
	line	75
	
l2715:	
;eeprom.c: 74: {
;eeprom.c: 75: a=EEread(0xA0);
	movlw	(0A0h)
	fcall	_EEread
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@a)
	line	76
	
l2717:	
;eeprom.c: 76: lcd_data(a);
	movf	(main@a),w
	fcall	_lcd_data
	line	77
	
l2719:	
;eeprom.c: 77: msdelay(50);
	movlw	low(032h)
	movwf	(?_msdelay)
	movlw	high(032h)
	movwf	((?_msdelay))+1
	fcall	_msdelay
	goto	l2709
	line	78
	
l714:	
	goto	l2709
	line	79
	
l715:	
	line	66
	goto	l2709
	
l716:	
	line	80
	
l717:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_lcd_string
psect	text131,local,class=CODE,delta=2
global __ptext131
__ptext131:

;; *************** function _lcd_string *****************
;; Defined at:
;;		line 46 in file "C:\Users\ELCOT\Desktop\pic16 internal eeprom test\eeprom.c"
;; Parameters:    Size  Location     Type
;;  str             1    wreg     PTR unsigned char 
;;		 -> STR_1(7), 
;; Auto vars:     Size  Location     Type
;;  str             1    9[COMMON] PTR unsigned char 
;;		 -> STR_1(7), 
;;  k               2    7[COMMON] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_lcd_data
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text131
	file	"C:\Users\ELCOT\Desktop\pic16 internal eeprom test\eeprom.c"
	line	46
	global	__size_of_lcd_string
	__size_of_lcd_string	equ	__end_of_lcd_string-_lcd_string
	
_lcd_string:	
	opt	stack 5
; Regs used in _lcd_string: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;lcd_string@str stored from wreg
	movwf	(lcd_string@str)
	line	47
	
l2685:	
;eeprom.c: 47: int k=0;
	clrf	(lcd_string@k)
	clrf	(lcd_string@k+1)
	line	48
;eeprom.c: 48: while(str[k]!='\0')
	goto	l2691
	
l707:	
	line	50
	
l2687:	
;eeprom.c: 49: {
;eeprom.c: 50: lcd_data(str[k]);
	movf	(lcd_string@k),w
	addwf	(lcd_string@str),w
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_data
	line	51
	
l2689:	
;eeprom.c: 51: k++;
	movlw	low(01h)
	addwf	(lcd_string@k),f
	skipnc
	incf	(lcd_string@k+1),f
	movlw	high(01h)
	addwf	(lcd_string@k+1),f
	goto	l2691
	line	52
	
l706:	
	line	48
	
l2691:	
	movf	(lcd_string@k),w
	addwf	(lcd_string@str),w
	movwf	fsr0
	fcall	stringdir
	iorlw	0
	skipz
	goto	u2261
	goto	u2260
u2261:
	goto	l2687
u2260:
	goto	l709
	
l708:	
	line	53
	
l709:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_string
	__end_of_lcd_string:
;; =============== function _lcd_string ends ============

	signat	_lcd_string,4216
	global	_lcd_init
psect	text132,local,class=CODE,delta=2
global __ptext132
__ptext132:

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 35 in file "C:\Users\ELCOT\Desktop\pic16 internal eeprom test\eeprom.c"
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_lcd_cmd
;;		_msdelay
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text132
	file	"C:\Users\ELCOT\Desktop\pic16 internal eeprom test\eeprom.c"
	line	35
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 5
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	36
	
l2683:	
;eeprom.c: 36: lcd_cmd(0x38);
	movlw	(038h)
	fcall	_lcd_cmd
	line	37
;eeprom.c: 37: msdelay(10);
	movlw	low(0Ah)
	movwf	(?_msdelay)
	movlw	high(0Ah)
	movwf	((?_msdelay))+1
	fcall	_msdelay
	line	38
;eeprom.c: 38: lcd_cmd(0x0F);
	movlw	(0Fh)
	fcall	_lcd_cmd
	line	39
;eeprom.c: 39: msdelay(10);
	movlw	low(0Ah)
	movwf	(?_msdelay)
	movlw	high(0Ah)
	movwf	((?_msdelay))+1
	fcall	_msdelay
	line	40
;eeprom.c: 40: lcd_cmd(0x01);
	movlw	(01h)
	fcall	_lcd_cmd
	line	41
;eeprom.c: 41: msdelay(10);
	movlw	low(0Ah)
	movwf	(?_msdelay)
	movlw	high(0Ah)
	movwf	((?_msdelay))+1
	fcall	_msdelay
	line	42
;eeprom.c: 42: lcd_cmd(0x80);
	movlw	(080h)
	fcall	_lcd_cmd
	line	43
;eeprom.c: 43: msdelay(10);
	movlw	low(0Ah)
	movwf	(?_msdelay)
	movlw	high(0Ah)
	movwf	((?_msdelay))+1
	fcall	_msdelay
	line	44
	
l703:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
;; =============== function _lcd_init ends ============

	signat	_lcd_init,88
	global	_lcd_data
psect	text133,local,class=CODE,delta=2
global __ptext133
__ptext133:

;; *************** function _lcd_data *****************
;; Defined at:
;;		line 25 in file "C:\Users\ELCOT\Desktop\pic16 internal eeprom test\eeprom.c"
;; Parameters:    Size  Location     Type
;;  disp_data       1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  disp_data       1    6[COMMON] unsigned char 
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
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_msdelay
;; This function is called by:
;;		_lcd_string
;;		_main
;; This function uses a non-reentrant model
;;
psect	text133
	file	"C:\Users\ELCOT\Desktop\pic16 internal eeprom test\eeprom.c"
	line	25
	global	__size_of_lcd_data
	__size_of_lcd_data	equ	__end_of_lcd_data-_lcd_data
	
_lcd_data:	
	opt	stack 6
; Regs used in _lcd_data: [wreg+status,2+status,0+pclath+cstack]
;lcd_data@disp_data stored from wreg
	movwf	(lcd_data@disp_data)
	line	26
	
l2671:	
;eeprom.c: 26: PORTC = disp_data;
	movf	(lcd_data@disp_data),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	27
	
l2673:	
;eeprom.c: 27: RB0=1;
	bsf	(48/8),(48)&7
	line	28
	
l2675:	
;eeprom.c: 28: RB1=0;
	bcf	(49/8),(49)&7
	line	29
	
l2677:	
;eeprom.c: 29: RB2=1;
	bsf	(50/8),(50)&7
	line	30
	
l2679:	
;eeprom.c: 30: msdelay(1);
	movlw	low(01h)
	movwf	(?_msdelay)
	movlw	high(01h)
	movwf	((?_msdelay))+1
	fcall	_msdelay
	line	31
	
l2681:	
;eeprom.c: 31: RB2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(50/8),(50)&7
	line	32
	
l700:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_data
	__end_of_lcd_data:
;; =============== function _lcd_data ends ============

	signat	_lcd_data,4216
	global	_lcd_cmd
psect	text134,local,class=CODE,delta=2
global __ptext134
__ptext134:

;; *************** function _lcd_cmd *****************
;; Defined at:
;;		line 15 in file "C:\Users\ELCOT\Desktop\pic16 internal eeprom test\eeprom.c"
;; Parameters:    Size  Location     Type
;;  command         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  command         1    6[COMMON] unsigned char 
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
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_msdelay
;; This function is called by:
;;		_lcd_init
;;		_main
;; This function uses a non-reentrant model
;;
psect	text134
	file	"C:\Users\ELCOT\Desktop\pic16 internal eeprom test\eeprom.c"
	line	15
	global	__size_of_lcd_cmd
	__size_of_lcd_cmd	equ	__end_of_lcd_cmd-_lcd_cmd
	
_lcd_cmd:	
	opt	stack 6
; Regs used in _lcd_cmd: [wreg+status,2+status,0+pclath+cstack]
;lcd_cmd@command stored from wreg
	movwf	(lcd_cmd@command)
	line	16
	
l2659:	
;eeprom.c: 16: PORTC = command;
	movf	(lcd_cmd@command),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	17
	
l2661:	
;eeprom.c: 17: RB0=0;
	bcf	(48/8),(48)&7
	line	18
	
l2663:	
;eeprom.c: 18: RB1=0;
	bcf	(49/8),(49)&7
	line	19
	
l2665:	
;eeprom.c: 19: RB2=1;
	bsf	(50/8),(50)&7
	line	20
	
l2667:	
;eeprom.c: 20: msdelay(1);
	movlw	low(01h)
	movwf	(?_msdelay)
	movlw	high(01h)
	movwf	((?_msdelay))+1
	fcall	_msdelay
	line	21
	
l2669:	
;eeprom.c: 21: RB2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(50/8),(50)&7
	line	22
	
l697:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_cmd
	__end_of_lcd_cmd:
;; =============== function _lcd_cmd ends ============

	signat	_lcd_cmd,4216
	global	_EEread
psect	text135,local,class=CODE,delta=2
global __ptext135
__ptext135:

;; *************** function _EEread *****************
;; Defined at:
;;		line 82 in file "C:\Users\ELCOT\Desktop\pic16 internal eeprom test\eeprom.c"
;; Parameters:    Size  Location     Type
;;  address         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  address         1    1[COMMON] unsigned char 
;;  byte            1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text135
	file	"C:\Users\ELCOT\Desktop\pic16 internal eeprom test\eeprom.c"
	line	82
	global	__size_of_EEread
	__size_of_EEread	equ	__end_of_EEread-_EEread
	
_EEread:	
	opt	stack 7
; Regs used in _EEread: [wreg]
;EEread@address stored from wreg
	line	84
	movwf	(EEread@address)
	
l1793:	
;eeprom.c: 83: unsigned char byte;
;eeprom.c: 84: EEADR=address;
	movf	(EEread@address),w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(269)^0100h	;volatile
	line	85
	
l1795:	
;eeprom.c: 85: EEPGD=0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3175/8)^0180h,(3175)&7
	line	86
	
l1797:	
;eeprom.c: 86: RD=1;
	bsf	(3168/8)^0180h,(3168)&7
	line	87
;eeprom.c: 87: byte=EEDATA;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movf	(268)^0100h,w	;volatile
	movwf	(??_EEread+0)+0
	movf	(??_EEread+0)+0,w
	movwf	(EEread@byte)
	line	88
;eeprom.c: 88: return byte;
	movf	(EEread@byte),w
	goto	l720
	
l1799:	
	line	89
	
l720:	
	return
	opt stack 0
GLOBAL	__end_of_EEread
	__end_of_EEread:
;; =============== function _EEread ends ============

	signat	_EEread,4217
	global	_EEwrite
psect	text136,local,class=CODE,delta=2
global __ptext136
__ptext136:

;; *************** function _EEwrite *****************
;; Defined at:
;;		line 91 in file "C:\Users\ELCOT\Desktop\pic16 internal eeprom test\eeprom.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;;  address         1    0[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    1[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         1       0       0       0       0
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
psect	text136
	file	"C:\Users\ELCOT\Desktop\pic16 internal eeprom test\eeprom.c"
	line	91
	global	__size_of_EEwrite
	__size_of_EEwrite	equ	__end_of_EEwrite-_EEwrite
	
_EEwrite:	
	opt	stack 7
; Regs used in _EEwrite: [wreg]
;EEwrite@data stored from wreg
	movwf	(EEwrite@data)
	line	92
	
l1785:	
;eeprom.c: 92: EEADR=address;
	movf	(EEwrite@address),w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(269)^0100h	;volatile
	line	93
;eeprom.c: 93: EEDATA=data;
	movf	(EEwrite@data),w
	movwf	(268)^0100h	;volatile
	line	94
	
l1787:	
;eeprom.c: 94: EEPGD=0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3175/8)^0180h,(3175)&7
	line	95
	
l1789:	
;eeprom.c: 95: WREN=1;
	bsf	(3170/8)^0180h,(3170)&7
	line	96
;eeprom.c: 96: EECON2=0X55;
	movlw	(055h)
	movwf	(397)^0180h	;volatile
	line	97
;eeprom.c: 97: EECON2=0XAA;
	movlw	(0AAh)
	movwf	(397)^0180h	;volatile
	line	98
	
l1791:	
;eeprom.c: 98: WR=1;
	bsf	(3169/8)^0180h,(3169)&7
	line	99
;eeprom.c: 99: while(EEIF==0);
	goto	l723
	
l724:	
	
l723:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(108/8),(108)&7
	goto	u41
	goto	u40
u41:
	goto	l723
u40:
	
l725:	
	line	100
;eeprom.c: 100: WREN=0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3170/8)^0180h,(3170)&7
	line	101
;eeprom.c: 101: EEIF=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(108/8),(108)&7
	line	102
	
l726:	
	return
	opt stack 0
GLOBAL	__end_of_EEwrite
	__end_of_EEwrite:
;; =============== function _EEwrite ends ============

	signat	_EEwrite,8312
	global	_msdelay
psect	text137,local,class=CODE,delta=2
global __ptext137
__ptext137:

;; *************** function _msdelay *****************
;; Defined at:
;;		line 9 in file "C:\Users\ELCOT\Desktop\pic16 internal eeprom test\eeprom.c"
;; Parameters:    Size  Location     Type
;;  time            2    0[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  j               2    4[COMMON] unsigned int 
;;  i               2    2[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         4       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_cmd
;;		_lcd_data
;;		_lcd_init
;;		_main
;; This function uses a non-reentrant model
;;
psect	text137
	file	"C:\Users\ELCOT\Desktop\pic16 internal eeprom test\eeprom.c"
	line	9
	global	__size_of_msdelay
	__size_of_msdelay	equ	__end_of_msdelay-_msdelay
	
_msdelay:	
	opt	stack 6
; Regs used in _msdelay: [wreg+status,2]
	line	11
	
l1773:	
;eeprom.c: 10: unsigned i,j ;
;eeprom.c: 11: for(i=0;i<time;i++)
	clrf	(msdelay@i)
	clrf	(msdelay@i+1)
	goto	l689
	line	12
	
l690:	
	
l1775:	
;eeprom.c: 12: for(j=0;j<1275;j++);
	clrf	(msdelay@j)
	clrf	(msdelay@j+1)
	
l1777:	
	movlw	high(04FBh)
	subwf	(msdelay@j+1),w
	movlw	low(04FBh)
	skipnz
	subwf	(msdelay@j),w
	skipc
	goto	u11
	goto	u10
u11:
	goto	l1781
u10:
	goto	l1783
	
l1779:	
	goto	l1783
	
l691:	
	
l1781:	
	movlw	low(01h)
	addwf	(msdelay@j),f
	skipnc
	incf	(msdelay@j+1),f
	movlw	high(01h)
	addwf	(msdelay@j+1),f
	movlw	high(04FBh)
	subwf	(msdelay@j+1),w
	movlw	low(04FBh)
	skipnz
	subwf	(msdelay@j),w
	skipc
	goto	u21
	goto	u20
u21:
	goto	l1781
u20:
	goto	l1783
	
l692:	
	line	11
	
l1783:	
	movlw	low(01h)
	addwf	(msdelay@i),f
	skipnc
	incf	(msdelay@i+1),f
	movlw	high(01h)
	addwf	(msdelay@i+1),f
	
l689:	
	movf	(msdelay@time+1),w
	subwf	(msdelay@i+1),w
	skipz
	goto	u35
	movf	(msdelay@time),w
	subwf	(msdelay@i),w
u35:
	skipc
	goto	u31
	goto	u30
u31:
	goto	l1775
u30:
	goto	l694
	
l693:	
	line	13
	
l694:	
	return
	opt stack 0
GLOBAL	__end_of_msdelay
	__end_of_msdelay:
;; =============== function _msdelay ends ============

	signat	_msdelay,4216
psect	text138,local,class=CODE,delta=2
global __ptext138
__ptext138:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
