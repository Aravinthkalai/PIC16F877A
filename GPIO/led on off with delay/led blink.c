#include<htc.h>
void delay(int a);
void main()
{
TRISD=0X00;
while(1)
{
PORTD=0X01;
delay(500);
PORTD=0X00;
delay(500);
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