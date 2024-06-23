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
	FNCALL	_main,_I2C_EEPROMWrite
	FNCALL	_main,_I2C_EEPROMRead
	FNCALL	_I2C_EEPROMRead,_I2C_Begin
	FNCALL	_I2C_EEPROMRead,_I2C_Write
	FNCALL	_I2C_EEPROMRead,_I2C_RSEN
	FNCALL	_I2C_EEPROMRead,_I2C_Read
	FNCALL	_I2C_EEPROMRead,_I2C_End
	FNCALL	_I2C_EEPROMWrite,_I2C_Begin
	FNCALL	_I2C_EEPROMWrite,_I2C_Write
	FNCALL	_I2C_EEPROMWrite,_I2C_End
	FNCALL	_I2C_End,_I2C_Hold
	FNCALL	_I2C_RSEN,_I2C_Hold
	FNCALL	_I2C_Begin,_I2C_Hold
	FNCALL	_I2C_Write,_I2C_Hold
	FNCALL	_I2C_Read,_I2C_Hold
	FNCALL	_I2C_Initialize,___lmul
	FNCALL	_I2C_Initialize,___lldiv
	FNROOT	_main
	global	_temp
	global	_PORTD
psect	text313,local,class=CODE,delta=2
global __ptext313
__ptext313:
_PORTD	set	8
	global	_SSPBUF
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
	global	_TRISD
_TRISD	set	136
	global	_ACKDT
_ACKDT	set	1165
	global	_ACKEN
_ACKEN	set	1164
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
	file	"eeprom pic16.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_temp:
       ds      1

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_I2C_Hold
?_I2C_Hold:	; 0 bytes @ 0x0
	global	??_I2C_Hold
??_I2C_Hold:	; 0 bytes @ 0x0
	global	?_I2C_Write
?_I2C_Write:	; 0 bytes @ 0x0
	global	?_I2C_Begin
?_I2C_Begin:	; 0 bytes @ 0x0
	global	??_I2C_Begin
??_I2C_Begin:	; 0 bytes @ 0x0
	global	?_I2C_RSEN
?_I2C_RSEN:	; 0 bytes @ 0x0
	global	??_I2C_RSEN
??_I2C_RSEN:	; 0 bytes @ 0x0
	global	?_I2C_End
?_I2C_End:	; 0 bytes @ 0x0
	global	??_I2C_End
??_I2C_End:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
	global	?_I2C_Read
?_I2C_Read:	; 2 bytes @ 0x0
	global	?___lmul
?___lmul:	; 4 bytes @ 0x0
	global	I2C_Read@ack
I2C_Read@ack:	; 2 bytes @ 0x0
	global	I2C_Write@data
I2C_Write@data:	; 2 bytes @ 0x0
	global	___lmul@multiplier
___lmul@multiplier:	; 4 bytes @ 0x0
	ds	2
	global	?_I2C_EEPROMWrite
?_I2C_EEPROMWrite:	; 0 bytes @ 0x2
	global	??_I2C_Read
??_I2C_Read:	; 0 bytes @ 0x2
	global	??_I2C_Write
??_I2C_Write:	; 0 bytes @ 0x2
	global	I2C_EEPROMWrite@adddress
I2C_EEPROMWrite@adddress:	; 2 bytes @ 0x2
	ds	2
	global	I2C_Read@incoming
I2C_Read@incoming:	; 2 bytes @ 0x4
	global	I2C_EEPROMWrite@data
I2C_EEPROMWrite@data:	; 2 bytes @ 0x4
	global	___lmul@multiplicand
___lmul@multiplicand:	; 4 bytes @ 0x4
	ds	2
	global	??_I2C_EEPROMWrite
??_I2C_EEPROMWrite:	; 0 bytes @ 0x6
	global	?_I2C_EEPROMRead
?_I2C_EEPROMRead:	; 1 bytes @ 0x6
	global	I2C_EEPROMRead@adddress
I2C_EEPROMRead@adddress:	; 2 bytes @ 0x6
	ds	2
	global	??_I2C_EEPROMRead
??_I2C_EEPROMRead:	; 0 bytes @ 0x8
	global	??___lmul
??___lmul:	; 0 bytes @ 0x8
	ds	1
	global	___lmul@product
___lmul@product:	; 4 bytes @ 0x9
	ds	4
	global	??___lldiv
