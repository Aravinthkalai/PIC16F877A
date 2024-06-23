#include<htc.h>
#define SW RB0
#define relay RD0
void main()
{
	TRISD=0X00;
	TRISB=0X01;
while(1)
{
	if(SW==0)
	{
		relay=1;
	}
	else
	{
		relay=0;
	}
}	
}