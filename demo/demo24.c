// demo 24: 4809 crystal PLL

// strategy:
// split TCA: have interrupt 1 kHz ish
//
// pll_install()
// pll_remove()
// pll_enable()
// pll_disable()
// calibration values?

#ifdef F_CPU
#undef F_CPU
#endif
#define F_CPU 5000000UL

#include <avr/io.h>
#include <util/delay.h>

int main(void) {
  _delay_ms(100);
  
  PORTF.OUTCLR = PIN5_bm;
  while (1) {
    /* LED on 0.5 sec */
    PORTF.DIRSET = PIN5_bm;
    _delay_ms(500);

    /* LED off 0.1 sec */
    PORTF.DIRCLR = PIN5_bm;
    _delay_ms(100);
  }
}

// --- last line ---