??___lldiv:	; 0 bytes @ 0xD
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0xE
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
;;Data sizes: Strings 0, constant 0, data 0, bss 1, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80     21      22
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___lmul	unsigned long  size(1) Largest target is 0
;;
;; ?___lldiv	unsigned long  size(1) Largest target is 0
;;
;; ?_I2C_Read	unsigned short  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _I2C_EEPROMRead->_I2C_Read
;;   _I2C_EEPROMWrite->_I2C_Write
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
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0     443
;;                     _I2C_Initialize
;;                    _I2C_EEPROMWrite
;;                     _I2C_EEPROMRead
;; ---------------------------------------------------------------------------------
;; (1) _I2C_EEPROMRead                                       5     3      2     111
;;                                              6 COMMON     5     3      2
;;                          _I2C_Begin
;;                          _I2C_Write
;;                           _I2C_RSEN
;;                           _I2C_Read
;;                            _I2C_End
;; ---------------------------------------------------------------------------------
;; (1) _I2C_EEPROMWrite                                      7     3      4      88
;;                                              2 COMMON     7     3      4
;;                          _I2C_Begin
;;                          _I2C_Write
;;                            _I2C_End
;; ---------------------------------------------------------------------------------
;; (2) _I2C_End                                              0     0      0       0
;;                           _I2C_Hold
;; ---------------------------------------------------------------------------------
;; (2) _I2C_RSEN                                             0     0      0       0
;;                           _I2C_Hold
;; ---------------------------------------------------------------------------------
;; (2) _I2C_Begin                                            0     0      0       0
;;                           _I2C_Hold
;; ---------------------------------------------------------------------------------
;; (2) _I2C_Write                                            2     0      2      22
;;                                              0 COMMON     2     0      2
;;                           _I2C_Hold
;; ---------------------------------------------------------------------------------
;; (2) _I2C_Read                                             6     4      2      45
;;                                              0 COMMON     6     4      2
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
;; (3) _I2C_Hold                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _I2C_Initialize
;;     ___lmul
;;     ___lldiv
;;       ___lmul (ARG)
;;   _I2C_EEPROMWrite
;;     _I2C_Begin
;;       _I2C_Hold
;;     _I2C_Write
;;       _I2C_Hold
;;     _I2C_End
;;       _I2C_Hold
;;   _I2C_EEPROMRead
;;     _I2C_Begin
;;       _I2C_Hold
;;     _I2C_Write
;;       _I2C_Hold
;;     _I2C_RSEN
;;       _I2C_Hold
;;     _I2C_Read
;;       _I2C_Hold
;;     _I2C_End
;;       _I2C_Hold
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
;;ABS                  0      0      24       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50     15      16       5       27.5%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      27      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 14 in file "C:\Users\ELCOT\Desktop\PIC18\eeprom pic16\eeprom.c"
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
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_I2C_Initialize
;;		_I2C_EEPROMWrite
;;		_I2C_EEPROMRead
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\ELCOT\Desktop\PIC18\eeprom pic16\eeprom.c"
	line	14
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	15
	
l2867:	
;eeprom.c: 15: TRISD=0X00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	16
	
l2869:	
;eeprom.c: 16: I2C_Initialize(100);
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
	line	17
	
l2871:	
;eeprom.c: 17: I2C_EEPROMWrite(0x27,0xA2);
	movlw	low(027h)
	movwf	(?_I2C_EEPROMWrite)
	movlw	high(027h)
	movwf	((?_I2C_EEPROMWrite))+1
	movlw	low(0A2h)
	movwf	0+(?_I2C_EEPROMWrite)+02h
	movlw	high(0A2h)
	movwf	(0+(?_I2C_EEPROMWrite)+02h)+1
	fcall	_I2C_EEPROMWrite
	line	18
	
l2873:	
;eeprom.c: 18: PORTD=I2C_EEPROMRead(0X27);
	movlw	low(027h)
	movwf	(?_I2C_EEPROMRead)
	movlw	high(027h)
	movwf	((?_I2C_EEPROMRead))+1
	fcall	_I2C_EEPROMRead
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	goto	l698
	line	19
;eeprom.c: 19: while(1)
	
l697:	
	line	38
