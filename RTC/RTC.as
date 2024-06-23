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
	FNCALL	_main,_string
	FNCALL	_main,_cmd
	FNCALL	_main,_delay
	FNCALL	_main,_I2C_Master_Init
	FNCALL	_main,_I2C_start
	FNCALL	_main,_I2C_write
	FNCALL	_main,_I2C_stop
	FNCALL	_main,_rtc_read
	FNCALL	_main,_up
	FNCALL	_main,_data
	FNCALL	_main,_lo
	FNCALL	_rtc_read,_I2C_start
	FNCALL	_rtc_read,_I2C_write
	FNCALL	_rtc_read,_I2C_stop
	FNCALL	_rtc_read,_I2C_restart
	FNCALL	_rtc_read,_I2C_Read_Byte
	FNCALL	_string,_data
	FNCALL	_lcd_init,_cmd
	FNCALL	_data,_delay
	FNCALL	_cmd,_delay
	FNCALL	_I2C_Read_Byte,_I2C_Master_Wait
	FNCALL	_I2C_write,_I2C_Master_Wait
	FNCALL	_I2C_stop,_I2C_Master_Wait
	FNCALL	_I2C_restart,_I2C_Master_Wait
	FNCALL	_I2C_start,_I2C_Master_Wait
	FNROOT	_main
	global	_date
	global	_hour
	global	_month
	global	_year
	global	_min
	global	_sec
	global	_PORTD
psect	text376,local,class=CODE,delta=2
global __ptext376
__ptext376:
_PORTD	set	8
	global	_SSPBUF
_SSPBUF	set	19
	global	_SSPCON
_SSPCON	set	20
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_RB0
_RB0	set	48
	global	_RB1
_RB1	set	49
	global	_RB2
_RB2	set	50
	global	_SSPIF
_SSPIF	set	99
	global	_SSPADD
_SSPADD	set	147
	global	_SSPCON2
_SSPCON2	set	145
	global	_SSPSTAT
_SSPSTAT	set	148
	global	_TRISB
_TRISB	set	134
	global	_TRISD
_TRISD	set	136
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
	
STR_2:	
	retlw	65	;'A'
	retlw	82	;'R'
	retlw	65	;'A'
	retlw	86	;'V'
	retlw	73	;'I'
	retlw	78	;'N'
	retlw	84	;'T'
	retlw	72	;'H'
	retlw	0
psect	strings
	
STR_1:	
	retlw	87	;'W'
	retlw	69	;'E'
	retlw	76	;'L'
	retlw	67	;'C'
	retlw	79	;'O'
	retlw	77	;'M'
	retlw	69	;'E'
	retlw	0
psect	strings
	
STR_3:	
	retlw	84	;'T'
	retlw	105	;'i'
	retlw	109	;'m'
	retlw	101	;'e'
	retlw	0
psect	strings
	
STR_4:	
	retlw	68	;'D'
	retlw	97	;'a'
	retlw	116	;'t'
	retlw	101	;'e'
	retlw	0
psect	strings
	file	"RTC.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_min:
       ds      1

_sec:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_date:
       ds      1

_hour:
       ds      1

_month:
       ds      1

_year:
       ds      1

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_lcd_init
?_lcd_init:	; 0 bytes @ 0x0
	global	?_string
?_string:	; 0 bytes @ 0x0
	global	?_cmd
?_cmd:	; 0 bytes @ 0x0
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	?_data
?_data:	; 0 bytes @ 0x0
	global	??_up
??_up:	; 0 bytes @ 0x0
	global	??_lo
??_lo:	; 0 bytes @ 0x0
	global	?_I2C_Master_Init
?_I2C_Master_Init:	; 0 bytes @ 0x0
	global	??_I2C_Master_Init
??_I2C_Master_Init:	; 0 bytes @ 0x0
	global	?_I2C_Master_Wait
?_I2C_Master_Wait:	; 0 bytes @ 0x0
	global	??_I2C_Master_Wait
??_I2C_Master_Wait:	; 0 bytes @ 0x0
	global	?_I2C_start
?_I2C_start:	; 0 bytes @ 0x0
	global	??_I2C_start
??_I2C_start:	; 0 bytes @ 0x0
	global	?_I2C_restart
?_I2C_restart:	; 0 bytes @ 0x0
	global	??_I2C_restart
??_I2C_restart:	; 0 bytes @ 0x0
	global	?_I2C_stop
?_I2C_stop:	; 0 bytes @ 0x0
	global	??_I2C_stop
??_I2C_stop:	; 0 bytes @ 0x0
	global	??_I2C_write
??_I2C_write:	; 0 bytes @ 0x0
	global	??_I2C_Read_Byte
??_I2C_Read_Byte:	; 0 bytes @ 0x0
	global	?_rtc_read
?_rtc_read:	; 1 bytes @ 0x0
	global	?_up
?_up:	; 1 bytes @ 0x0
	global	?_lo
?_lo:	; 1 bytes @ 0x0
	global	?_I2C_write
?_I2C_write:	; 1 bytes @ 0x0
	global	?_I2C_Read_Byte
?_I2C_Read_Byte:	; 1 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
	global	I2C_write@data
I2C_write@data:	; 1 bytes @ 0x0
	global	delay@a
delay@a:	; 2 bytes @ 0x0
	ds	1
	global	??_rtc_read
??_rtc_read:	; 0 bytes @ 0x1
	global	lo@bcd
lo@bcd:	; 1 bytes @ 0x1
	ds	1
	global	??_delay
??_delay:	; 0 bytes @ 0x2
	global	up@bcd
up@bcd:	; 1 bytes @ 0x2
	global	lo@temp
