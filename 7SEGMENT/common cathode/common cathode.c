#include<htc.h>
void delay(int a);
void main()
{
	TRISD=0X00;
	while(1)
	{
		PORTD=0x3f;
			delay(100);
		PORTD=0x06;
			delay(100);
		PORTD=0x5b;
			delay(100);
		PORTD=0x4f;
			delay(100);
		PORTD=0x66;
			delay(100);
		PORTD=0x6d;
			delay(100);
		PORTD=0x7c;
			delay(100);
		PORTD=0x07;
			delay(100);
		PORTD=0x7f;
			delay(100);
		PORTD=0x6f;
			delay(100);
}
	}
void delay(int a)
{
	int i,j;
	for(i=0;i<a;i++)
	{
		for(j=0;j<1000;j++)
		{
		}
		
	}
}