;eeprom.c: 20: {
	
l698:	
	line	19
	goto	l698
	
l699:	
	line	39
	
l700:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_I2C_EEPROMRead
psect	text314,local,class=CODE,delta=2
global __ptext314
__ptext314:

;; *************** function _I2C_EEPROMRead *****************
;; Defined at:
;;		line 102 in file "C:\Users\ELCOT\Desktop\PIC18\eeprom pic16\eeprom.c"
;; Parameters:    Size  Location     Type
;;  adddress        2    6[COMMON] unsigned int 
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
;;      Params:         2       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_I2C_Begin
;;		_I2C_Write
;;		_I2C_RSEN
;;		_I2C_Read
;;		_I2C_End
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text314
	file	"C:\Users\ELCOT\Desktop\PIC18\eeprom pic16\eeprom.c"
	line	102
	global	__size_of_I2C_EEPROMRead
	__size_of_I2C_EEPROMRead	equ	__end_of_I2C_EEPROMRead-_I2C_EEPROMRead
	
_I2C_EEPROMRead:	
	opt	stack 5
; Regs used in _I2C_EEPROMRead: [wreg+status,2+status,0+pclath+cstack]
	line	103
	
l2847:	
;eeprom.c: 103: I2C_Begin();
	fcall	_I2C_Begin
	line	104
;eeprom.c: 104: I2C_Write(0xA0);
	movlw	low(0A0h)
	movwf	(?_I2C_Write)
	movlw	high(0A0h)
	movwf	((?_I2C_Write))+1
	fcall	_I2C_Write
	line	105
	
l2849:	
;eeprom.c: 105: temp=(adddress>>4);
	movf	(I2C_EEPROMRead@adddress+1),w
	movwf	(??_I2C_EEPROMRead+0)+0+1
	movf	(I2C_EEPROMRead@adddress),w
	movwf	(??_I2C_EEPROMRead+0)+0
	movlw	04h
u2425:
	clrc
	rrf	(??_I2C_EEPROMRead+0)+1,f
	rrf	(??_I2C_EEPROMRead+0)+0,f
	addlw	-1
	skipz
	goto	u2425
	movf	0+(??_I2C_EEPROMRead+0)+0,w
	movwf	(??_I2C_EEPROMRead+2)+0
	movf	(??_I2C_EEPROMRead+2)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_temp)
	line	106
	
l2851:	
;eeprom.c: 106: I2C_Write(temp);
	movf	(_temp),w
	movwf	(??_I2C_EEPROMRead+0)+0
	clrf	(??_I2C_EEPROMRead+0)+0+1
	movf	0+(??_I2C_EEPROMRead+0)+0,w
	movwf	(?_I2C_Write)
	movf	1+(??_I2C_EEPROMRead+0)+0,w
	movwf	(?_I2C_Write+1)
	fcall	_I2C_Write
	line	107
	
l2853:	
;eeprom.c: 107: I2C_Write(adddress);
	movf	(I2C_EEPROMRead@adddress+1),w
	clrf	(?_I2C_Write+1)
	addwf	(?_I2C_Write+1)
	movf	(I2C_EEPROMRead@adddress),w
	clrf	(?_I2C_Write)
	addwf	(?_I2C_Write)

	fcall	_I2C_Write
	line	110
	
l2855:	
;eeprom.c: 110: I2C_RSEN();
	fcall	_I2C_RSEN
	line	111
	
l2857:	
;eeprom.c: 111: I2C_Write(0xA1);
	movlw	low(0A1h)
	movwf	(?_I2C_Write)
	movlw	high(0A1h)
	movwf	((?_I2C_Write))+1
	fcall	_I2C_Write
	line	112
	
l2859:	
;eeprom.c: 112: temp=I2C_Read(1) ;
	movlw	low(01h)
	movwf	(?_I2C_Read)
	movlw	high(01h)
	movwf	((?_I2C_Read))+1
	fcall	_I2C_Read
	movf	(0+(?_I2C_Read)),w
	movwf	(??_I2C_EEPROMRead+0)+0
	movf	(??_I2C_EEPROMRead+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_temp)
	line	113
	
l2861:	
;eeprom.c: 113: I2C_End();
	fcall	_I2C_End
	line	114
	
l2863:	
;eeprom.c: 114: return temp;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_temp),w
	goto	l730
	
l2865:	
	line	115
	
l730:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_EEPROMRead
	__end_of_I2C_EEPROMRead:
;; =============== function _I2C_EEPROMRead ends ============

	signat	_I2C_EEPROMRead,4217
	global	_I2C_EEPROMWrite
psect	text315,local,class=CODE,delta=2
global __ptext315
__ptext315:

;; *************** function _I2C_EEPROMWrite *****************
;; Defined at:
;;		line 91 in file "C:\Users\ELCOT\Desktop\PIC18\eeprom pic16\eeprom.c"
;; Parameters:    Size  Location     Type
;;  adddress        2    2[COMMON] unsigned int 
;;  data            2    4[COMMON] unsigned int 
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
;;      Params:         4       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         7       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_I2C_Begin
;;		_I2C_Write
;;		_I2C_End
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text315
	file	"C:\Users\ELCOT\Desktop\PIC18\eeprom pic16\eeprom.c"
	line	91
	global	__size_of_I2C_EEPROMWrite
	__size_of_I2C_EEPROMWrite	equ	__end_of_I2C_EEPROMWrite-_I2C_EEPROMWrite
	