lo@temp:	; 1 bytes @ 0x2
	global	rtc_read@address
rtc_read@address:	; 1 bytes @ 0x2
	ds	1
	global	up@temp
up@temp:	; 1 bytes @ 0x3
	global	rtc_read@temp
rtc_read@temp:	; 1 bytes @ 0x3
	global	delay@i
delay@i:	; 2 bytes @ 0x3
	ds	2
	global	delay@j
delay@j:	; 2 bytes @ 0x5
	ds	2
	global	??_cmd
??_cmd:	; 0 bytes @ 0x7
	global	??_data
??_data:	; 0 bytes @ 0x7
	global	cmd@ch
cmd@ch:	; 1 bytes @ 0x7
	global	data@ch
data@ch:	; 1 bytes @ 0x7
	ds	1
	global	??_lcd_init
??_lcd_init:	; 0 bytes @ 0x8
	global	??_string
??_string:	; 0 bytes @ 0x8
	global	string@str
string@str:	; 1 bytes @ 0x8
	ds	1
	global	string@k
string@k:	; 2 bytes @ 0x9
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0xB
	ds	1
;;Data sizes: Strings 27, constant 0, data 0, bss 6, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     12      14
;; BANK0           80      0       4
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; string@str	PTR unsigned char  size(1) Largest target is 9
;;		 -> STR_4(CODE[5]), STR_3(CODE[5]), STR_2(CODE[9]), STR_1(CODE[8]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_string
;;   _rtc_read->_I2C_write
;;   _string->_data
;;   _lcd_init->_cmd
;;   _data->_delay
;;   _cmd->_delay
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
;; (0) _main                                                 1     1      0     863
;;                                             11 COMMON     1     1      0
;;                           _lcd_init
;;                             _string
;;                                _cmd
;;                              _delay
;;                    _I2C_Master_Init
;;                          _I2C_start
;;                          _I2C_write
;;                           _I2C_stop
;;                           _rtc_read
;;                                 _up
;;                               _data
;;                                 _lo
;; ---------------------------------------------------------------------------------
;; (1) _rtc_read                                             3     3      0      67
;;                                              1 COMMON     3     3      0
;;                          _I2C_start
;;                          _I2C_write
;;                           _I2C_stop
;;                        _I2C_restart
;;                      _I2C_Read_Byte
;; ---------------------------------------------------------------------------------
;; (1) _string                                               3     3      0     204
;;                                              8 COMMON     3     3      0
;;                               _data
;; ---------------------------------------------------------------------------------
;; (1) _lcd_init                                             0     0      0     114
;;                                _cmd
;; ---------------------------------------------------------------------------------
;; (1) _data                                                 1     1      0     114
;;                                              7 COMMON     1     1      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (1) _cmd                                                  1     1      0     114
;;                                              7 COMMON     1     1      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (2) _I2C_Read_Byte                                        0     0      0       0
;;                    _I2C_Master_Wait
;; ---------------------------------------------------------------------------------
;; (2) _I2C_write                                            1     1      0      22
;;                                              0 COMMON     1     1      0
;;                    _I2C_Master_Wait
;; ---------------------------------------------------------------------------------
;; (2) _I2C_stop                                             0     0      0       0
;;                    _I2C_Master_Wait
;; ---------------------------------------------------------------------------------
;; (2) _I2C_restart                                          0     0      0       0
;;                    _I2C_Master_Wait
;; ---------------------------------------------------------------------------------
;; (2) _I2C_start                                            0     0      0       0
;;                    _I2C_Master_Wait
;; ---------------------------------------------------------------------------------
;; (1) _lo                                                   3     3      0      68
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (1) _up                                                   4     4      0      68
;;                                              0 COMMON     4     4      0
;; ---------------------------------------------------------------------------------
;; (2) _delay                                                7     5      2      92
;;                                              0 COMMON     7     5      2
;; ---------------------------------------------------------------------------------
;; (3) _I2C_Master_Wait                                      0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _I2C_Master_Init                                      0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _lcd_init
;;     _cmd
;;       _delay
;;   _string
;;     _data
;;       _delay
;;   _cmd
;;     _delay
;;   _delay
;;   _I2C_Master_Init
;;   _I2C_start
;;     _I2C_Master_Wait
;;   _I2C_write
;;     _I2C_Master_Wait
;;   _I2C_stop
;;     _I2C_Master_Wait
;;   _rtc_read
;;     _I2C_start
;;       _I2C_Master_Wait
;;     _I2C_write
;;       _I2C_Master_Wait
;;     _I2C_stop
;;       _I2C_Master_Wait
;;     _I2C_restart
;;       _I2C_Master_Wait
;;     _I2C_Read_Byte
;;       _I2C_Master_Wait
;;   _up
;;   _data
;;     _delay
;;   _lo
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      C       E       1      100.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       3       2        0.0%
;;ABS                  0      0      12       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      0       4       5        5.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      15      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 26 in file "C:\Users\ELCOT\Desktop\PIC16 RTC\rtc.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  751[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_init
;;		_string
;;		_cmd
;;		_delay
;;		_I2C_Master_Init
;;		_I2C_start
;;		_I2C_write
;;		_I2C_stop
;;		_rtc_read
;;		_up
;;		_data
;;		_lo
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\ELCOT\Desktop\PIC16 RTC\rtc.c"
	line	26
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	27
	
l3052:	
;rtc.c: 27: TRISD=0X00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	28
;rtc.c: 28: TRISB=0X00;
	clrf	(134)^080h	;volatile
	line	29
	
l3054:	
;rtc.c: 29: lcd_init();
	fcall	_lcd_init
	line	30
	
l3056:	
;rtc.c: 30: string("WELCOME");
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_string
	line	31
	
l3058:	
;rtc.c: 31: cmd(0xc0);
	movlw	(0C0h)
	fcall	_cmd
	line	32
	
l3060:	
;rtc.c: 32: string("ARAVINTH");
	movlw	((STR_2-__stringbase))&0ffh
	fcall	_string
	line	33
	
l3062:	
;rtc.c: 33: delay(200);
	movlw	low(0C8h)
	movwf	(?_delay)
	movlw	high(0C8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	34
	
l3064:	
;rtc.c: 34: cmd(0x01);
	movlw	(01h)
	fcall	_cmd
	line	35
	
l3066:	
;rtc.c: 35: I2C_Master_Init();
	fcall	_I2C_Master_Init
	line	36
	
l3068:	
;rtc.c: 36: delay(100);
	movlw	low(064h)
	movwf	(?_delay)
	movlw	high(064h)
	movwf	((?_delay))+1
	fcall	_delay
	line	37
	
l3070:	
;rtc.c: 37: I2C_start();
	fcall	_I2C_start
	line	38
	
l3072:	
;rtc.c: 38: I2C_write(0XD0);
	movlw	(0D0h)
	fcall	_I2C_write
	line	39
	
l3074:	
;rtc.c: 39: I2C_write(0X00);
	movlw	(0)
	fcall	_I2C_write
	line	40
	
l3076:	
;rtc.c: 40: I2C_write(0X80);
	movlw	(080h)
	fcall	_I2C_write
	line	41
	
l3078:	
;rtc.c: 41: I2C_write(0X59);
	movlw	(059h)
	fcall	_I2C_write
	line	42
	
l3080:	
;rtc.c: 42: I2C_write(0X24);
	movlw	(024h)
	fcall	_I2C_write
	line	43
	
l3082:	
;rtc.c: 43: I2C_write(0X01);
	movlw	(01h)
	fcall	_I2C_write
	line	44
	
l3084:	
;rtc.c: 44: I2C_write(0X16);
	movlw	(016h)
	fcall	_I2C_write
	line	45
	
l3086:	
;rtc.c: 45: I2C_write(0X03);
	movlw	(03h)
	fcall	_I2C_write
	line	46
	
l3088:	
;rtc.c: 46: I2C_write(0X20);
	movlw	(020h)
	fcall	_I2C_write
	line	47
	
l3090:	
;rtc.c: 47: I2C_stop();
	fcall	_I2C_stop
	line	48
	
l3092:	
;rtc.c: 48: delay(100);
	movlw	low(064h)
	movwf	(?_delay)
	movlw	high(064h)
	movwf	((?_delay))+1
	fcall	_delay
	line	49
	
l3094:	
;rtc.c: 49: I2C_start();
	fcall	_I2C_start
	line	50
	
l3096:	
;rtc.c: 50: I2C_write(0XD0);
	movlw	(0D0h)
	fcall	_I2C_write
	line	51
	
l3098:	
;rtc.c: 51: I2C_write(0X00);
	movlw	(0)
	fcall	_I2C_write
	line	52
	
l3100:	
;rtc.c: 52: I2C_write(0X05);
	movlw	(05h)
	fcall	_I2C_write
	line	54
	
l3102:	
;rtc.c: 54: I2C_stop();
	fcall	_I2C_stop
	line	55
	
l3104:	
;rtc.c: 55: delay(100);
	movlw	low(064h)
	movwf	(?_delay)
	movlw	high(064h)
	movwf	((?_delay))+1
	fcall	_delay
	goto	l3106
	line	56
;rtc.c: 56: while (1)
	
l752:	
	line	58
	
l3106:	
;rtc.c: 57: {
;rtc.c: 58: sec=rtc_read(0x00);
	movlw	(0)
	fcall	_rtc_read
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_sec)
	line	59
	
l3108:	
;rtc.c: 59: min=rtc_read(0x01);
	movlw	(01h)
	fcall	_rtc_read
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_min)
	line	60
	
l3110:	
;rtc.c: 60: hour=rtc_read(0x02);
	movlw	(02h)
	fcall	_rtc_read
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_hour)
	line	61
	
