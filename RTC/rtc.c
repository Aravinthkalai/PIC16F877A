#include<htc.h>
#include "I2C.h"
#define RS RB0
#define RW RB1
#define EN RB2
void string(unsigned char *str);
void  lcd_init();
void cmd(unsigned char ch);
void data(unsigned char ch);
void delay(int a);
unsigned char up(unsigned char bcd);
unsigned char lo(unsigned char bcd);
unsigned char rtc_read(unsigned char address);
void I2C_Master_Init();
void I2C_Master_Wait();
void I2C_start();
void I2C_Master_RepeatedStart();
void I2C_restart();
void I2C_stop();
void I2C_ACK(void);
void I2C_NACK(void);
unsigned char I2C_write(unsigned char data);
unsigned char I2C_Read_Byte(void);
unsigned char sec,min,hour,date,month,year;
int main ()
{
    TRISD=0X00;
    TRISB=0X00;
   lcd_init();
   string("WELCOME");
    cmd(0xc0);
    string("ARAVINTH");
    delay(200);
    cmd(0x01);
   I2C_Master_Init();
    delay(100);
    I2C_start();
    I2C_write(0XD0);
    I2C_write(0X00);//location address
    I2C_write(0X80);//CH=1 disable
    I2C_write(0X59);//59th min
    I2C_write(0X24);//24th hr
    I2C_write(0X01);//monday
    I2C_write(0X16);//monday
    I2C_write(0X03);//march month
    I2C_write(0X20);//2020th year
    I2C_stop();
    delay(100);
    I2C_start();
    I2C_write(0XD0);
    I2C_write(0X00);
    I2C_write(0X05);//time
    //I2C_write(0X10);
    I2C_stop();
    delay(100);
    while (1)
    {
	sec=rtc_read(0x00);
        min=rtc_read(0x01);
        hour=rtc_read(0x02);
        date=rtc_read(0x04);
        month=rtc_read(0x05);
        year=rtc_read(0x06);
        //delay(100);
        cmd(0x80);
        string("Time");
        cmd(0x85);
        data(up(date));
        data(lo(date));
         data(':');
        data(up(hour));
        data(lo(hour));
        data(':');
        data(up(min));
        data(lo(min));
        cmd(0xc0);
        string("Date");
        cmd(0xc5);
        data(up(month));
        data(lo(month));
         data('/');
         data(up(year));
        data(lo(year));
        data('/');
        data(up(sec));
        data(lo(sec));
        delay(200);     
    }
}
unsigned char up(unsigned char bcd)
{
    unsigned char temp;
    temp=(bcd>>4);
    temp=temp+48;
    return temp;
    /*let the hour used here is 0x24 while on read form RTC we will get 0x24 we can't
     directly wrote on lcd so we need to split 2 and 4 and the we can display so,
     to get upper character i.e 2 (0x24>>4)-->(0x02)and add with +48 i.e 0x02+48 we will get character 
     or 0x02|0x30 we will get 2 as character similarly t get 4 (0x24&0x0f) we will get 0x04+48 which gives 4*/
}
unsigned char lo(unsigned char bcd)
{
    unsigned char temp;
    temp=(bcd&0x0f);
    temp=temp+48;
    return temp;
}
unsigned char rtc_read(unsigned char address)
{
    unsigned char temp;
    I2C_start();
    I2C_write(0XD0);
    I2C_write(address);
    I2C_stop();
    I2C_start();
    I2C_restart();
    I2C_write(0XD1);
    temp=I2C_Read_Byte();
    I2C_stop();
    return temp;
}
void  lcd_init()
{
    cmd(0x38);
    cmd(0x0c);
    cmd(0x01);
    cmd(0x80);
}
void cmd(unsigned char ch)
{
    PORTD=ch;
    RS=0;
    RW=0;
    EN=1;
    delay(10);
    EN=0;
}
void data(unsigned char ch)
{
    PORTD=ch;
    RS=1;
    RW=0;
    EN=1;
    delay(10);
    EN=0;
}
void string(unsigned char *str)
{
    int k=0;
    while(str[k]!='\0')
    {
        data(str[k]);
        k++;
    }
}
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