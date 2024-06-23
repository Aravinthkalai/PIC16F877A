/*
 * File:   7 SEG SPI.c
 * Author: Aravinth
 *
 * Created on September 26, 2020, 7:45 AM
 */

#include<htc.h>
#define cs RC2
int arr[10]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7c,0x07,0x7f,0x6f};
int ar2[8]={0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08};
void SPI_Initialize_Master();
void SPI_Write(unsigned char cmd, unsigned char data);
unsigned SPI_Ready2Read();
char SPI_Read();
void delay(int a);
void main()
{
    cs=1;
	int a,b,c,d,e,f,g,h,i;
	SPI_Initialize_Master();
	a=b=c=d=e=f=g=h=0;
	SPI_Write(0x0a,0xf);//highest intensity
	SPI_Write(0x0b,0x07);//scan limit set to max 
	SPI_Write(0x0c,0x01);//select normal normal operation instead of shutdwn mode
	for(i=0;i<9;i++)
	{
		SPI_Write(ar2[i],arr[0]);
		delay(10);
	}
	 while(1) 
    {
		SPI_Write(ar2[7],arr[a]);
		SPI_Write(ar2[6],arr[b]);
		SPI_Write(ar2[5],arr[c]);
		SPI_Write(ar2[4],arr[d]);
		SPI_Write(ar2[3],arr[e]);
		SPI_Write(ar2[2],arr[f]);
		SPI_Write(ar2[1],arr[g]);
		SPI_Write(ar2[0],arr[h]);
		a++;
		if(a==10)
		{
			a=0;
			b++;
		}
		if(b==10)
		{
			a=b=0;
			c++;
		}
		if(c==10)
		{
			a=b=c=0;
			d++;
		}
		if(d==10)
		{
			a=b=c=d=0;
			e++;
		}
		if(e==10)
		{
			a=b=c=d=e=0;
			f++;
		}
		if(f==10)
		{
			a=b=c=d=e=f=0;
			g++;
		}
		if(g==10)
		{
			a=b=c=d=e=g=f=0;
			h++;
		}
		if(h==10)
		{
				a=b=c=d=e=g=f=h=0;
		}
		delay(100);
    }
}

void SPI_Initialize_Master()
{
     TRISC5 = 0; //
     TRISC2=0;//SS pin as output
     SSPSTAT = 0b00000000; //pg 74/234
     SSPCON = 0b00100000; //pg 75/234
     TRISC3 = 0; //Set as output for slave mode
}

/*void SPI_Write(char incoming)
{
    SSPBUF = incoming; //Write the user given data into buffer
}*/
unsigned SPI_Ready2Read()
{
    if (SSPSTAT & 0b00000001)
        return 1;
    else
        return 0;
}

char SPI_Read() //Read the received data
{
    while ( !SSPSTATbits.BF ); // Hold till BF bit is set, to make sure the complete data is read
    return(SSPBUF); // return the read data
}
/*void SPI_Initialize_Slave()
{
     TRISC5 = 0; // SDO pin should be declared as output
     SSPSTAT = 0b00000000; //pg 74/234
     SSPCON = 0b00100000; //pg 75/234
     TRISC3 = 1; //Set as in out for master mode
}*/

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

void SPI_Write(unsigned char cmd, unsigned char data)
{
cs=0;
SSPBUF = cmd; //Write the user given data into buffer
while ( !SSPSTATbits.BF );
SSPBUF = data; //Write the user given data into buffer
while ( !SSPSTATbits.BF );
cs=1;
}
