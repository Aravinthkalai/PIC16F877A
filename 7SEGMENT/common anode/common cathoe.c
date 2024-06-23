#include<reg51.h>
void delay(int a);
void main()
{
	while(1)
	{
		P2=0x3f;
			delay(100);
		P2=0x06;
			delay(100);
		P2=0x5b;
			delay(100);
		P2=0x4f;
			delay(100);
		P2=0x66;
			delay(100);
		P2=0x6d;
			delay(100);
		P2=0x7c;
			delay(100);
		P2=0x07;
			delay(100);
		P2=0x7f;
			delay(100);
		P2=0x6f;
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