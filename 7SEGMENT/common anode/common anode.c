#include<htc.h>
void delay(int a);
void main()
{
	TRISD=0X00;
	int i;
	int array[]={0x40,0xf9,0x24,0x30,0x19,0x12,0x03,0xf8,0x00,0x10};
	while(1)
	{
		for(i=0;i<10;i++)
		{
			PORTD=array[i];
			delay(100);
		}
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