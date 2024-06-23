/*
 * File:   7 SEG SPI.c
 * Author: Aravinth
 *150
 * 234
 * Created on September 26, 2020, 7:45 AM
 */

#include<htc.h>
#include"7 seg.h"
#include"adc.h"
#include"keypad.h"
#include"LED.h"
void main()
{
    SPI_init();
    acd_init();
    LED_init();
     while(1)
    {
        adc();
        key_check();
        userinput();
        checkpressure();
        
    }
    
}
