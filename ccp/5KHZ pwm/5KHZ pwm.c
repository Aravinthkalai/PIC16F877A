#include<htc.h>
#define _XTAL_FREQ 20000000
void main()
	 {
		 int i;
		 TRISC2=0;
		 CCP1CON=0b00001100;
		 T2CON=0b00000010;
		 PR2=61;
		 for(i=0;i<58;i++)
			 {
			 CCPR1L=i;
			 TMR2IF=0;
			 TMR2=0X00;
			 TMR2ON=1;
			 while(TMR2IF==0);
			 __delay_ms(100);
			 }
		 while(1)
		 {
			 
		 }
	}