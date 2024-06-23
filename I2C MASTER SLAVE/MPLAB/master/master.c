
#include<htc.h>
#define _XTAL_FREQ 20000000
void I2C_Initialize(const unsigned long feq_K); //Begin IIC as master
void I2C_Hold();
void I2C_Begin();
void I2C_End();
void I2C_Write(unsigned data);
unsigned short I2C_Read(unsigned short ack);
void main()
{
I2C_Initialize(100);
    while(1)
  {
   I2C_Begin();      
   I2C_Write(0xD0);
   I2C_Write(0x88);
   //I2C_Write(0xFF);
   I2C_End();
   __delay_ms(1000);
  }
}
void I2C_Initialize(const unsigned long feq_K) //Begin IIC as master
{
	 TRISC3 = 1;  
	 TRISC4 = 1; 
   SSPCON  = 0b00101000;    //pg84/234
  SSPCON2 = 0b00000000;    //pg85/234
  SSPADD = (_XTAL_FREQ/(4*feq_K*100))-1; //Setting Clock Speed pg99/234
  SSPSTAT = 0b00000000;    //pg83/234
}
void I2C_Hold()
{
    while (   (SSPCON2 & 0b00011111)    ||    (SSPSTAT & 0b00000100)   ) ; //check the this on registers to make sure the IIC is not in progress
}
void I2C_Begin()
{
  I2C_Hold();  //Hold the program is I2C is busy 
  SEN = 1;     //Begin IIC pg85/234
}
void I2C_End()
{
  I2C_Hold(); //Hold the program is I2C is busy 
  PEN = 1;    //End IIC pg85/234
}
void I2C_Write(unsigned data)
{
  I2C_Hold(); //Hold the program is I2C is busy
  SSPBUF = data;         //pg82/234
}
unsigned short I2C_Read(unsigned short ack)
{
  unsigned short incoming;
  I2C_Hold();
  RCEN = 1;

  I2C_Hold();
  incoming = SSPBUF;      //get the data saved in SSPBUF

  I2C_Hold();
  ACKDT = (ack)?0:1;    //check if ack bit received 
  ACKEN = 1;          //pg 85/234
  return incoming;
}