l3112:	
;rtc.c: 61: date=rtc_read(0x04);
	movlw	(04h)
	fcall	_rtc_read
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_date)
	line	62
	
l3114:	
;rtc.c: 62: month=rtc_read(0x05);
	movlw	(05h)
	fcall	_rtc_read
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_month)
	line	63
	
l3116:	
;rtc.c: 63: year=rtc_read(0x06);
	movlw	(06h)
	fcall	_rtc_read
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_year)
	line	65
	
l3118:	
;rtc.c: 65: cmd(0x80);
	movlw	(080h)
	fcall	_cmd
	line	66
	
l3120:	
;rtc.c: 66: string("Time");
	movlw	((STR_3-__stringbase))&0ffh
	fcall	_string
	line	67
	
l3122:	
;rtc.c: 67: cmd(0x85);
	movlw	(085h)
	fcall	_cmd
	line	68
	
l3124:	
;rtc.c: 68: data(up(date));
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_date),w
	fcall	_up
	fcall	_data
	line	69
	
l3126:	
;rtc.c: 69: data(lo(date));
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_date),w
	fcall	_lo
	fcall	_data
	line	70
	
l3128:	
;rtc.c: 70: data(':');
	movlw	(03Ah)
	fcall	_data
	line	71
	
l3130:	
;rtc.c: 71: data(up(hour));
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_hour),w
	fcall	_up
	fcall	_data
	line	72
	
l3132:	
;rtc.c: 72: data(lo(hour));
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_hour),w
	fcall	_lo
	fcall	_data
	line	73
	
