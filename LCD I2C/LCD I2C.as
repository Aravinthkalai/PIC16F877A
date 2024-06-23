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
	FNCALL	_main,_I2C_Master_Init
	FNCALL	_main,_lcd_init
	FNCALL	_main,_lcd_send_string
	FNCALL	_lcd_send_string,_lcd_send_data
	FNCALL	_lcd_init,_lcd_send_cmd
	FNCALL	_lcd_send_data,_I2C_start
	FNCALL	_lcd_send_data,_I2C_write
	FNCALL	_lcd_send_data,_I2C_stop
	FNCALL	_lcd_send_cmd,_I2C_start
	FNCALL	_lcd_send_cmd,_I2C_write
	FNCALL	_lcd_send_cmd,_I2C_stop
	FNCALL	_I2C_stop,_I2C_Master_Wait
	FNCALL	_I2C_write,_I2C_Master_Wait
	FNCALL	_I2C_start,_I2C_Master_Wait
	FNROOT	_main
	global	_SSPBUF
psect	text150,local,class=CODE,delta=2
global __ptext150
__ptext150:
_SSPBUF	set	19
	global	_SSPCON
_SSPCON	set	20
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_SSPIF
_SSPIF	set	99
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
	global	_ACKSTAT
_ACKSTAT	set	1166
	global	_PEN
_PEN	set	1162
	global	_RCEN
_RCEN	set	1163
	global	_RSEN
_RSEN	set	1161
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
	retlw	104	;'h'
	retlw	101	;'e'
	retlw	108	;'l'
	retlw	108	;'l'
	retlw	111	;'o'
	retlw	32	;' '
	retlw	119	;'w'
	retlw	111	;'o'
	retlw	114	;'r'
	retlw	108	;'l'
	retlw	100	;'d'
	retlw	0
psect	strings
	file	"LCD I2C.as"
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
	global	?_I2C_Master_Init
?_I2C_Master_Init:	; 0 bytes @ 0x0
	global	??_I2C_Master_Init
??_I2C_Master_Init:	; 0 bytes @ 0x0
	global	?_lcd_init
?_lcd_init:	; 0 bytes @ 0x0
	global	?_lcd_send_string
?_lcd_send_string:	; 0 bytes @ 0x0
	global	?_lcd_send_cmd
?_lcd_send_cmd:	; 0 bytes @ 0x0
	global	?_lcd_send_data
?_lcd_send_data:	; 0 bytes @ 0x0
	global	?_I2C_start
?_I2C_start:	; 0 bytes @ 0x0
	global	??_I2C_start
??_I2C_start:	; 0 bytes @ 0x0
	global	??_I2C_write
??_I2C_write:	; 0 bytes @ 0x0
	global	?_I2C_stop
?_I2C_stop:	; 0 bytes @ 0x0
	global	??_I2C_stop
??_I2C_stop:	; 0 bytes @ 0x0
	global	?_I2C_Master_Wait
?_I2C_Master_Wait:	; 0 bytes @ 0x0
	global	??_I2C_Master_Wait
??_I2C_Master_Wait:	; 0 bytes @ 0x0
	global	?_I2C_write
?_I2C_write:	; 1 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
	global	I2C_write@data
I2C_write@data:	; 1 bytes @ 0x0
	ds	1
	global	??_lcd_send_cmd
??_lcd_send_cmd:	; 0 bytes @ 0x1
	global	??_lcd_send_data
??_lcd_send_data:	; 0 bytes @ 0x1
	ds	2
	global	lcd_send_data@data
lcd_send_data@data:	; 1 bytes @ 0x3
	global	lcd_send_cmd@data
lcd_send_cmd@data:	; 1 bytes @ 0x3
	ds	1
	global	lcd_send_data@data_l
lcd_send_data@data_l:	; 1 bytes @ 0x4
	global	lcd_send_cmd@data_l
lcd_send_cmd@data_l:	; 1 bytes @ 0x4
	ds	1
	global	lcd_send_data@data_u
lcd_send_data@data_u:	; 1 bytes @ 0x5
	global	lcd_send_cmd@data_u
lcd_send_cmd@data_u:	; 1 bytes @ 0x5
	ds	1
	global	??_lcd_init
??_lcd_init:	; 0 bytes @ 0x6
	global	??_lcd_send_string
??_lcd_send_string:	; 0 bytes @ 0x6
	ds	1
	global	lcd_send_string@str
