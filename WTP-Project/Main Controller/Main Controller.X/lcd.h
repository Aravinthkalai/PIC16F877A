#define rs RC0
#define rw RC1
#define e RC2
void lcd_int();
void lcd_cmd(char a);
void lcd_dat(char b);
void show(char *s);
void delay(int L);
void lcd_int()
{
 lcd_cmd(0x38);
 lcd_cmd(0x0c);
 lcd_cmd(0x06);
 lcd_cmd(0x80);
}
 
void lcd_cmd(char a)
{
 PORTB=a;
 rs=0;
 rw=0;
 e=1;
 delay(5);
 e=0;
}
 
void lcd_dat(char b)
{
 PORTB=b;
 rs=1;
 rw=0;
 e=1;
 delay(5);
 e=0;
} 
 
void show(char *s)
{
 while(*s) 
	 {
 lcd_dat(*s++);
 }
}