l3134:	
;rtc.c: 73: data(':');
	movlw	(03Ah)
	fcall	_data
	line	74
	
l3136:	
;rtc.c: 74: data(up(min));
	movf	(_min),w
	fcall	_up
	fcall	_data
	line	75
	
l3138:	
;rtc.c: 75: data(lo(min));
	movf	(_min),w
	fcall	_lo
	fcall	_data
	line	76
	
l3140:	
;rtc.c: 76: cmd(0xc0);
	movlw	(0C0h)
	fcall	_cmd
	line	77
	
l3142:	
;rtc.c: 77: string("Date");
	movlw	((STR_4-__stringbase))&0ffh
	fcall	_string
	line	78
	
l3144:	
;rtc.c: 78: cmd(0xc5);
	movlw	(0C5h)
	fcall	_cmd
	line	79
	
l3146:	
;rtc.c: 79: data(up(month));
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_month),w
	fcall	_up
	fcall	_data
	line	80
	
l3148:	
;rtc.c: 80: data(lo(month));
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_month),w
	fcall	_lo
	fcall	_data
	line	81
	
l3150:	
;rtc.c: 81: data('/');
	movlw	(02Fh)
	fcall	_data
	line	82
	
l3152:	
;rtc.c: 82: data(up(year));
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_year),w
	fcall	_up
	fcall	_data
	line	83
	
l3154:	
;rtc.c: 83: data(lo(year));
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_year),w
	fcall	_lo
	fcall	_data
	line	84
	
l3156:	
;rtc.c: 84: data('/');
	movlw	(02Fh)
	fcall	_data
	line	85
	
l3158:	
;rtc.c: 85: data(up(sec));
	movf	(_sec),w
	fcall	_up
	fcall	_data
	line	86
	
l3160:	
;rtc.c: 86: data(lo(sec));
	movf	(_sec),w
	fcall	_lo
	fcall	_data
	line	87
	
l3162:	
;rtc.c: 87: delay(200);
	movlw	low(0C8h)
	movwf	(?_delay)
	movlw	high(0C8h)
	movwf	((?_delay))+1
	fcall	_delay
	goto	l3106
	line	88
	
l753:	
	line	56
	goto	l3106
	
l754:	
	line	89
	
l755:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_rtc_read
psect	text377,local,class=CODE,delta=2
global __ptext377
__ptext377:

;; *************** function _rtc_read *****************
;; Defined at:
;;		line 109 in file "C:\Users\ELCOT\Desktop\PIC16 RTC\rtc.c"
;; Parameters:    Size  Location     Type
;;  address         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  address         1    2[COMMON] unsigned char 
;;  temp            1    3[COMMON] unsigned char 
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
;;      Locals:         2       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_I2C_start
;;		_I2C_write
;;		_I2C_stop
;;		_I2C_restart
;;		_I2C_Read_Byte
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text377
	file	"C:\Users\ELCOT\Desktop\PIC16 RTC\rtc.c"
	line	109
	global	__size_of_rtc_read
	__size_of_rtc_read	equ	__end_of_rtc_read-_rtc_read
	
_rtc_read:	
	opt	stack 5
; Regs used in _rtc_read: [wreg+status,2+status,0+pclath+cstack]
;rtc_read@address stored from wreg
	line	111
	movwf	(rtc_read@address)
	
l3046:	
;rtc.c: 110: unsigned char temp;
;rtc.c: 111: I2C_start();
	fcall	_I2C_start
	line	112
;rtc.c: 112: I2C_write(0XD0);
	movlw	(0D0h)
	fcall	_I2C_write
	line	113
;rtc.c: 113: I2C_write(address);
	movf	(rtc_read@address),w
	fcall	_I2C_write
	line	114
;rtc.c: 114: I2C_stop();
	fcall	_I2C_stop
	line	115
;rtc.c: 115: I2C_start();
	fcall	_I2C_start
	line	116
;rtc.c: 116: I2C_restart();
	fcall	_I2C_restart
	line	117
;rtc.c: 117: I2C_write(0XD1);
	movlw	(0D1h)
	fcall	_I2C_write
	line	118
;rtc.c: 118: temp=I2C_Read_Byte();
	fcall	_I2C_Read_Byte
	movwf	(??_rtc_read+0)+0
	movf	(??_rtc_read+0)+0,w
	movwf	(rtc_read@temp)
	line	119
;rtc.c: 119: I2C_stop();
	fcall	_I2C_stop
	line	120
	
l3048:	
;rtc.c: 120: return temp;
	movf	(rtc_read@temp),w
	goto	l764
	
l3050:	
	line	121
	
l764:	
	return
	opt stack 0
GLOBAL	__end_of_rtc_read
	__end_of_rtc_read:
;; =============== function _rtc_read ends ============

	signat	_rtc_read,4217
	global	_string
psect	text378,local,class=CODE,delta=2
global __ptext378
__ptext378:

;; *************** function _string *****************
;; Defined at:
;;		line 148 in file "C:\Users\ELCOT\Desktop\PIC16 RTC\rtc.c"
;; Parameters:    Size  Location     Type
;;  str             1    wreg     PTR unsigned char 
;;		 -> STR_4(5), STR_3(5), STR_2(9), STR_1(8), 
;; Auto vars:     Size  Location     Type
;;  str             1    8[COMMON] PTR unsigned char 
;;		 -> STR_4(5), STR_3(5), STR_2(9), STR_1(8), 
;;  k               2    9[COMMON] int 
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
;;      Locals:         3       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_data
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text378
	file	"C:\Users\ELCOT\Desktop\PIC16 RTC\rtc.c"
	line	148
	global	__size_of_string
	__size_of_string	equ	__end_of_string-_string
	