lcd_send_string@str:	; 1 bytes @ 0x7
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x8
;;Data sizes: Strings 12, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      8       8
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; lcd_send_string@str	PTR unsigned char  size(1) Largest target is 12
;;		 -> STR_1(CODE[12]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_lcd_send_string
;;   _lcd_send_string->_lcd_send_data
;;   _lcd_init->_lcd_send_cmd
;;   _lcd_send_data->_I2C_write
;;   _lcd_send_cmd->_I2C_write
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
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0     240
;;                    _I2C_Master_Init
;;                           _lcd_init
;;                    _lcd_send_string
;; ---------------------------------------------------------------------------------
;; (1) _lcd_send_string                                      2     2      0     135
;;                                              6 COMMON     2     2      0
;;                      _lcd_send_data
;; ---------------------------------------------------------------------------------
;; (1) _lcd_init                                             0     0      0     105
;;                       _lcd_send_cmd
;; ---------------------------------------------------------------------------------
;; (2) _lcd_send_data                                        5     5      0     105
;;                                              1 COMMON     5     5      0
;;                          _I2C_start
;;                          _I2C_write
;;                           _I2C_stop
;; ---------------------------------------------------------------------------------
;; (2) _lcd_send_cmd                                         5     5      0     105
;;                                              1 COMMON     5     5      0
;;                          _I2C_start
;;                          _I2C_write
;;                           _I2C_stop
;; ---------------------------------------------------------------------------------
;; (3) _I2C_stop                                             0     0      0       0
;;                    _I2C_Master_Wait
;; ---------------------------------------------------------------------------------
;; (3) _I2C_write                                            1     1      0      15
;;                                              0 COMMON     1     1      0
;;                    _I2C_Master_Wait
;; ---------------------------------------------------------------------------------
;; (3) _I2C_start                                            0     0      0       0
;;                    _I2C_Master_Wait
;; ---------------------------------------------------------------------------------
;; (4) _I2C_Master_Wait                                      0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _I2C_Master_Init                                      0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _I2C_Master_Init
;;   _lcd_init
;;     _lcd_send_cmd
;;       _I2C_start
;;         _I2C_Master_Wait
;;       _I2C_write
;;         _I2C_Master_Wait
;;       _I2C_stop
;;         _I2C_Master_Wait
;;   _lcd_send_string
;;     _lcd_send_data
;;       _I2C_start
;;         _I2C_Master_Wait
;;       _I2C_write
;;         _I2C_Master_Wait
;;       _I2C_stop
;;         _I2C_Master_Wait
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      8       8       1       57.1%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       4       2        0.0%
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
;;		line 18 in file "F:\Basic Microcontroller\PIC16F877A\LCD I2C\lcd i2c.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  700[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_I2C_Master_Init
;;		_lcd_init
;;		_lcd_send_string
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"F:\Basic Microcontroller\PIC16F877A\LCD I2C\lcd i2c.c"
	line	18
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 4
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	19
	
l2758:	
;lcd i2c.c: 19: I2C_Master_Init();
	fcall	_I2C_Master_Init
	line	20
;lcd i2c.c: 20: lcd_init();
	fcall	_lcd_init
	line	21
	
l2760:	
;lcd i2c.c: 21: lcd_send_string ("hello world");
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_lcd_send_string
	goto	l702
	line	22
;lcd i2c.c: 22: while (1)
	
l701:	
	line	24
;lcd i2c.c: 23: {
	
l702:	
	line	22
	goto	l702
	
l703:	
	line	25
	
l704:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_lcd_send_string
psect	text151,local,class=CODE,delta=2
global __ptext151
__ptext151:

;; *************** function _lcd_send_string *****************
;; Defined at:
;;		line 34 in file "F:\Basic Microcontroller\PIC16F877A\LCD I2C\lcd i2c.c"
;; Parameters:    Size  Location     Type
;;  str             1    wreg     PTR unsigned char 
;;		 -> STR_1(12), 
;; Auto vars:     Size  Location     Type
;;  str             1    7[COMMON] PTR unsigned char 
;;		 -> STR_1(12), 
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
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_send_data
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text151
	file	"F:\Basic Microcontroller\PIC16F877A\LCD I2C\lcd i2c.c"
	line	34
	global	__size_of_lcd_send_string
	__size_of_lcd_send_string	equ	__end_of_lcd_send_string-_lcd_send_string
	
_lcd_send_string:	
	opt	stack 4
; Regs used in _lcd_send_string: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;lcd_send_string@str stored from wreg
	movwf	(lcd_send_string@str)
	line	35
	
l2750:	
;lcd i2c.c: 35: while(*str)
	goto	l2756
	
l711:	
	line	36
	
l2752:	
;lcd i2c.c: 36: lcd_send_data(*str++);
	movf	(lcd_send_string@str),w
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_send_data
	
l2754:	
	movlw	(01h)
	movwf	(??_lcd_send_string+0)+0
	movf	(??_lcd_send_string+0)+0,w
	addwf	(lcd_send_string@str),f
	goto	l2756
	
l710:	
	line	35
	
l2756:	
	movf	(lcd_send_string@str),w
	movwf	fsr0
	fcall	stringdir
	iorlw	0
	skipz
	goto	u2281
	goto	u2280
u2281:
	goto	l2752
u2280:
	goto	l713
	
l712:	
	line	37
	
l713:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_send_string
	__end_of_lcd_send_string:
;; =============== function _lcd_send_string ends ============

	signat	_lcd_send_string,4216
	global	_lcd_init
psect	text152,local,class=CODE,delta=2
global __ptext152
__ptext152:

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 27 in file "F:\Basic Microcontroller\PIC16F877A\LCD I2C\lcd i2c.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_send_cmd
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text152
	file	"F:\Basic Microcontroller\PIC16F877A\LCD I2C\lcd i2c.c"
	line	27
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 4
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	28
	
l2748:	
;lcd i2c.c: 28: lcd_send_cmd (0x02);
	movlw	(02h)
	fcall	_lcd_send_cmd
	line	29
;lcd i2c.c: 29: lcd_send_cmd (0x28);
	movlw	(028h)
	fcall	_lcd_send_cmd
	line	30
;lcd i2c.c: 30: lcd_send_cmd (0x0c);
	movlw	(0Ch)
	fcall	_lcd_send_cmd
	line	31
;lcd i2c.c: 31: lcd_send_cmd (0x80);
	movlw	(080h)
	fcall	_lcd_send_cmd
	line	32
	
l707:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
;; =============== function _lcd_init ends ============

	signat	_lcd_init,88
	global	_lcd_send_data
psect	text153,local,class=CODE,delta=2
global __ptext153
__ptext153:

;; *************** function _lcd_send_data *****************
;; Defined at:
;;		line 39 in file "F:\Basic Microcontroller\PIC16F877A\LCD I2C\lcd i2c.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    3[COMMON] unsigned char 
;;  data_u          1    5[COMMON] unsigned char 
;;  data_l          1    4[COMMON] unsigned char 
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
;;      Locals:         3       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_I2C_start
;;		_I2C_write
;;		_I2C_stop
;; This function is called by:
;;		_lcd_send_string
;; This function uses a non-reentrant model
;;
psect	text153
	file	"F:\Basic Microcontroller\PIC16F877A\LCD I2C\lcd i2c.c"
	line	39
	global	__size_of_lcd_send_data
	__size_of_lcd_send_data	equ	__end_of_lcd_send_data-_lcd_send_data
	
_lcd_send_data:	
	opt	stack 4
; Regs used in _lcd_send_data: [wreg+status,2+status,0+pclath+cstack]
;lcd_send_data@data stored from wreg
	line	41
	movwf	(lcd_send_data@data)
	
l2730:	
;lcd i2c.c: 40: unsigned char data_l, data_u;
;lcd i2c.c: 41: data_l = (data<<4)&0xf0;
	movf	(lcd_send_data@data),w
	movwf	(??_lcd_send_data+0)+0
	movlw	(04h)-1
u2275:
	clrc
	rlf	(??_lcd_send_data+0)+0,f
	addlw	-1
	skipz
	goto	u2275
	clrc
	rlf	(??_lcd_send_data+0)+0,w
	andlw	0F0h
	movwf	(??_lcd_send_data+1)+0
	movf	(??_lcd_send_data+1)+0,w
	movwf	(lcd_send_data@data_l)
	line	42
	
l2732:	
;lcd i2c.c: 42: data_u = data&0xf0;
	movf	(lcd_send_data@data),w
	andlw	0F0h
	movwf	(??_lcd_send_data+0)+0
	movf	(??_lcd_send_data+0)+0,w
	movwf	(lcd_send_data@data_u)
	line	44
	
l2734:	
;lcd i2c.c: 44: I2C_start();
	fcall	_I2C_start
	line	45
	
l2736:	
;lcd i2c.c: 45: I2C_write (0X4E);
	movlw	(04Eh)
	fcall	_I2C_write
	line	46
	
l2738:	
;lcd i2c.c: 46: I2C_write (data_u|0x0D);
	movf	(lcd_send_data@data_u),w
	iorlw	0Dh
	fcall	_I2C_write
	line	47
	
l2740:	
;lcd i2c.c: 47: I2C_write (data_u|0x09);
	movf	(lcd_send_data@data_u),w
	iorlw	09h
	fcall	_I2C_write
	line	49
	
l2742:	
;lcd i2c.c: 49: I2C_write (data_l|0x0D);
	movf	(lcd_send_data@data_l),w
	iorlw	0Dh
	fcall	_I2C_write
	line	50
	
l2744:	
;lcd i2c.c: 50: I2C_write (data_l|0x09);
	movf	(lcd_send_data@data_l),w
	iorlw	09h
	fcall	_I2C_write
	line	52
	
l2746:	
;lcd i2c.c: 52: I2C_stop();
	fcall	_I2C_stop
	line	53
	
l716:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_send_data
	__end_of_lcd_send_data:
;; =============== function _lcd_send_data ends ============

	signat	_lcd_send_data,4216
	global	_lcd_send_cmd
psect	text154,local,class=CODE,delta=2
global __ptext154
__ptext154:

;; *************** function _lcd_send_cmd *****************
;; Defined at:
;;		line 55 in file "F:\Basic Microcontroller\PIC16F877A\LCD I2C\lcd i2c.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    3[COMMON] unsigned char 
;;  data_u          1    5[COMMON] unsigned char 
;;  data_l          1    4[COMMON] unsigned char 
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
;;      Locals:         3       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_I2C_start
;;		_I2C_write
;;		_I2C_stop
;; This function is called by:
;;		_lcd_init
;; This function uses a non-reentrant model
;;
psect	text154
	file	"F:\Basic Microcontroller\PIC16F877A\LCD I2C\lcd i2c.c"
	line	55
	global	__size_of_lcd_send_cmd
	__size_of_lcd_send_cmd	equ	__end_of_lcd_send_cmd-_lcd_send_cmd
	
_lcd_send_cmd:	
	opt	stack 4
; Regs used in _lcd_send_cmd: [wreg+status,2+status,0+pclath+cstack]
;lcd_send_cmd@data stored from wreg
	line	57
	movwf	(lcd_send_cmd@data)
	
l2712:	
;lcd i2c.c: 56: unsigned char data_l, data_u;
;lcd i2c.c: 57: data_l = (data<<4)&0xf0;
	movf	(lcd_send_cmd@data),w
	movwf	(??_lcd_send_cmd+0)+0
	movlw	(04h)-1
u2265:
	clrc
	rlf	(??_lcd_send_cmd+0)+0,f
	addlw	-1
	skipz
	goto	u2265
	clrc
	rlf	(??_lcd_send_cmd+0)+0,w
	andlw	0F0h
	movwf	(??_lcd_send_cmd+1)+0
	movf	(??_lcd_send_cmd+1)+0,w
	movwf	(lcd_send_cmd@data_l)
	line	58
	
l2714:	
;lcd i2c.c: 58: data_u = data&0xf0;
	movf	(lcd_send_cmd@data),w
	andlw	0F0h
	movwf	(??_lcd_send_cmd+0)+0
	movf	(??_lcd_send_cmd+0)+0,w
	movwf	(lcd_send_cmd@data_u)
	line	60
	
l2716:	
;lcd i2c.c: 60: I2C_start();
	fcall	_I2C_start
	line	61
	
l2718:	
;lcd i2c.c: 61: I2C_write (0X4E);
	movlw	(04Eh)
	fcall	_I2C_write
	line	62
	
l2720:	
;lcd i2c.c: 62: I2C_write (data_u|0x0C);
	movf	(lcd_send_cmd@data_u),w
	iorlw	0Ch
	fcall	_I2C_write
	line	63
	
l2722:	
;lcd i2c.c: 63: I2C_write (data_u|0x08);
	movf	(lcd_send_cmd@data_u),w
	iorlw	08h
	fcall	_I2C_write
	line	65
	
l2724:	
;lcd i2c.c: 65: I2C_write (data_l|0x0C);
	movf	(lcd_send_cmd@data_l),w
	iorlw	0Ch
	fcall	_I2C_write
	line	66
	
l2726:	
;lcd i2c.c: 66: I2C_write (data_l|0x08);
	movf	(lcd_send_cmd@data_l),w
	iorlw	08h
	fcall	_I2C_write
	line	68
	
l2728:	
;lcd i2c.c: 68: I2C_stop();
	fcall	_I2C_stop
	line	69
	
l719:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_send_cmd
	__end_of_lcd_send_cmd:
;; =============== function _lcd_send_cmd ends ============

	signat	_lcd_send_cmd,4216
	global	_I2C_stop
psect	text155,local,class=CODE,delta=2
global __ptext155
__ptext155:

;; *************** function _I2C_stop *****************
;; Defined at:
;;		line 98 in file "F:\Basic Microcontroller\PIC16F877A\LCD I2C\lcd i2c.c"
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
;;		_I2C_Master_Wait
;; This function is called by:
;;		_lcd_send_data
;;		_lcd_send_cmd
;; This function uses a non-reentrant model
;;
psect	text155
	file	"F:\Basic Microcontroller\PIC16F877A\LCD I2C\lcd i2c.c"
	line	98
	global	__size_of_I2C_stop
	__size_of_I2C_stop	equ	__end_of_I2C_stop-_I2C_stop
	
_I2C_stop:	
	opt	stack 4
; Regs used in _I2C_stop: [wreg+status,2+status,0+pclath+cstack]
	line	99
	
l2708:	
;lcd i2c.c: 99: I2C_Master_Wait();
	fcall	_I2C_Master_Wait
	line	100
	
l2710:	
;lcd i2c.c: 100: PEN = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1162/8)^080h,(1162)&7
	line	101
	
l737:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_stop
	__end_of_I2C_stop:
;; =============== function _I2C_stop ends ============

	signat	_I2C_stop,88
	global	_I2C_write
psect	text156,local,class=CODE,delta=2
global __ptext156
__ptext156:

;; *************** function _I2C_write *****************
;; Defined at:
;;		line 117 in file "F:\Basic Microcontroller\PIC16F877A\LCD I2C\lcd i2c.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
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
;;		_I2C_Master_Wait
;; This function is called by:
;;		_lcd_send_data
;;		_lcd_send_cmd
;; This function uses a non-reentrant model
;;
psect	text156
	file	"F:\Basic Microcontroller\PIC16F877A\LCD I2C\lcd i2c.c"
	line	117
	global	__size_of_I2C_write
	__size_of_I2C_write	equ	__end_of_I2C_write-_I2C_write
	
_I2C_write:	
	opt	stack 4
; Regs used in _I2C_write: [wreg+status,2+status,0+pclath+cstack]
;I2C_write@data stored from wreg
	movwf	(I2C_write@data)
	line	118
	
l2704:	
;lcd i2c.c: 118: I2C_Master_Wait();
	fcall	_I2C_Master_Wait
	line	119
	
l2706:	
;lcd i2c.c: 119: SSPBUF = data;
	movf	(I2C_write@data),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(19)	;volatile
	line	120
;lcd i2c.c: 120: while(!SSPIF);
	goto	l746
	
l747:	
	
l746:	
	btfss	(99/8),(99)&7
	goto	u2251
	goto	u2250
u2251:
	goto	l746
u2250:
	
l748:	
	line	121
;lcd i2c.c: 121: SSPIF = 0;
	bcf	(99/8),(99)&7
	line	122
;lcd i2c.c: 122: return ACKSTAT;
;	Return value of _I2C_write is never used
	line	123
	
l749:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_write
	__end_of_I2C_write:
;; =============== function _I2C_write ends ============

	signat	_I2C_write,4217
	global	_I2C_start
psect	text157,local,class=CODE,delta=2
global __ptext157
__ptext157:

;; *************** function _I2C_start *****************
;; Defined at:
;;		line 86 in file "F:\Basic Microcontroller\PIC16F877A\LCD I2C\lcd i2c.c"
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
;;		_I2C_Master_Wait
;; This function is called by:
;;		_lcd_send_data
;;		_lcd_send_cmd
;; This function uses a non-reentrant model
;;
psect	text157
	file	"F:\Basic Microcontroller\PIC16F877A\LCD I2C\lcd i2c.c"
	line	86
	global	__size_of_I2C_start
	__size_of_I2C_start	equ	__end_of_I2C_start-_I2C_start
	
_I2C_start:	
	opt	stack 4
; Regs used in _I2C_start: [wreg+status,2+status,0+pclath+cstack]
	line	87
	
l2700:	
;lcd i2c.c: 87: I2C_Master_Wait();
	fcall	_I2C_Master_Wait
	line	88
	
l2702:	
;lcd i2c.c: 88: SEN = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1160/8)^080h,(1160)&7
	line	89
	
