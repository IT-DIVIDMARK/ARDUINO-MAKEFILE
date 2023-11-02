#define F_CPU 16000000UL  // Define CPU frequency for use in delay.h
#include <avr/io.h>
#include <util/delay.h>

int main(void) {
    // set pin 5 of PORTB for output
    DDRB |= (1 << DDB5);

    while (1) {
        // turn on LED
        PORTB |= (1 << PORTB5);
        _delay_ms(1000); // 1 second delay

        // turn off LED
        PORTB &= ~(1 << PORTB5);
        _delay_ms(1000); // 1 second delay
    }

    return 0;
}
