#include<htc.h>
void uart_init();
void uart_tx(char ch);
char uart_rx();
void main()
{
TRISC6=0;
TRISC7=1;
uart_init();
uart_tx('h');
while(1)
{
	uart_tx(uart_rx());
}
}
void uart_init()
{
TXSTA=0X24;
RCSTA=0X90;
BRGH=1;
SPBRG=129;
}
void uart_tx(char ch)
{
	TXREG=ch;
	while(TXIF==0);
	TXIF=0;
}
char uart_rx()
{	
	while(RCIF==0);
	RCIF=0;
	return RCREG;
}