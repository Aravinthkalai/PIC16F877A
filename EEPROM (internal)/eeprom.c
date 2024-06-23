#include<htc.h>
#define display_port PORTC      //Data pins connected to port 2 on microcontroller
#define rs RB0 //RS pin connected to pin 2 of port 3
#define rw RB1  // RW pin connected to pin 3 of port 3
#define e RB2  //E pin connected to pin 4 of port 3
void EEwrite(unsigned char data, unsigned char address);
char EEread(unsigned char address);
void msdelay(unsigned int time)  // Function for creating delay in milliseconds.
{
    unsigned i,j ;
    for(i=0;i<time;i++)    
    for(j=0;j<1275;j++);
}
void lcd_cmd(unsigned char command)  //Function to send command instruction to LCD
{
    display_port = command;
    rs=0;
    rw=0;
    e=1;
    msdelay(1);
    e=0;
}

void lcd_data(unsigned char disp_data)  //Function to send display data to LCD
{
    display_port = disp_data;
    rs=1;
    rw=0;
    e=1;
    msdelay(1);
    e=0;
}

 void lcd_init()    //Function to prepare the LCD  and get it ready
{
    lcd_cmd(0x38);  // for using 2 lines and 5X7 matrix of LCD
    msdelay(10);
    lcd_cmd(0x0F);  // turn display ON, cursor blinking
    msdelay(10);
    lcd_cmd(0x01);  //clear screen
    msdelay(10);
    lcd_cmd(0x80);  // bring cursor to position 1 of line 1
    msdelay(10);
}
void lcd_string(unsigned char *str)
{
	int k=0;
	while(str[k]!='\0')
	{
		lcd_data(str[k]);
		k++;
	}
}
void main()
{
	unsigned char a;
	TRISC=0X00;
	PORTC=0XFF;
	TRISB=0X00;
	PORTB=0XFF;
	EEDATA=0X00;
	EEADR=0X00;
	lcd_init();
	lcd_string("Data: ");
	lcd_cmd(0x88);
while(1)
{
	if(RD0==0)
	{
		EEwrite('2',0XA0);
		msdelay(50);
	}
	if(RD5==0)
	{
		a=EEread(0xA0);
		lcd_data(a);
		msdelay(50);
	}
}
}
char EEread(unsigned char address)
{
	unsigned char byte;
	EEADR=address;//write address to EEADR to fetch data
	EEPGD=0;// disable EEPGD to point EEPROM data memory
	RD=1;//set RD bit to mention read operation
	byte=EEDATA;// read data from EEFDATA and move to temp variabble
	return byte;//send data to function call
}
void EEwrite(unsigned char data, unsigned char address)
{
	EEADR=address;// mention address on EEADR to store data
	EEDATA=data;// load actual data to EEDATA 
	EEPGD=0;// diable EEPGD to point EEPROM data memory
	WREN=1;// write enable
	EECON2=0X55;//execute special five instruction sequence
	EECON2=0XAA;//execute special five instruction sequence
	WR=1;//write data
	while(EEIF==0);// check interrupt flag
	WREN=0;// stop write process
	EEIF=0;	// clear flag
}