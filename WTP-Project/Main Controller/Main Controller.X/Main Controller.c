/*
    ph--C7
 * TU--9B
 * CI--DB
 */


#include<htc.h>
#include"lcd.h"
void uart_init();
void uart_tx(char ch);
char uart_rx();
void delay(int L);
void out();
void in();
void timer_init();
unsigned char a;
int i;
int n,m;
int count=0;
char l[20],p[12];
void main()
{
TRISB=0X00;
TRISD=0X00;
TRISC6=0;
TRISC7=1;
TRISC0=0;
TRISC1=0;
TRISC2=0;
PORTD=0X00;
lcd_int();
lcd_cmd(0xc0);
show("pH");
lcd_cmd(0x94);
show("TU");
lcd_cmd(0xD4);
show("CI");
lcd_cmd(0x85);
show("INLET");
lcd_cmd(0x8c);
show("OUTLET");
/*lcd_cmd(0x8a);
show("OUTLET");*/
uart_init();
uart_tx('h');
/*A     B
 * 0    0    X0 Y0 
 * 1    0    X1 Y1 
 * 0    1    X2 Y2
 * 1    1    X3 Y3           

 * 
 */

PORTD=0X00;
while(1)
{
   // lcd_cmd(0x8a);
    //lcd_dat((count+48));
    if(count==0)
    {
        PORTD=0X00;
        out();
     //   count++;
    }
    if(count==1)
    {
        PORTD=0X01;
        in();
        //count=0;
    }
}
}
void uart_init()
{
TXSTA=0X24;
RCSTA=0X90;
BRGH=1;
SPBRG=129;
}
void uart_tx(char ch)
{
	TXREG=ch;
	while(TXIF==0);
	TXIF=0;
}
char uart_rx()
{	
	while(RCIF==0);
	RCIF=0;
	return RCREG;
}
void delay(int L)
{
	int i,j;
	for(i=0;i<L;i++)
	{
		for(j=0;j<250;j++)
		{
		}
	}
}
void out()
{
    PORTD=0X00;
       a=uart_rx();
                if(a=='P')
                {
                    a=uart_rx();
                    if(a=='H')
                    {
                        a=uart_rx();
                        if(a=='O')
                        {
                        for(i=0;i<16;i++)
                        {
                            l[i]=uart_rx();
                            //lcd_dat(l[i]);
                        }
                                
                      //          PORTD=0X01;
                      //  lcd_cmd(0x80);
                        for(i=0;i<16;i++)
                        {
                            
                            if(i==0||i==1)//pH
                            {
                                lcd_cmd(0xce);
                                lcd_dat(l[0]);
                                lcd_dat(l[1]);
                            }
                            if(i>=5&&i<=8)//CL
                            {
                                lcd_cmd(0xe2);
                                lcd_dat(l[5]);
                                lcd_dat(l[6]);
                                lcd_dat(l[7]);
                                lcd_dat(l[8]);
                                
                            }
                            if(i>=12&&i<=15)//TU
                            {
                                lcd_cmd(0xa2);
                                lcd_dat(l[12]);
                                lcd_dat(l[13]);
                                lcd_dat(l[14]);
                                lcd_dat(l[15]); 
                                //if(i==15)
                                //{
                                  //  count++;
                                //}
                            }
                            }
                        count++;
                        }
                    }
}
}

void in()
{
    PORTD=0X01;
       a=uart_rx();
                if(a=='P')
                {
                    a=uart_rx();
                    if(a=='H')
                    {
                        a=uart_rx();
                        if(a=='I')
                        {
                        for(i=0;i<9;i++)
                        {
                            p[i]=uart_rx();
                           // lcd_dat(p[i]);
                        }
            //             PORTD=0X00;
                        //count=0;//lcd_cmd(0xc5);
                        for(i=0;i<9;i++)
                        {
                            
                            if(i==0||i==1)//pH
                            {
                                lcd_cmd(0xc7);
                                lcd_dat(p[0]);
                                lcd_dat(p[1]);
                            }
                            if(i>=5&&i<=8)//CL
                            {
                                lcd_cmd(0x9B);
                                lcd_dat(p[5]);
                                lcd_dat(p[6]);
                                lcd_dat(p[7]);
                                lcd_dat(p[8]);
                            //    if(i==8)
                             //   {
                               //     count=0;
                               // }
                            }
                            
                            
                            }
                        count=0;
                        }
                    }
}
}
