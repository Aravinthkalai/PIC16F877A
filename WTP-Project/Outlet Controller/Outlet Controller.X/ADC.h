void adc(int i);
void adc_ph();
void adc_turb();
void adc_chlor();
void converter_dispph(unsigned long int b);
void converter_uartph(unsigned long int b);
void converter_disptu(unsigned long int b);
void converter_uarttu(unsigned long int b);
void converter_dispch(unsigned long int b);
void converter_uartch(unsigned long int b);
void adc(int i)
{
    if(i==0)
    {
//switch(i)
  //{
   //case 0:Turbi
     ADCON0=0X4D;//AN1
     lcd_cmd(0x8b);
     adc_turb();
    }
    if(i==1)
    {
     //break;pH
   //case 1:
    ADCON0=0X55;//AN2
    lcd_cmd(0xc3);
    adc_ph();
    }
    if(i==2)
    {
    ADCON0=0X5D;//chlor
    lcd_cmd(0xcc);
    adc_chlor();
    //break;
  /* case 2:  

   break; */
    }
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
 converter_dispph(a);
 uart_string("PHO");
 converter_uartph(a);
 /*lcd_dat((a/1000)+48);
 lcd_dat(((a/100)%10)+48);
 lcd_dat(((a/10)%10)+48);
 lcd_dat((a%10)+48);
*/delay(50); 
}
void adc_turb()
{	
 unsigned long int temp,a,b;
 ADCON1=0x80; //right justified
// ADCON0=0x45; //adc on, fosc/8,GO_nDONE BIT 1
 while(GO_nDONE==1); //wait until conversion is finished
 temp=((ADRESH<<8)+(ADRESL)); //store the result
 a=((temp*10)/1023);
 converter_disptu(a);
 uart_string("TUO");
 converter_uarttu(a);
 /*lcd_dat((b/1000)+48);
 lcd_dat(((b/100)%10)+48);
 lcd_dat(((b/10)%10)+48);
 lcd_dat((b%10)+48);*/ 
 //uart_string((char)a);
 delay(50);
}
void adc_chlor()
{	
 unsigned long int temp,a;
 ADCON1=0x80; //right justified
// ADCON0=0x45; //adc on, fosc/8,GO_nDONE BIT 1
 while(GO_nDONE==1); //wait until conversion is finished
 temp=((ADRESH<<8)+(ADRESL)); //store the result
 a=((temp*5)/1023);
 converter_dispch(a);
 uart_string("CLO");
 converter_uartch(a);
 /*lcd_dat((a/1000)+48);
 lcd_dat(((a/100)%10)+48);
 lcd_dat(((a/10)%10)+48);
 lcd_dat((a%10)+48);
*/delay(50); 
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

    //lcd_dat((b/1000)+48);
    //lcd_dat(((b/100)%10)+48);
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
void converter_dispch(unsigned long int b)
{

    //lcd_dat((b/1000)+48);
    //lcd_dat(((b/100)%10)+48);
    //lcd_dat(((b/10)%10)+48);
    lcd_dat((b%10)+48);
}

void converter_uartch(unsigned long int b)
{

    uart_tx((b/1000)+48);
    uart_tx(((b/100)%10)+48);
    uart_tx(((b/10)%10)+48);
    uart_tx((b%10)+48);
}
