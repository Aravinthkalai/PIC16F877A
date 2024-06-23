#include<htc.h>
#include"UART.h"
#include"lcd.h"
#include"ADC.h"

void main()
{
int i;
TRISB=0X00;
TRISC6=0;
TRISC7=1;
TRISC0=0;
TRISC1=0;
TRISC2=0;
TRISD=0;
TRISA0=1; //RA0 is input (ADC)
uart_init();
uart_tx('h');
lcd_int();
lcd_cmd(0x80);
show("Turbidity:");
lcd_cmd(0xc0);
show("pH:");
while(1)
{
		// for(i=0;i<2;i++)
		//{
 		//lcd_cmd(0xC0);// SECOUND ROW
 		adc(0);
        delay(500);
        adc(1);
        delay(500);
 		//delay(50);
 		//} 
         //uart_tx(uart_rx());
}
}

