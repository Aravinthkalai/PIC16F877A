/*
 * File:   7 SEG SPI.c
 * Author: Aravinth
 *
 * Created on September 26, 2020, 7:45 AM
 */

#include<htc.h>
void SPI_Initialize_Master();
void SPI_Write(char incoming);
unsigned SPI_Ready2Read();
char SPI_Read();
void delay(int a);
void main()
{
	SPI_Initialize_Master();
    while(1) 
    {
        SPI_Write(0x0c);
        delay(1000);
        SPI_Write(0x77);
        delay(1000);
    }
}

void SPI_Initialize_Master()
{
     TRISC5 = 0; //
     SSPSTAT = 0b00000000; //pg 74/234
     SSPCON = 0b00100000; //pg 75/234
     TRISC3 = 0; //Set as output for slave mode
}

void SPI_Write(char incoming)
{
    SSPBUF = incoming; //Write the user given data into buffer
    while ( !SSPSTATbits.BF );
}
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
