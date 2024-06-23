#ifndef KEYPAD_H
#define	KEYPAD_H


#define S1 RC0
#define S2 RC1
#define S3 RD0
#define S4 RD1
void userinput();
void key_check();
int in=30;
void key_check()
{
 
    if(S1==0)
    {
        in++;
        delay(180);
    }
    if(S2==0)
    {
        in--;
        delay(180);
    }
}
void userinput()
{
    SPI_Write(ar2[7],arr[(in/1000)]);//ar2-->display numer, arr- hex code
    SPI_Write(ar2[6],arr[(in/100)%10]);//ar2-->display numer, arr- hex code
    SPI_Write(ar2[5],arr[(in/10)%10]);//ar2-->display numer, arr- hex code
    SPI_Write(ar2[4],arr[(in%10)]);//ar2-->display numer, arr- hex code
}

#endif	/* KEYPAD_H */