_string:	
	opt	stack 5
; Regs used in _string: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
;string@str stored from wreg
	movwf	(string@str)
	line	149
	
l3038:	
;rtc.c: 149: int k=0;
	clrf	(string@k)
	clrf	(string@k+1)
	line	150
;rtc.c: 150: while(str[k]!='\0')
	goto	l3044
	
l777:	
	line	152
	
l3040:	
;rtc.c: 151: {
;rtc.c: 152: data(str[k]);
	movf	(string@k),w
	addwf	(string@str),w
	movwf	fsr0
	fcall	stringdir
	fcall	_data
	line	153
	
l3042:	
;rtc.c: 153: k++;
	movlw	low(01h)
	addwf	(string@k),f
	skipnc
	incf	(string@k+1),f
	movlw	high(01h)
	addwf	(string@k+1),f
	goto	l3044
	line	154
	
l776:	
	line	150
	
l3044:	
	movf	(string@k),w
	addwf	(string@str),w
	movwf	fsr0
	fcall	stringdir
	iorlw	0
	skipz
	goto	u2391
	goto	u2390
u2391:
	goto	l3040
u2390:
	goto	l779
	
l778:	
	line	155
	
l779:	
	return
	opt stack 0
GLOBAL	__end_of_string
	__end_of_string:
;; =============== function _string ends ============

	signat	_string,4216
	global	_lcd_init
psect	text379,local,class=CODE,delta=2
global __ptext379
__ptext379:

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 123 in file "C:\Users\ELCOT\Desktop\PIC16 RTC\rtc.c"
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
psect	text379
	file	"C:\Users\ELCOT\Desktop\PIC16 RTC\rtc.c"
	line	123
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 5
; Regs used in _lcd_init: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	124
	
l3036:	
;rtc.c: 124: cmd(0x38);
	movlw	(038h)
	fcall	_cmd
	line	125
;rtc.c: 125: cmd(0x0c);
	movlw	(0Ch)
	fcall	_cmd
	line	126
;rtc.c: 126: cmd(0x01);
	movlw	(01h)
	fcall	_cmd
	line	127
;rtc.c: 127: cmd(0x80);
	movlw	(080h)
	fcall	_cmd
	line	128
	
l767:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
;; =============== function _lcd_init ends ============

	signat	_lcd_init,88
	global	_data
psect	text380,local,class=CODE,delta=2
global __ptext380
__ptext380:

;; *************** function _data *****************
;; Defined at:
;;		line 139 in file "C:\Users\ELCOT\Desktop\PIC16 RTC\rtc.c"
;; Parameters:    Size  Location     Type
;;  ch              1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  ch              1    7[COMMON] unsigned char 
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
;;		_string
;; This function uses a non-reentrant model
;;
psect	text380
	file	"C:\Users\ELCOT\Desktop\PIC16 RTC\rtc.c"
	line	139
	global	__size_of_data
	__size_of_data	equ	__end_of_data-_data
	
_data:	
	opt	stack 6
; Regs used in _data: [wreg+status,2+status,0+btemp+1+pclath+cstack]
;data@ch stored from wreg
	movwf	(data@ch)
	line	140
	
l3024:	
;rtc.c: 140: PORTD=ch;
	movf	(data@ch),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	141
	
l3026:	
;rtc.c: 141: RB0=1;
	bsf	(48/8),(48)&7
	line	142
	
l3028:	
;rtc.c: 142: RB1=0;
	bcf	(49/8),(49)&7
	line	143
	
l3030:	
;rtc.c: 143: RB2=1;
	bsf	(50/8),(50)&7
	line	144
	
l3032:	
;rtc.c: 144: delay(10);
	movlw	low(0Ah)
	movwf	(?_delay)
	movlw	high(0Ah)
	movwf	((?_delay))+1
	fcall	_delay
	line	145
	
l3034:	
;rtc.c: 145: RB2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(50/8),(50)&7
	line	146
	
l773:	
	return
	opt stack 0
GLOBAL	__end_of_data
	__end_of_data:
;; =============== function _data ends ============

	signat	_data,4216
	global	_cmd
psect	text381,local,class=CODE,delta=2
global __ptext381
__ptext381:

;; *************** function _cmd *****************
;; Defined at:
;;		line 130 in file "C:\Users\ELCOT\Desktop\PIC16 RTC\rtc.c"
;; Parameters:    Size  Location     Type
;;  ch              1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  ch              1    7[COMMON] unsigned char 
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
;;		_lcd_init
;; This function uses a non-reentrant model
;;
psect	text381
	file	"C:\Users\ELCOT\Desktop\PIC16 RTC\rtc.c"
	line	130
	global	__size_of_cmd
	__size_of_cmd	equ	__end_of_cmd-_cmd
	
_cmd:	
	opt	stack 6
; Regs used in _cmd: [wreg+status,2+status,0+btemp+1+pclath+cstack]
;cmd@ch stored from wreg
	movwf	(cmd@ch)
	line	131
	
l3012:	
;rtc.c: 131: PORTD=ch;
	movf	(cmd@ch),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	132
	
l3014:	
;rtc.c: 132: RB0=0;
	bcf	(48/8),(48)&7
	line	133
	
l3016:	
;rtc.c: 133: RB1=0;
	bcf	(49/8),(49)&7
	line	134
	
l3018:	
;rtc.c: 134: RB2=1;
	bsf	(50/8),(50)&7
	line	135
	
l3020:	
;rtc.c: 135: delay(10);
	movlw	low(0Ah)
	movwf	(?_delay)
	movlw	high(0Ah)
	movwf	((?_delay))+1
	fcall	_delay
	line	136
	
l3022:	
;rtc.c: 136: RB2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(50/8),(50)&7
	line	137
	
l770:	
	return
	opt stack 0
GLOBAL	__end_of_cmd
	__end_of_cmd:
;; =============== function _cmd ends ============

	signat	_cmd,4216
	global	_I2C_Read_Byte
psect	text382,local,class=CODE,delta=2
global __ptext382
__ptext382:

;; *************** function _I2C_Read_Byte *****************
;; Defined at:
;;		line 66 in file "C:\Users\ELCOT\Desktop\PIC16 RTC\I2C.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
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
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_I2C_Master_Wait
;; This function is called by:
;;		_rtc_read
;; This function uses a non-reentrant model
;;
psect	text382
	file	"C:\Users\ELCOT\Desktop\PIC16 RTC\I2C.h"
	line	66
	global	__size_of_I2C_Read_Byte
	__size_of_I2C_Read_Byte	equ	__end_of_I2C_Read_Byte-_I2C_Read_Byte
	
_I2C_Read_Byte:	
	opt	stack 5
; Regs used in _I2C_Read_Byte: [wreg+status,2+status,0+pclath+cstack]
	line	68
	
l3002:	
;I2C.h: 68: I2C_Master_Wait();
	fcall	_I2C_Master_Wait
	line	69
	
l3004:	
;I2C.h: 69: RCEN = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1163/8)^080h,(1163)&7
	line	70
