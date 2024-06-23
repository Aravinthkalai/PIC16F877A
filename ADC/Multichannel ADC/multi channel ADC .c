#include<htc.h>
#include<stdio.h>
#define rs RC4
#define rw RC5
#define e RC6
void adc(int i);
void lcd_int();
void cmd(char a);
void dat(char b);
void show(char *s);
void delay(int L);
void adc_con();
void main()
{
 int i;
 TRISD=0;
 TRISC=0; //Port D and Port C is Output (LCD)
 TRISA0=1; //RA0 is input (ADC)
 lcd_int();
 show("ADC Value :");
 while(1) 
	 {
		 for(i=0;i<2;i++)
		 {
 		cmd(0xC0);// SECOUND ROW
 		adc(i);
 		delay(50);
 		}
 	}
}
void lcd_int()
{
 cmd(0x38);
 cmd(0x0c);
 cmd(0x06);
 cmd(0x80);
}
 
void cmd(char a)
{
 PORTD=a;
 rs=0;
 rw=0;
 e=1;
 delay(10);
 e=0;
}
 
void dat(char b)
{
 PORTD=b;
 rs=1;
 rw=0;
 e=1;
 delay(10);
 e=0;
} 
 
void show(char *s)
{
 while(*s) 
	 {
 dat(*s++);
 }
}
 
void adc(int i)
{
switch(i)
  {
   case 0:
     ADCON0=0X4D;
     cmd(0xc0);
     adc_con();
     break;
   case 1:
    ADCON0=0X55;
    cmd(0xc6);
    adc_con();
   break;
   case 2:    ADCON0=0X55;
    cmd(0xca);
    adc_con();
   break;
  }
}
void adc_con()
{	
 unsigned int adcval;
 ADCON1=0x80; //right justified
// ADCON0=0x45; //adc on, fosc/8,GO_nDONE BIT 1
 while(GO_nDONE==1); //wait until conversion is finished
 adcval=((ADRESH<<8)+(ADRESL)); //store the result
 dat((adcval/1000)+48);
 dat(((adcval/100)%10)+48);
 dat(((adcval/10)%10)+48);
 dat((adcval%10)+48); 
}
void delay(int L)
{
	int i,j;
	for(i=0;i<L;i++)
	{
		for(j=0;j<250;j++)
		{
		}
	}
}