_I2C_EEPROMWrite:	
	opt	stack 5
; Regs used in _I2C_EEPROMWrite: [wreg+status,2+status,0+pclath+cstack]
	line	92
	
l2833:	
;eeprom.c: 92: I2C_Begin();
	fcall	_I2C_Begin
	line	93
;eeprom.c: 93: I2C_Write(0xA0);
	movlw	low(0A0h)
	movwf	(?_I2C_Write)
	movlw	high(0A0h)
	movwf	((?_I2C_Write))+1
	fcall	_I2C_Write
	line	94
	
l2835:	
;eeprom.c: 94: temp=(adddress>>4);
	movf	(I2C_EEPROMWrite@adddress+1),w
	movwf	(??_I2C_EEPROMWrite+0)+0+1
	movf	(I2C_EEPROMWrite@adddress),w
	movwf	(??_I2C_EEPROMWrite+0)+0
	movlw	04h
u2415:
	clrc
	rrf	(??_I2C_EEPROMWrite+0)+1,f
	rrf	(??_I2C_EEPROMWrite+0)+0,f
	addlw	-1
	skipz
	goto	u2415
	movf	0+(??_I2C_EEPROMWrite+0)+0,w
	movwf	(??_I2C_EEPROMWrite+2)+0
	movf	(??_I2C_EEPROMWrite+2)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_temp)
	line	95
	
l2837:	
;eeprom.c: 95: I2C_Write(temp);
	movf	(_temp),w
	movwf	(??_I2C_EEPROMWrite+0)+0
	clrf	(??_I2C_EEPROMWrite+0)+0+1
	movf	0+(??_I2C_EEPROMWrite+0)+0,w
	movwf	(?_I2C_Write)
	movf	1+(??_I2C_EEPROMWrite+0)+0,w
	movwf	(?_I2C_Write+1)
	fcall	_I2C_Write
	line	96
	
l2839:	
;eeprom.c: 96: I2C_Write(adddress);
	movf	(I2C_EEPROMWrite@adddress+1),w
	clrf	(?_I2C_Write+1)
	addwf	(?_I2C_Write+1)
	movf	(I2C_EEPROMWrite@adddress),w
	clrf	(?_I2C_Write)
	addwf	(?_I2C_Write)

	fcall	_I2C_Write
	line	97
	
l2841:	
;eeprom.c: 97: I2C_Write(data);
	movf	(I2C_EEPROMWrite@data+1),w
	clrf	(?_I2C_Write+1)
	addwf	(?_I2C_Write+1)
	movf	(I2C_EEPROMWrite@data),w
	clrf	(?_I2C_Write)
	addwf	(?_I2C_Write)

	fcall	_I2C_Write
	line	98
	
l2843:	
;eeprom.c: 98: I2C_End();
	fcall	_I2C_End
	line	99
	
l2845:	
;eeprom.c: 99: _delay((unsigned long)((200)*(20000000/4000.0)));
	opt asmopt_off
movlw  6
movwf	((??_I2C_EEPROMWrite+0)+0+2),f
movlw	19
movwf	((??_I2C_EEPROMWrite+0)+0+1),f
	movlw	177
movwf	((??_I2C_EEPROMWrite+0)+0),f
u2437:
	decfsz	((??_I2C_EEPROMWrite+0)+0),f
	goto	u2437
	decfsz	((??_I2C_EEPROMWrite+0)+0+1),f
	goto	u2437
	decfsz	((??_I2C_EEPROMWrite+0)+0+2),f
	goto	u2437
	nop2
opt asmopt_on

	line	100
	
l727:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_EEPROMWrite
	__end_of_I2C_EEPROMWrite:
;; =============== function _I2C_EEPROMWrite ends ============

	signat	_I2C_EEPROMWrite,8312
	global	_I2C_End
psect	text316,local,class=CODE,delta=2
global __ptext316
__ptext316:

;; *************** function _I2C_End *****************
;; Defined at:
;;		line 71 in file "C:\Users\ELCOT\Desktop\PIC18\eeprom pic16\eeprom.c"
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
;;		_I2C_EEPROMWrite
;;		_I2C_EEPROMRead
;; This function uses a non-reentrant model
;;
psect	text316
	file	"C:\Users\ELCOT\Desktop\PIC18\eeprom pic16\eeprom.c"
	line	71
	global	__size_of_I2C_End
	__size_of_I2C_End	equ	__end_of_I2C_End-_I2C_End
	
