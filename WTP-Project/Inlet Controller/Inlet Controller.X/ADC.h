/* 
 * File:   ADC.h
 * Author: Aravinth
 *
 * Created on January 11, 2021, 10:36 AM
 */

void adc(int i);
void adc_ph();
void adc_turb();
void converter_dispph(unsigned long int b);
void converter_uartph(unsigned long int b);
void converter_disptu(unsigned long int b);
void converter_uarttu(unsigned long int b);
void adc(int i)
{
    if(i==0)
    {
//switch(i)
  //{
   //case 0:
     ADCON0=0X4D;
     lcd_cmd(0x8b);
     adc_turb();
    }
    if(i==1)
    {
     //break;
   //case 1:
    ADCON0=0X55;
    lcd_cmd(0xc4);
    adc_ph();
    }
    //break;
  /* case 2:    ADCON0=0X55;
    lcd_cmd(0xc4);
    adc_turb();
   break; */
 // }
}
void adc_ph()
{	
 unsigned long int temp,a;
 ADCON1=0x80; //right justified
// ADCON0=0x45; //adc on, fosc/8,GO_nDONE BIT 1
 while(GO_nDONE==1); //wait until conversion is finished
 temp=((ADRESH<<8)+(ADRESL)); //store the result
 a=((temp*14)/1023);
 uart_string("PHI");
 converter_uartph(a);
 converter_dispph(a);
 /*lcd_dat((a/1000)+48);
 lcd_dat(((a/100)%10)+48);
 lcd_dat(((a/10)%10)+48);
 lcd_dat((a%10)+48);
*/delay(100); 
}
void adc_turb()
{	
 unsigned long int temp,a,b;
 ADCON1=0x80; //right justified
// ADCON0=0x45; //adc on, fosc/8,GO_nDONE BIT 1
 while(GO_nDONE==1); //wait until conversion is finished
 temp=((ADRESH<<8)+(ADRESL)); //store the result
 a=((temp*2000)/1023);
 uart_string("TUI");
 converter_uarttu(a);
 converter_disptu(a);
 /*lcd_dat((b/1000)+48);
 lcd_dat(((b/100)%10)+48);
 lcd_dat(((b/10)%10)+48);
 lcd_dat((b%10)+48);*/ 
 //uart_string((char)a);
 delay(100);
}
void converter_dispph(unsigned long int b)
{

    //lcd_dat((b/1000)+48);
    //lcd_dat(((b/100)%10)+48);
    lcd_dat(((b/10)%10)+48);
    lcd_dat((b%10)+48);
}

void converter_uartph(unsigned long int b)
{

    //uart_tx((b/1000)+48);
    //uart_tx(((b/100)%10)+48);
    uart_tx(((b/10)%10)+48);
    uart_tx((b%10)+48);
}
void converter_disptu(unsigned long int b)
{

    lcd_dat((b/1000)+48);
    lcd_dat(((b/100)%10)+48);
    lcd_dat(((b/10)%10)+48);
    lcd_dat((b%10)+48);
}

void converter_uarttu(unsigned long int b)
{

    uart_tx((b/1000)+48);
    uart_tx(((b/100)%10)+48);
    uart_tx(((b/10)%10)+48);
    uart_tx((b%10)+48);
}