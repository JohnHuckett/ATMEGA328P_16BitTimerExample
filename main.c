#include <avr/io.h>

int main(void){

    DDRB |= (1 << DDB1) | (1 << DDB2);
    TCCR1A = (1 << COM1A1) | (1 << COM1B1) | (1 << WGM11);
    TCCR1B = (1 << WGM12) | (1 << WGM13) | (1 << CS10);      
    ICR1 = 0xffff; //65535 = 16bit 
    OCR1A = 0x7fff; //32767 50% duty cycle
    OCR1B = 0x7fff; //32767 50% duty cycle
 
    while (1){
        
    }
}

