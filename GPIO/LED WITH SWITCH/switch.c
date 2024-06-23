#include<htc.h>
#define sw RC0
#define led RD0
void main()
{
	TRISD=0X00;
	TRISC=0XFF;
	PORTD=0X00;
	while(1)
	{
	if(sw==1)
	{
		led=0;
				}
	else
		{
			led=1;
					}
	}
}