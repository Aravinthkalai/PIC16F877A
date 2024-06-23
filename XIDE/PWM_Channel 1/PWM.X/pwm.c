/*
 * File:   pwm.c
 * Author: Aravinth
 *
 * Created on November 26, 2022, 10:38 PM
PWM Notes
==========

 PR2 = (_XTAL_FREQ/(PWM_freq*4*TMR2PRESCALE)) - 1;// to set PWM frequency

CCP1M3 = 1; CCP1M2 = 1;  //Configure the CCP1 module 
T2CKPS0 = 1;T2CKPS1 = 0; TMR2ON = 1; //Configure the Timer module
TRISC2 = 0; // make port pin on C as output

min 1 
max 1022

1023 -100% duty cycle
1-
Duty =  Dutycycle* (_XTAL_FREQ / (PWM_freq*TMR2PRESCALE));
 */


#include <xc.h>
#define _XTAL_FREQ 20000000
#define TMR2PRESCALE 4
void PWM_Initialize();
void PWM_Duty(unsigned int duty);
long PWM_freq = 5000;

void PWM_Initialize()
{
    PR2 = (_XTAL_FREQ/(PWM_freq*4*TMR2PRESCALE)) - 1; //Setting the PR2 formulae using Datasheet // Makes the PWM work in 5KHZ
    CCP1M3 = 1; CCP1M2 = 1;  //Configure the CCP1 module 
    T2CKPS0 = 1;T2CKPS1 = 0; TMR2ON = 1; //Configure the Timer module
    TRISC2 = 0; // make port pin on C as output

}

void PWM_Duty(unsigned int duty)
{
   if(duty<100)
  {
    duty=(float)duty*10.23;
    duty = ((float)duty/1023)*(_XTAL_FREQ/(PWM_freq*TMR2PRESCALE))+23; // On reducing //duty = (((float)duty/1023)*(1/PWM_freq)) / ((1/_XTAL_FREQ) * TMR2PRESCALE);
    CCP1X = duty & 1; //Store the 1st bit
    CCP1Y = duty & 2; //Store the 0th bit
    CCPR1L = duty>>2;// Store the remining 8 bit
  }
}

void main()
{

  TRISC = 0x00; //PORTC as output
  PWM_Initialize();  //This sets the PWM frequency of PWM1
  PWM_Duty(50);//50%duty cycle
  while(1); //Infinite Loop
}