_I2C_End:	
	opt	stack 5
; Regs used in _I2C_End: [wreg+status,2+status,0+pclath+cstack]
	line	72
	
l2829:	
;eeprom.c: 72: I2C_Hold();
	fcall	_I2C_Hold
	line	73
	
l2831:	
;eeprom.c: 73: PEN = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1162/8)^080h,(1162)&7
	line	74
	
l715:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_End
	__end_of_I2C_End:
;; =============== function _I2C_End ends ============

	signat	_I2C_End,88
	global	_I2C_RSEN
psect	text317,local,class=CODE,delta=2
global __ptext317
__ptext317:

;; *************** function _I2C_RSEN *****************
;; Defined at:
;;		line 66 in file "C:\Users\ELCOT\Desktop\PIC18\eeprom pic16\eeprom.c"
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
;;		_I2C_EEPROMRead
;; This function uses a non-reentrant model
;;
psect	text317
	file	"C:\Users\ELCOT\Desktop\PIC18\eeprom pic16\eeprom.c"
	line	66
	global	__size_of_I2C_RSEN
	__size_of_I2C_RSEN	equ	__end_of_I2C_RSEN-_I2C_RSEN
	
_I2C_RSEN:	
	opt	stack 5
; Regs used in _I2C_RSEN: [wreg+status,2+status,0+pclath+cstack]
	line	67
	
l2825:	
;eeprom.c: 67: I2C_Hold();
	fcall	_I2C_Hold
	line	68
	
l2827:	
;eeprom.c: 68: RSEN = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1161/8)^080h,(1161)&7
	line	69
	
l712:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_RSEN
	__end_of_I2C_RSEN:
;; =============== function _I2C_RSEN ends ============

	signat	_I2C_RSEN,88
	global	_I2C_Begin
psect	text318,local,class=CODE,delta=2
global __ptext318
__ptext318:

;; *************** function _I2C_Begin *****************
;; Defined at:
;;		line 61 in file "C:\Users\ELCOT\Desktop\PIC18\eeprom pic16\eeprom.c"
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
;;		_I2C_EEPROMWrite
;;		_I2C_EEPROMRead
;; This function uses a non-reentrant model
;;
psect	text318
	file	"C:\Users\ELCOT\Desktop\PIC18\eeprom pic16\eeprom.c"
	line	61
	global	__size_of_I2C_Begin
	__size_of_I2C_Begin	equ	__end_of_I2C_Begin-_I2C_Begin
	
_I2C_Begin:	
	opt	stack 5
; Regs used in _I2C_Begin: [wreg+status,2+status,0+pclath+cstack]
	line	62
	
l2821:	
;eeprom.c: 62: I2C_Hold();
	fcall	_I2C_Hold
	line	63
	
l2823:	
;eeprom.c: 63: SEN = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1160/8)^080h,(1160)&7
	line	64
	
l709:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Begin
	__end_of_I2C_Begin:
;; =============== function _I2C_Begin ends ============

	signat	_I2C_Begin,88
	global	_I2C_Write
psect	text319,local,class=CODE,delta=2
global __ptext319
__ptext319:

;; *************** function _I2C_Write *****************
;; Defined at:
;;		line 56 in file "C:\Users\ELCOT\Desktop\PIC18\eeprom pic16\eeprom.c"
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
;;		_I2C_EEPROMWrite
;;		_I2C_EEPROMRead
;; This function uses a non-reentrant model
;;
psect	text319
	file	"C:\Users\ELCOT\Desktop\PIC18\eeprom pic16\eeprom.c"
	line	56
	global	__size_of_I2C_Write
	__size_of_I2C_Write	equ	__end_of_I2C_Write-_I2C_Write
	
_I2C_Write:	
	opt	stack 5
; Regs used in _I2C_Write: [wreg+status,2+status,0+pclath+cstack]
	line	57
	
l2817:	
;eeprom.c: 57: I2C_Hold();
	fcall	_I2C_Hold
	line	58
	
l2819:	
;eeprom.c: 58: SSPBUF = data;
	movf	(I2C_Write@data),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(19)	;volatile
	line	59
	
l706:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Write
	__end_of_I2C_Write:
;; =============== function _I2C_Write ends ============

	signat	_I2C_Write,4216
	global	_I2C_Read
psect	text320,local,class=CODE,delta=2
global __ptext320
__ptext320:

