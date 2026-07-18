.org 0x0000
    rjmp setup              ; Reset Handler jumping to initialization
.org 0x001A                 ; Timer1 Overflow Interrupt Vector
    rjmp overflow 
	
.org 0x60
setup:
    sbi 4,0                 ;SET PORTB PB0 AS OUTPUT (ENABLE/DISABLE STEPPER) 
    sbi 10,2                ;SET PORTD PD2 AS OUTPUT (DIRECTION CW/CCW  STEPPER)
    sbi 10,5                ;SET PORTD PD5 AS OUTPUT (STEP  STEPPER) 
 
    cbi 5,0                 ; PORTB PB0 - DISABLE/ENABLE STEPPER 
    cbi 11,2                ; PORTD PD2 - DIRECTION CW/CCW STEPPER
 
    ldi r16, 0x04           ; Load bit TOIE1 (Timer1 Overflow Interrupt Enable)
    sts 0x6F, r16           ; Write to TIMSK1 to activate the interrupt

    ldi r16, 1              ; Set Timer1 prescaler to 1 (no prescaler)
    sts 0x81, r16           ; Write to TCCR1B
    sei                     ; Enable Global Interrupts (Set I-flag)
loop:
    rjmp loop               ; The CPU is now completely free to process other tasks!

overflow:
    sbi 9,5                 ; Atomic toggle of the (STEP) PIND (Address 0x09, bit 5)
    reti                    ; Return from interrupt
