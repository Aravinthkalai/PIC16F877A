#define _XTAL_FREQ 20000000
#include <htc.h>
void I2C_Initialize(const unsigned long feq_K);
unsigned short I2C_Read(unsigned short ack);
void I2C_Write(unsigned data);
void I2C_Begin();
void I2C_RSEN();
void I2C_End();
void I2C_Hold();
void I2C_EEPROMWrite(unsigned int adddress, unsigned int data);
char I2C_EEPROMRead(unsigned int adddress);
char temp=0;
int main()
{
    TRISD=0X00;
    I2C_Initialize(100); //Initialize I2C Master with 100KHz clock
    I2C_EEPROMWrite(0x27,0xA2);
    PORTD=I2C_EEPROMRead(0X27);
while(1)
  {
  /* I2C_Begin();       
   I2C_Write(0xD0); 
    I2C_Write(0x55); 
   I2C_End();
    __delay_ms(1000);
 	I2C_Begin();       
   I2C_Write(0xD0); 
    I2C_Write(0x88); 
   I2C_End();
    __delay_ms(1000);*/
    
  /*I2C_Begin();       
   I2C_Write(0x52); 
   I2C_Write(0x20); 
   I2C_Write(0x30); 
   I2C_End();  
   __delay_ms(1000);*/
}
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
void I2C_Write(unsigned data)
{
  I2C_Hold(); //Hold the program is I2C is busy
  SSPBUF = data;         //pg82/234
}
void I2C_Begin()
{
  I2C_Hold();  //Hold the program is I2C is busy 
  SEN = 1;     //Begin IIC pg85/234
}
void I2C_RSEN()
{
  I2C_Hold();  //Hold the program is I2C is busy 
  RSEN = 1;     //Begin IIC pg85/234
}
void I2C_End()
{
  I2C_Hold(); //Hold the program is I2C is busy 
  PEN = 1;    //End IIC pg85/234
}
void I2C_Hold()
{
    while (   (SSPCON2 & 0b00011111)    ||    (SSPSTAT & 0b00000100)   ) ; //check the this on registers to make sure the IIC is not in progress
}
void I2C_Initialize(const unsigned long feq_K) //Begin IIC as master
{
  TRISC3 = 1;  
  TRISC4 = 1;  //Set SDA and SCL pins as input pins

  SSPCON = 0b00101000;    //pg84/234
  SSPCON2 = 0b00000000;    //pg85/234

  SSPADD = (_XTAL_FREQ/(4*feq_K*100))-1; //Setting Clock Speed pg99/234
  SSPSTAT = 0b00000000;    //pg83/234
}
void I2C_EEPROMWrite(unsigned int adddress, unsigned int data)
{
   I2C_Begin();       
   I2C_Write(0xA0); 
   temp=(adddress>>4);
    I2C_Write(temp);
   I2C_Write(adddress);
   I2C_Write(data);  
   I2C_End();
   __delay_ms(200);
}
char I2C_EEPROMRead(unsigned int adddress)
{
   I2C_Begin();       
   I2C_Write(0xA0);
   temp=(adddress>>4);
   I2C_Write(temp);
   I2C_Write(adddress);
  //I2C_End();
 // __delay_ms(10);
  I2C_RSEN();   
   I2C_Write(0xA1); 
   temp=I2C_Read(1) ;
   I2C_End();
   return temp;
}