;; *************** function _I2C_Read *****************
;; Defined at:
;;		line 41 in file "C:\Users\ELCOT\Desktop\PIC18\eeprom pic16\eeprom.c"
;; Parameters:    Size  Location     Type
;;  ack             2    0[COMMON] unsigned short 
;; Auto vars:     Size  Location     Type
;;  incoming        2    4[COMMON] unsigned short 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned short 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_I2C_Hold
;; This function is called by:
;;		_I2C_EEPROMRead
;; This function uses a non-reentrant model
;;
psect	text320
	file	"C:\Users\ELCOT\Desktop\PIC18\eeprom pic16\eeprom.c"
	line	41
	global	__size_of_I2C_Read
	__size_of_I2C_Read	equ	__end_of_I2C_Read-_I2C_Read
	
_I2C_Read:	
	opt	stack 5
; Regs used in _I2C_Read: [wreg+status,2+status,0+pclath+cstack]
	line	43
	
l2803:	
;eeprom.c: 42: unsigned short incoming;
;eeprom.c: 43: I2C_Hold();
	fcall	_I2C_Hold
	line	44
	
l2805:	
;eeprom.c: 44: RCEN = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1163/8)^080h,(1163)&7
	line	46
;eeprom.c: 46: I2C_Hold();
	fcall	_I2C_Hold
	line	47
	
l2807:	
;eeprom.c: 47: incoming = SSPBUF;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(19),w	;volatile
	movwf	(??_I2C_Read+0)+0
	clrf	(??_I2C_Read+0)+0+1
	movf	0+(??_I2C_Read+0)+0,w
	movwf	(I2C_Read@incoming)
	movf	1+(??_I2C_Read+0)+0,w
	movwf	(I2C_Read@incoming+1)
	line	49
	
l2809:	
;eeprom.c: 49: I2C_Hold();
	fcall	_I2C_Hold
	line	50
;eeprom.c: 50: ACKDT = (ack)?0:1;
	movf	(I2C_Read@ack+1),w
	iorwf	(I2C_Read@ack),w
	skipnz
	goto	u2391
	goto	u2390
	
u2391:
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1165/8)^080h,(1165)&7
	goto	u2404
u2390:
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1165/8)^080h,(1165)&7
u2404:
	line	51
	
l2811:	
;eeprom.c: 51: ACKEN = 1;
	bsf	(1164/8)^080h,(1164)&7
	line	53
	
l2813:	
;eeprom.c: 53: return incoming;
	movf	(I2C_Read@incoming+1),w
	clrf	(?_I2C_Read+1)
	addwf	(?_I2C_Read+1)
	movf	(I2C_Read@incoming),w
	clrf	(?_I2C_Read)
	addwf	(?_I2C_Read)

	goto	l703
	
l2815:	
	line	54
	
l703:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Read
	__end_of_I2C_Read:
;; =============== function _I2C_Read ends ============

	signat	_I2C_Read,4218
	global	_I2C_Initialize
psect	text321,local,class=CODE,delta=2
global __ptext321
__ptext321:

;; *************** function _I2C_Initialize *****************
;; Defined at:
;;		line 80 in file "C:\Users\ELCOT\Desktop\PIC18\eeprom pic16\eeprom.c"
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
psect	text321
	file	"C:\Users\ELCOT\Desktop\PIC18\eeprom pic16\eeprom.c"
	line	80
	global	__size_of_I2C_Initialize
	__size_of_I2C_Initialize	equ	__end_of_I2C_Initialize-_I2C_Initialize
	
_I2C_Initialize:	
	opt	stack 6
; Regs used in _I2C_Initialize: [wreg+status,2+status,0+pclath+cstack]
	line	81
	
l2793:	
;eeprom.c: 81: TRISC3 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1083/8)^080h,(1083)&7
	line	82
;eeprom.c: 82: TRISC4 = 1;
	bsf	(1084/8)^080h,(1084)&7
	line	84
	
