#include<htc.h>
void delay(int a);
void main()
{
	TRISC=0X00;
	int i;
	char array[]={0x01,0x03,0x02,0x06,0x04,0x0c,0x08,0x09};
    while (1) 
    {
		for(i=0;i<8;i++)
		{
			PORTC=array[i];
			delay(1000);
		}
    }
}


	void delay(int a)
	{
		int i,j;
		for(i=0;i<a;i++)
		{
		for(j=0;j<100;j++)
			{
			}
		}
	}
