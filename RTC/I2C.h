#define _XTAL_FREQ 20000000
#define I2C_BaudRate 100000
#define SCL_D TRISC3
#define SDA_D TRISC4
void I2C_Master_Init()
{
  SSPCON = 0x28;
  SSPCON2 = 0x00;
  SSPSTAT = 0x00;
  SSPADD = ((_XTAL_FREQ/4)/I2C_BaudRate) - 1;
  SCL_D = 1;
  SDA_D = 1;
}
 
void I2C_Master_Wait()
{
  while ((SSPSTAT & 0x04) || (SSPCON2 & 0x1F));
}
 
void I2C_start()
{
  I2C_Master_Wait();
  SEN = 1;
}
void I2C_restart()
{
  I2C_Master_Wait();
  RSEN = 1;
}
 
void I2C_Master_RepeatedStart()
{
  I2C_Master_Wait();
  RSEN = 1;
}
 
void I2C_stop()
{
  I2C_Master_Wait();
  PEN = 1;
}
 
void I2C_ACK(void)
{
  ACKDT = 0; // 0 -> ACK
  I2C_Master_Wait();
  ACKEN = 1; // Send ACK
}
 
void I2C_NACK(void)
{
  ACKDT = 1; // 1 -> NACK
  I2C_Master_Wait();
  ACKEN = 1; // Send NACK
}
 unsigned char I2C_write(unsigned char data)
{
  I2C_Master_Wait();
  SSPBUF = data;
  while(!SSPIF); // Wait Until Completion
  SSPIF = 0;
  return ACKSTAT;
}
 
unsigned char I2C_Read_Byte(void)
{
  //---[ Receive & Return A Byte ]---
  I2C_Master_Wait();
  RCEN = 1; // Enable & Start Reception
  while(!SSPIF); // Wait Until Completion
  SSPIF = 0; // Clear The Interrupt Flag Bit
  I2C_Master_Wait();
  return SSPBUF; // Return The Received Byte
}