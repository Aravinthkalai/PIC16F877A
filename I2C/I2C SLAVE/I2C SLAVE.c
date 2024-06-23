#define _XTAL_FREQ 20000000
#include <htc.h>
void I2C_Slave_Init(short address);
short z;
int main()
{
 nRBPU = 0;            //Enables PORTB internal pull up resistors
  TRISB = 0xFF;         //PORTB as input
  TRISD = 0x00;         //PORTD as output
  PORTD = 0x00;         //All LEDs OFF
  I2C_Slave_Init(0xD0); 
 while(1)
 {	 
 }
}
void I2C_Slave_Init(short address)
{
  SSPSTAT = 0x80;
  SSPADD = address;
  SSPCON = 0x36;
  SSPCON2 = 0x01;
  TRISC3 = 1;   //Setting as input as given in datasheet
  TRISC4 = 1;   //Setting as input as given in datasheet
  GIE = 1;
  PEIE = 1;
  SSPIF = 0;
  SSPIE = 1;
}
void interrupt I2C_Slave_Read()
{
  if(SSPIF == 1)
  {
    SSPCONbits.CKP = 0;

    if ((SSPCONbits.SSPOV) || (SSPCONbits.WCOL))
    {
      z = SSPBUF; // Read the previous value to clear the buffer
      SSPCONbits.SSPOV = 0; // Clear the overflow flag
      SSPCONbits.WCOL = 0;  // Clear the collision bit
      SSPCONbits.CKP = 1;
    }

    if(!SSPSTATbits.D_nA && !SSPSTATbits.R_nW)
    {
      z = SSPBUF;
      while(!BF);
      PORTD = SSPBUF;
      SSPCONbits.CKP = 1;
    }
    else if(!SSPSTATbits.D_nA && SSPSTATbits.R_nW)
    {
      z = SSPBUF;
      BF = 0;
      SSPBUF = PORTB ;
      SSPCONbits.CKP = 1;
      while(SSPSTATbits.BF);
    }
    SSPIF = 0;
  }
}
