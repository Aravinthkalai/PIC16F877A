void uart_init();
void uart_tx(char ch);
char uart_rx();
void uart_string(unsigned char *str);
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
void uart_string(unsigned char *str)
{
    int k=0;
    while(str[k]!='\0')
    {
        uart_tx(str[k]);
        k++;
    }
}