;I2C.h: 70: while(!SSPIF);
	goto	l746
	
l747:	
	
l746:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(99/8),(99)&7
	goto	u2381
	goto	u2380
u2381:
	goto	l746
u2380:
	
l748:	
	line	71
;I2C.h: 71: SSPIF = 0;
	bcf	(99/8),(99)&7
	line	72
	
l3006:	
;I2C.h: 72: I2C_Master_Wait();
	fcall	_I2C_Master_Wait
	line	73
	
l3008:	
;I2C.h: 73: return SSPBUF;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(19),w	;volatile
	goto	l749
	
l3010:	
	line	74
	
l749:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Read_Byte
	__end_of_I2C_Read_Byte:
;; =============== function _I2C_Read_Byte ends ============

	signat	_I2C_Read_Byte,89
	global	_I2C_write
psect	text383,local,class=CODE,delta=2
global __ptext383
__ptext383:

;; *************** function _I2C_write *****************
;; Defined at:
;;		line 57 in file "C:\Users\ELCOT\Desktop\PIC16 RTC\I2C.h"
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
;;		_main
;;		_rtc_read
;; This function uses a non-reentrant model
;;
psect	text383
	file	"C:\Users\ELCOT\Desktop\PIC16 RTC\I2C.h"
	line	57
	global	__size_of_I2C_write
	__size_of_I2C_write	equ	__end_of_I2C_write-_I2C_write
	
_I2C_write:	
	opt	stack 5
; Regs used in _I2C_write: [wreg+status,2+status,0+pclath+cstack]
;I2C_write@data stored from wreg
	movwf	(I2C_write@data)
	line	58
	
l2998:	
;I2C.h: 58: I2C_Master_Wait();
	fcall	_I2C_Master_Wait
	line	59
	
l3000:	
;I2C.h: 59: SSPBUF = data;
	movf	(I2C_write@data),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(19)	;volatile
	line	60
;I2C.h: 60: while(!SSPIF);
	goto	l740
	
l741:	
	
l740:	
	btfss	(99/8),(99)&7
	goto	u2371
	goto	u2370
u2371:
	goto	l740
u2370:
	
l742:	
	line	61
;I2C.h: 61: SSPIF = 0;
	bcf	(99/8),(99)&7
	line	62
;I2C.h: 62: return ACKSTAT;
;	Return value of _I2C_write is never used
	line	63
	
l743:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_write
	__end_of_I2C_write:
;; =============== function _I2C_write ends ============

	signat	_I2C_write,4217
	global	_I2C_stop
psect	text384,local,class=CODE,delta=2
global __ptext384
__ptext384:

;; *************** function _I2C_stop *****************
;; Defined at:
;;		line 38 in file "C:\Users\ELCOT\Desktop\PIC16 RTC\I2C.h"
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
;;		_main
;;		_rtc_read
;; This function uses a non-reentrant model
;;
psect	text384
	file	"C:\Users\ELCOT\Desktop\PIC16 RTC\I2C.h"
	line	38
	global	__size_of_I2C_stop
	__size_of_I2C_stop	equ	__end_of_I2C_stop-_I2C_stop
	
_I2C_stop:	
	opt	stack 5
; Regs used in _I2C_stop: [wreg+status,2+status,0+pclath+cstack]
	line	39
	
l2994:	
;I2C.h: 39: I2C_Master_Wait();
	fcall	_I2C_Master_Wait
	line	40
	
l2996:	
;I2C.h: 40: PEN = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1162/8)^080h,(1162)&7
	line	41
	
l731:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_stop
	__end_of_I2C_stop:
;; =============== function _I2C_stop ends ============

	signat	_I2C_stop,88
	global	_I2C_restart
psect	text385,local,class=CODE,delta=2
global __ptext385
__ptext385:

;; *************** function _I2C_restart *****************
;; Defined at:
;;		line 26 in file "C:\Users\ELCOT\Desktop\PIC16 RTC\I2C.h"
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
;;		_rtc_read
;; This function uses a non-reentrant model
;;
psect	text385
	file	"C:\Users\ELCOT\Desktop\PIC16 RTC\I2C.h"
	line	26
	global	__size_of_I2C_restart
	__size_of_I2C_restart	equ	__end_of_I2C_restart-_I2C_restart
	
