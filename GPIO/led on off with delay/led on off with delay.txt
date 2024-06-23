#include<htc.h>
void delay(int a);
void main()
{
TRISB=0X00;
TRISC=0X00;
TRISD=0X00;
PORTC=0XFF;
PORTD=0XFF;
while(1)
{
PORTB=0Xff;
delay(1000);
PORTB=0X00;
delay(1000);
}
}
void delay(int a)
{
int i,j;
for(i=0;i<a;i++)
{
for(j=0;j<250;j++)
{
}
}
}