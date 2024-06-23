#include<htc.h>
#define _XTAL_FREQ 20000000
void main()
{
	int a=0;	
	TRISC2=0;
	T2CON = 0b00000111; // prescaler + turn on TMR2;
	TMR2=0X00;
	PR2 = 0b00011110;	
	CCPR1L = 0b01001110;  // set duty MSB
	CCP1CON = 0b00011100; // duty lowest bits + PWM mode
	while(1)
	{
		for(a=0;a<255;a++)
		{
			CCPR1L=a;
			__delay_ms(100);
		}
	}
}