_I2C_restart:	
	opt	stack 5
; Regs used in _I2C_restart: [wreg+status,2+status,0+pclath+cstack]
	line	27
	
l2990:	
;I2C.h: 27: I2C_Master_Wait();
	fcall	_I2C_Master_Wait
	line	28
	
l2992:	
;I2C.h: 28: RSEN = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1161/8)^080h,(1161)&7
	line	29
	
l725:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_restart
	__end_of_I2C_restart:
;; =============== function _I2C_restart ends ============

	signat	_I2C_restart,88
	global	_I2C_start
psect	text386,local,class=CODE,delta=2
global __ptext386
__ptext386:

;; *************** function _I2C_start *****************
;; Defined at:
;;		line 21 in file "C:\Users\ELCOT\Desktop\PIC16 RTC\I2C.h"
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
;;		_main
;;		_rtc_read
;; This function uses a non-reentrant model
;;
psect	text386
	file	"C:\Users\ELCOT\Desktop\PIC16 RTC\I2C.h"
	line	21
	global	__size_of_I2C_start
	__size_of_I2C_start	equ	__end_of_I2C_start-_I2C_start
	
_I2C_start:	
	opt	stack 5
; Regs used in _I2C_start: [wreg+status,2+status,0+pclath+cstack]
	line	22
	
l2986:	
;I2C.h: 22: I2C_Master_Wait();
	fcall	_I2C_Master_Wait
	line	23
	
l2988:	
;I2C.h: 23: SEN = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1160/8)^080h,(1160)&7
	line	24
	
l722:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_start
	__end_of_I2C_start:
;; =============== function _I2C_start ends ============

	signat	_I2C_start,88
	global	_lo
psect	text387,local,class=CODE,delta=2
global __ptext387
__ptext387:

;; *************** function _lo *****************
;; Defined at:
;;		line 102 in file "C:\Users\ELCOT\Desktop\PIC16 RTC\rtc.c"
;; Parameters:    Size  Location     Type
;;  bcd             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bcd             1    1[COMMON] unsigned char 
;;  temp            1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
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
psect	text387
	file	"C:\Users\ELCOT\Desktop\PIC16 RTC\rtc.c"
	line	102
	global	__size_of_lo
	__size_of_lo	equ	__end_of_lo-_lo
	
_lo:	
	opt	stack 7
; Regs used in _lo: [wreg+status,2+status,0]
;lo@bcd stored from wreg
	line	104
	movwf	(lo@bcd)
	
l2978:	
;rtc.c: 103: unsigned char temp;
;rtc.c: 104: temp=(bcd&0x0f);
	movf	(lo@bcd),w
	andlw	0Fh
	movwf	(??_lo+0)+0
	movf	(??_lo+0)+0,w
	movwf	(lo@temp)
	line	105
	
l2980:	
;rtc.c: 105: temp=temp+48;
	movf	(lo@temp),w
	addlw	030h
	movwf	(??_lo+0)+0
	movf	(??_lo+0)+0,w
	movwf	(lo@temp)
	line	106
	
l2982:	
;rtc.c: 106: return temp;
	movf	(lo@temp),w
	goto	l761
	
l2984:	
	line	107
	
l761:	
	return
	opt stack 0
GLOBAL	__end_of_lo
	__end_of_lo:
;; =============== function _lo ends ============

	signat	_lo,4217
	global	_up
psect	text388,local,class=CODE,delta=2
global __ptext388
__ptext388:

;; *************** function _up *****************
;; Defined at:
;;		line 91 in file "C:\Users\ELCOT\Desktop\PIC16 RTC\rtc.c"
;; Parameters:    Size  Location     Type
;;  bcd             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bcd             1    2[COMMON] unsigned char 
;;  temp            1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text388
	file	"C:\Users\ELCOT\Desktop\PIC16 RTC\rtc.c"
	line	91
	global	__size_of_up
	__size_of_up	equ	__end_of_up-_up
	
_up:	
	opt	stack 7
; Regs used in _up: [wreg+status,2+status,0]
;up@bcd stored from wreg
	line	93
	movwf	(up@bcd)
	
l2972:	
;rtc.c: 92: unsigned char temp;
;rtc.c: 93: temp=(bcd>>4);
	movf	(up@bcd),w
	movwf	(??_up+0)+0
	movlw	04h
u2365:
	clrc
	rrf	(??_up+0)+0,f
	addlw	-1
	skipz
	goto	u2365
	movf	0+(??_up+0)+0,w
	movwf	(??_up+1)+0
	movf	(??_up+1)+0,w
	movwf	(up@temp)
	line	94
;rtc.c: 94: temp=temp+48;
	movf	(up@temp),w
	addlw	030h
	movwf	(??_up+0)+0
	movf	(??_up+0)+0,w
	movwf	(up@temp)
	line	95
	
l2974:	
;rtc.c: 95: return temp;
	movf	(up@temp),w
	goto	l758
	
l2976:	
	line	100
	
l758:	
	return
	opt stack 0
GLOBAL	__end_of_up
	__end_of_up:
;; =============== function _up ends ============

	signat	_up,4217
	global	_delay
psect	text389,local,class=CODE,delta=2
global __ptext389
__ptext389:

;; *************** function _delay *****************
;; Defined at:
;;		line 157 in file "C:\Users\ELCOT\Desktop\PIC16 RTC\rtc.c"
;; Parameters:    Size  Location     Type
;;  a               2    0[COMMON] int 
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
;;		_data
;; This function uses a non-reentrant model
;;
psect	text389
	file	"C:\Users\ELCOT\Desktop\PIC16 RTC\rtc.c"
	line	157
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 6
; Regs used in _delay: [wreg+status,2+btemp+1]
	line	159
	