l731:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_start
	__end_of_I2C_start:
;; =============== function _I2C_start ends ============

	signat	_I2C_start,88
	global	_I2C_Master_Wait
psect	text158,local,class=CODE,delta=2
global __ptext158
__ptext158:

;; *************** function _I2C_Master_Wait *****************
;; Defined at:
;;		line 81 in file "F:\Basic Microcontroller\PIC16F877A\LCD I2C\lcd i2c.c"
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
;;		_I2C_start
;;		_I2C_stop
;;		_I2C_write
;;		_I2C_Master_RepeatedStart
;;		_I2C_ACK
;;		_I2C_NACK
;;		_I2C_Read_Byte
;; This function uses a non-reentrant model
;;
psect	text158
	file	"F:\Basic Microcontroller\PIC16F877A\LCD I2C\lcd i2c.c"
	line	81
	global	__size_of_I2C_Master_Wait
	__size_of_I2C_Master_Wait	equ	__end_of_I2C_Master_Wait-_I2C_Master_Wait
	
_I2C_Master_Wait:	
	opt	stack 4
; Regs used in _I2C_Master_Wait: [wreg+status,2]
	line	82
	
l1812:	
;lcd i2c.c: 82: while ((SSPSTAT & 0x04) || (SSPCON2 & 0x1F));
	goto	l725
	