l2795:	
;eeprom.c: 84: SSPCON = 0b00101000;
	movlw	(028h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	85
	
l2797:	
;eeprom.c: 85: SSPCON2 = 0b00000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(145)^080h	;volatile
	line	87
	
l2799:	
;eeprom.c: 87: SSPADD = (20000000/(4*feq_K*100))-1;
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
u2385:
	clrc
	rlf	(??_I2C_Initialize+0)+0,f
	rlf	(??_I2C_Initialize+0)+1,f
	rlf	(??_I2C_Initialize+0)+2,f
	rlf	(??_I2C_Initialize+0)+3,f
u2380:
	addlw	-1
	skipz
	goto	u2385
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
	line	88
	
l2801:	
;eeprom.c: 88: SSPSTAT = 0b00000000;
	clrf	(148)^080h	;volatile
	line	89
	
l724:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Initialize
	__end_of_I2C_Initialize:
;; =============== function _I2C_Initialize ends ============

	signat	_I2C_Initialize,4216
	global	___lldiv
psect	text322,local,class=CODE,delta=2
global __ptext322
__ptext322:

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
psect	text322
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lldiv.c"
	line	5
	global	__size_of___lldiv
	__size_of___lldiv	equ	__end_of___lldiv-___lldiv
	
___lldiv:	
	opt	stack 6
; Regs used in ___lldiv: [wreg+status,2+status,0]
	line	9
	
l2769:	
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
	goto	u2311
	goto	u2310
u2311:
	goto	l2789
u2310:
	line	11
	
l2771:	
	clrf	(___lldiv@counter)
	bsf	status,0
	rlf	(___lldiv@counter),f
	line	12
	goto	l2775
	
l1587:	
	line	13
	
l2773:	
	movlw	01h
	movwf	(??___lldiv+0)+0
u2325:
	clrc
	rlf	(___lldiv@divisor),f
	rlf	(___lldiv@divisor+1),f
	rlf	(___lldiv@divisor+2),f
	rlf	(___lldiv@divisor+3),f
	decfsz	(??___lldiv+0)+0
	goto	u2325
	line	14
	movlw	(01h)
	movwf	(??___lldiv+0)+0
	movf	(??___lldiv+0)+0,w
	addwf	(___lldiv@counter),f
	goto	l2775
	line	15
	
l1586:	
	line	12
	
l2775:	
	btfss	(___lldiv@divisor+3),(31)&7
	goto	u2331
	goto	u2330
u2331:
	goto	l2773
u2330:
	goto	l2777
	
l1588:	
	goto	l2777
	line	16
	
l1589:	
	line	17
	
l2777:	
	movlw	01h
	movwf	(??___lldiv+0)+0
u2345:
	clrc
	rlf	(___lldiv@quotient),f
	rlf	(___lldiv@quotient+1),f
	rlf	(___lldiv@quotient+2),f
	rlf	(___lldiv@quotient+3),f
	decfsz	(??___lldiv+0)+0
	goto	u2345
	line	18
	
l2779:	
	movf	(___lldiv@divisor+3),w
	subwf	(___lldiv@dividend+3),w
	skipz
	goto	u2355
	movf	(___lldiv@divisor+2),w
	subwf	(___lldiv@dividend+2),w
	skipz
	goto	u2355
	movf	(___lldiv@divisor+1),w
	subwf	(___lldiv@dividend+1),w
	skipz
	goto	u2355
	movf	(___lldiv@divisor),w
	subwf	(___lldiv@dividend),w
u2355:
	skipc
	goto	u2351
	goto	u2350
u2351:
	goto	l2785
u2350:
	line	19
	
l2781:	
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
	
l2783:	
	bsf	(___lldiv@quotient)+(0/8),(0)&7
	goto	l2785
	line	21
	
l1590:	
	line	22
	
l2785:	
	movlw	01h
u2365:
	clrc
	rrf	(___lldiv@divisor+3),f
	rrf	(___lldiv@divisor+2),f
	rrf	(___lldiv@divisor+1),f
	rrf	(___lldiv@divisor),f
	addlw	-1
	skipz
	goto	u2365

	line	23
	
l2787:	
	movlw	low(01h)
	subwf	(___lldiv@counter),f
	btfss	status,2
	goto	u2371
	goto	u2370
u2371:
	goto	l2777
u2370:
	goto	l2789
	
l1591:	
	goto	l2789
	line	24
	
l1585:	
	line	25
	
l2789:	
	movf	(___lldiv@quotient+3),w
	movwf	(?___lldiv+3)
	movf	(___lldiv@quotient+2),w
	movwf	(?___lldiv+2)
	movf	(___lldiv@quotient+1),w
	movwf	(?___lldiv+1)
	movf	(___lldiv@quotient),w
	movwf	(?___lldiv)

	goto	l1592
	
l2791:	
	line	26
	
l1592:	
	return
	opt stack 0
GLOBAL	__end_of___lldiv
	__end_of___lldiv:
;; =============== function ___lldiv ends ============

	signat	___lldiv,8316
	global	___lmul
psect	text323,local,class=CODE,delta=2
global __ptext323
__ptext323:

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
psect	text323
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lmul.c"
	line	3
	global	__size_of___lmul
	__size_of___lmul	equ	__end_of___lmul-___lmul
	
___lmul:	
	opt	stack 6
; Regs used in ___lmul: [wreg+status,2+status,0]
	line	4
	
l2093:	
	movlw	0
	movwf	(___lmul@product+3)
	movlw	0
	movwf	(___lmul@product+2)
	movlw	0
	movwf	(___lmul@product+1)
	movlw	0
	movwf	(___lmul@product)

	goto	l2095
	line	6
	
l1488:	
	line	7
	
l2095:	
	btfss	(___lmul@multiplier),(0)&7
	goto	u721
	goto	u720
u721:
	goto	l2099
u720:
	line	8
	
l2097:	
	movf	(___lmul@multiplicand),w
	addwf	(___lmul@product),f
	movf	(___lmul@multiplicand+1),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u731
	addwf	(___lmul@product+1),f
u731:
	movf	(___lmul@multiplicand+2),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u732
	addwf	(___lmul@product+2),f
u732:
	movf	(___lmul@multiplicand+3),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u733
	addwf	(___lmul@product+3),f
u733:

	goto	l2099
	
l1489:	
	line	9
	
l2099:	
	movlw	01h
	movwf	(??___lmul+0)+0
u745:
	clrc
	rlf	(___lmul@multiplicand),f
	rlf	(___lmul@multiplicand+1),f
	rlf	(___lmul@multiplicand+2),f
	rlf	(___lmul@multiplicand+3),f
	decfsz	(??___lmul+0)+0
	goto	u745
	line	10
	
l2101:	
	movlw	01h
u755:
	clrc
	rrf	(___lmul@multiplier+3),f
	rrf	(___lmul@multiplier+2),f
	rrf	(___lmul@multiplier+1),f
	rrf	(___lmul@multiplier),f
	addlw	-1
	skipz
	goto	u755

	line	11
	movf	(___lmul@multiplier+3),w
	iorwf	(___lmul@multiplier+2),w
	iorwf	(___lmul@multiplier+1),w
	iorwf	(___lmul@multiplier),w
	skipz
	goto	u761
	goto	u760
u761:
	goto	l2095
u760:
	goto	l2103
	
l1490:	
	line	12
	
l2103:	
	movf	(___lmul@product+3),w
	movwf	(?___lmul+3)
	movf	(___lmul@product+2),w
	movwf	(?___lmul+2)
	movf	(___lmul@product+1),w
	movwf	(?___lmul+1)
	movf	(___lmul@product),w
	movwf	(?___lmul)

	goto	l1491
	
l2105:	
	line	13
	
l1491:	
	return
	opt stack 0
GLOBAL	__end_of___lmul
	__end_of___lmul:
;; =============== function ___lmul ends ============

	signat	___lmul,8316
	global	_I2C_Hold
psect	text324,local,class=CODE,delta=2
global __ptext324
__ptext324:

;; *************** function _I2C_Hold *****************
;; Defined at:
;;		line 76 in file "C:\Users\ELCOT\Desktop\PIC18\eeprom pic16\eeprom.c"
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
;;		_I2C_Read
;;		_I2C_Write
;;		_I2C_Begin
;;		_I2C_RSEN
;;		_I2C_End
;; This function uses a non-reentrant model
;;
psect	text324
	file	"C:\Users\ELCOT\Desktop\PIC18\eeprom pic16\eeprom.c"
	line	76
	global	__size_of_I2C_Hold
	__size_of_I2C_Hold	equ	__end_of_I2C_Hold-_I2C_Hold
	
_I2C_Hold:	
	opt	stack 5
; Regs used in _I2C_Hold: [wreg+status,2]
	line	77
	
l2763:	
;eeprom.c: 77: while ( (SSPCON2 & 0b00011111) || (SSPSTAT & 0b00000100) ) ;
	goto	l2765
	
l719:	
	goto	l2765
	
l718:	
	
l2765:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(145)^080h,w
	andlw	01Fh
	btfss	status,2
	goto	u2291
	goto	u2290
u2291:
	goto	l2765
u2290:
	
l2767:	
	btfsc	(148)^080h,(2)&7
	goto	u2301
	goto	u2300
u2301:
	goto	l2765
u2300:
	goto	l721
	
l720:	
	line	78
	
l721:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Hold
	__end_of_I2C_Hold:
;; =============== function _I2C_Hold ends ============

	signat	_I2C_Hold,88
psect	text325,local,class=CODE,delta=2
global __ptext325
__ptext325:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