l2958:	
;rtc.c: 158: int i,j;
;rtc.c: 159: for(i=0;i<a;i++)
	clrf	(delay@i)
	clrf	(delay@i+1)
	goto	l782
	line	160
	
l783:	
	line	161
	
l2960:	
;rtc.c: 160: {
;rtc.c: 161: for(j=0;j<250;j++)
	clrf	(delay@j)
	clrf	(delay@j+1)
	
l2962:	
	movf	(delay@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0FAh))^80h
	subwf	btemp+1,w
	skipz
	goto	u2335
	movlw	low(0FAh)
	subwf	(delay@j),w
u2335:

	skipc
	goto	u2331
	goto	u2330
u2331:
	goto	l2966
u2330:
	goto	l2970
	
l2964:	
	goto	l2970
	line	162
	
l784:	
	line	161
	
l2966:	
;rtc.c: 162: {
	movlw	low(01h)
	addwf	(delay@j),f
	skipnc
	incf	(delay@j+1),f
	movlw	high(01h)
	addwf	(delay@j+1),f
	
l2968:	
	movf	(delay@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0FAh))^80h
	subwf	btemp+1,w
	skipz
	goto	u2345
	movlw	low(0FAh)
	subwf	(delay@j),w
u2345:

	skipc
	goto	u2341
	goto	u2340
u2341:
	goto	l2966
u2340:
	goto	l2970
	
l785:	
	line	159
	
l2970:	
	movlw	low(01h)
	addwf	(delay@i),f
	skipnc
	incf	(delay@i+1),f
	movlw	high(01h)
	addwf	(delay@i+1),f
	
l782:	
	movf	(delay@i+1),w
	xorlw	80h
	movwf	(??_delay+0)+0
	movf	(delay@a+1),w
	xorlw	80h
	subwf	(??_delay+0)+0,w
	skipz
	goto	u2355
	movf	(delay@a),w
	subwf	(delay@i),w
u2355:

	skipc
	goto	u2351
	goto	u2350
u2351:
	goto	l2960
u2350:
	goto	l787
	
l786:	
	line	165
	
l787:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
	global	_I2C_Master_Wait
psect	text390,local,class=CODE,delta=2
global __ptext390
__ptext390:

;; *************** function _I2C_Master_Wait *****************
;; Defined at:
;;		line 16 in file "C:\Users\ELCOT\Desktop\PIC16 RTC\I2C.h"
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
;;		_I2C_restart
;;		_I2C_stop
;;		_I2C_write
;;		_I2C_Read_Byte
;;		_I2C_Master_RepeatedStart
;;		_I2C_ACK
;;		_I2C_NACK
;; This function uses a non-reentrant model
;;
psect	text390
	file	"C:\Users\ELCOT\Desktop\PIC16 RTC\I2C.h"
	line	16
	global	__size_of_I2C_Master_Wait
	__size_of_I2C_Master_Wait	equ	__end_of_I2C_Master_Wait-_I2C_Master_Wait
	
_I2C_Master_Wait:	
	opt	stack 5
; Regs used in _I2C_Master_Wait: [wreg+status,2]
	line	17
	
l2938:	
;I2C.h: 17: while ((SSPSTAT & 0x04) || (SSPCON2 & 0x1F));
	goto	l716
	
l717:	
	
l716:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfsc	(148)^080h,(2)&7
	goto	u2311
	goto	u2310
u2311:
	goto	l716
u2310:
	
l2940:	
	movf	(145)^080h,w
	andlw	01Fh
	btfss	status,2
	goto	u2321
	goto	u2320
u2321:
	goto	l716
u2320:
	goto	l719
	
l718:	
	line	18
	
l719:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Master_Wait
	__end_of_I2C_Master_Wait:
;; =============== function _I2C_Master_Wait ends ============

	signat	_I2C_Master_Wait,88
	global	_I2C_Master_Init
psect	text391,local,class=CODE,delta=2
global __ptext391
__ptext391:

;; *************** function _I2C_Master_Init *****************
;; Defined at:
;;		line 6 in file "C:\Users\ELCOT\Desktop\PIC16 RTC\I2C.h"
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
psect	text391
	file	"C:\Users\ELCOT\Desktop\PIC16 RTC\I2C.h"
	line	6
	global	__size_of_I2C_Master_Init
	__size_of_I2C_Master_Init	equ	__end_of_I2C_Master_Init-_I2C_Master_Init
	
_I2C_Master_Init:	
	opt	stack 7
; Regs used in _I2C_Master_Init: [wreg+status,2]
	line	7
	
l2928:	
;I2C.h: 7: SSPCON = 0x28;
	movlw	(028h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	8
	
l2930:	
;I2C.h: 8: SSPCON2 = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(145)^080h	;volatile
	line	9
	
l2932:	
;I2C.h: 9: SSPSTAT = 0x00;
	clrf	(148)^080h	;volatile
	line	10
;I2C.h: 10: SSPADD = ((20000000/4)/100000) - 1;
	movlw	(031h)
	movwf	(147)^080h	;volatile
	line	11
	
l2934:	
;I2C.h: 11: TRISC3 = 1;
	bsf	(1083/8)^080h,(1083)&7
	line	12
	
l2936:	
;I2C.h: 12: TRISC4 = 1;
	bsf	(1084/8)^080h,(1084)&7
	line	13
	
l713:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Master_Init
	__end_of_I2C_Master_Init:
;; =============== function _I2C_Master_Init ends ============

	signat	_I2C_Master_Init,88
psect	text392,local,class=CODE,delta=2
global __ptext392
__ptext392:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
