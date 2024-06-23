#include<htc.h>
#define R0 RD0
#define R1 RD1
#define R2 RD2
#define R3 RD3
#define C0 RD4
#define C1 RD5
#define C2 RD6
void seg(unsigned int);
void main()
{
	TRISD=0X00;
	TRISC=0X00;
	R0=R1=R2=R3=1;
	R0=0;
	{
	if(C0==0)
		seg(0xf9);
	R0=R1=R2=R3=1;
	R0=0;
	if(C1==0)
		seg(0xa4);
	R0=R1=R2=R3=1;
	R0=0;
	if(C2==0)
		seg(0xb0);
	}	
	R0=R1=R2=R3=1;
	R1=0;
	{
	if(C0==0)
		seg(0x99);
	R0=R1=R2=R3=1;
	R1=0;
	if(C1==0)
		seg(0x92);
	R0=R1=R2=R3=1;
	R1=0;
	if(C2==0)
		seg(0x82);
	}	
R0=R1=R2=R3=1;
	R2=0;
	{
	if(C0==0)
		seg(0xf8);
R0=R1=R2=R3=1;
	R2=0;
	if(C1==0)
		seg(0x80);
R0=R1=R2=R3=1;
	R2=0;
	if(C2==0)
		seg(0x90);	
}
}
void seg(unsigned int ch)
{
	PORTC=0xff;
	PORTC=ch;
}