l726:	
	
l725:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfsc	(148)^080h,(2)&7
	goto	u11
	goto	u10
u11:
	goto	l725
u10:
	
l1814:	
	movf	(145)^080h,w
	andlw	01Fh
	btfss	status,2
	goto	u21
	goto	u20
u21:
	goto	l725
u20:
	goto	l728
	
l727:	
	line	83
	
l728:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Master_Wait
	__end_of_I2C_Master_Wait:
;; =============== function _I2C_Master_Wait ends ============

	signat	_I2C_Master_Wait,88
	global	_I2C_Master_Init
psect	text159,local,class=CODE,delta=2
global __ptext159
__ptext159:

;; *************** function _I2C_Master_Init *****************
;; Defined at:
;;		line 71 in file "F:\Basic Microcontroller\PIC16F877A\LCD I2C\lcd i2c.c"
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text159
	file	"F:\Basic Microcontroller\PIC16F877A\LCD I2C\lcd i2c.c"
	line	71
	global	__size_of_I2C_Master_Init
	__size_of_I2C_Master_Init	equ	__end_of_I2C_Master_Init-_I2C_Master_Init
	
_I2C_Master_Init:	
	opt	stack 7
; Regs used in _I2C_Master_Init: [wreg+status,2]
	line	72
	
l1802:	
;lcd i2c.c: 72: SSPCON = 0x28;
	movlw	(028h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	73
	
l1804:	
;lcd i2c.c: 73: SSPCON2 = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(145)^080h	;volatile
	line	74
	
l1806:	
;lcd i2c.c: 74: SSPSTAT = 0x00;
	clrf	(148)^080h	;volatile
	line	75
;lcd i2c.c: 75: SSPADD = ((20000000/4)/100000) - 1;
	movlw	(031h)
	movwf	(147)^080h	;volatile
	line	76
	
l1808:	
;lcd i2c.c: 76: TRISC3 = 1;
	bsf	(1083/8)^080h,(1083)&7
	line	77
	
l1810:	
;lcd i2c.c: 77: TRISC4 = 1;
	bsf	(1084/8)^080h,(1084)&7
	line	78
	
l722:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Master_Init
	__end_of_I2C_Master_Init:
;; =============== function _I2C_Master_Init ends ============

	signat	_I2C_Master_Init,88
psect	text160,local,class=CODE,delta=2
global __ptext160
__ptext160:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
