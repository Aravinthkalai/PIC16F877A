/* 
 * File:   LED.h
 * Author: Aravinth
 *
 * Created on September 26, 2020, 7:30 PM
 */

#ifndef LED_H
#define	LED_H
#define LP  RB1
#define HP  RB2
void checkpressure();
void LED_init();
void LED_init()
{
    TRISB1=0;
    TRISB2=0;
    LP=HP=0;
}
void checkpressure()
{
    if(adcval>0)
    {      
    if(in<adcval)
    {
          HP=1;
          LP=0;
          delay(10);
        }
    if(in>adcval)
    {
      LP=1;
      HP=0;
      delay(10);
        }
    }

}
#endif	/* LED_H */

