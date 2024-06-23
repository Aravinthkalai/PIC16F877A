/* 
 * File:   LCD I2C.h
 * Author: Aravinth
 *
 * Created on September 26, 2020, 8:55 AM
 */

#ifndef LCD_I2C_H
#define	LCD_I2C_H
#define _XTAL_FREQ 20000000
#define I2C_BaudRate 100000
#define SCL_D TRISC3
#define SDA_D TRISC4
#define  SLAVE_ADDRESS_LCD 0X4E
void LCD_I2Cinit();
void lcd_init (void);
void lcd_send_string (char *str);
void lcd_send_cmd (unsigned char data);
void lcd_send_data (unsigned char data);
void I2C_Master_Init();
void I2C_start();
void I2C_Master_RepeatedStart();
void I2C_stop();
unsigned char I2C_write(unsigned char data);
unsigned char I2C_Read_Byte(void);
void LCD_I2Cinit()
{
    I2C_Master_Init();
    lcd_init();
}
void lcd_init (void)
{
 lcd_send_cmd (0x02);
 lcd_send_cmd (0x28);
 lcd_send_cmd (0x0c);
 lcd_send_cmd (0x80);
}
void lcd_send_string (char *str)
{
 while(*str)
  lcd_send_data(*str++);
}
void lcd_send_data (unsigned char data)
{
 unsigned char data_l, data_u;
 data_l = (data<<4)&0xf0;  //select lower nibble by moving it to the upper nibble position
 data_u = data&0xf0;  //select upper nibble

 I2C_start();
 I2C_write (SLAVE_ADDRESS_LCD);
 I2C_write (data_u|0x0D);  //enable=1 and rs =1
 I2C_write (data_u|0x09);  //enable=0 and rs =1

 I2C_write (data_l|0x0D);  //enable =1 and rs =1
 I2C_write (data_l|0x09);  //enable=0 and rs =1

 I2C_stop();
}
void lcd_send_cmd (unsigned char data)
{
 unsigned char data_l, data_u;
 data_l = (data<<4)&0xf0;  //select lower nibble by moving it to the upper nibble position
 data_u = data&0xf0;  //select upper nibble

 I2C_start();
 I2C_write (SLAVE_ADDRESS_LCD);
 I2C_write (data_u|0x0C);  //enable=1 and rs =0
 I2C_write (data_u|0x08);  //enable=0 and rs =0

 I2C_write (data_l|0x0C);  //enable =1 and rs =0
 I2C_write (data_l|0x08);  //enable=0 and rs =0

 I2C_stop();
}
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
void I2Creset()
{
    I2C_Master_Init();
}

#endif	/* LCD_I2C_H */

