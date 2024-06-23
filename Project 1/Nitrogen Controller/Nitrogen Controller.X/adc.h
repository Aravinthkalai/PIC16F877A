/* 
 * File:   adc.h
 * Author: Aravinth
 *
 * Created on September 25, 2020, 6:39 AM
 */

#ifndef ADC_H
#define	ADC_H
#define senmax 150
#define adcmax 1023
void adc();
void acd_init();
unsigned long int adcval,temp;
int d1=0,d2=0,d3=0,d4=0;
void acd_init()
 {
  TRISA0=1; //RA0 is input (ADC)
  ADCON1=0x80; //right justified
  ADCON0=0x45; //adc on, fosc/8,GO_nDONE BIT 1  
 }
void adc()
{
 while(GO_nDONE==1); //wait until conversion is finished
 temp=((ADRESH<<8)+(ADRESL)); //store the result
 adcval=((temp*150)/1023);
 SPI_Write(ar2[3],arr[(adcval/1000)]);//ar2-->display numer, arr- hex code
 SPI_Write(ar2[2],arr[(adcval/100)%10]);//ar2-->display numer, arr- hex code
 SPI_Write(ar2[1],arr[(adcval/10)%10]);//ar2-->display numer, arr- hex code
 SPI_Write(ar2[0],arr[(adcval%10)]);//ar2-->display numer, arr- hex code
 GO_nDONE=1;
 //delay(10);
}




#endif	/* ADC_H */

