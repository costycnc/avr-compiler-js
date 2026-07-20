.org 0x0000
    jmp RESET

.org 0x0024        ; USART RX Complete Interrupt vector
    jmp costycnc
    
.org 0x0060
RESET:
    sbi 0x04, 5    ; DDRB: Set PB5 as output
    
    ; 1. Configure Baud Rate to 9600 (for 16MHz clock)
    ldi r16, 103
    sts 0xC4, r16  ; Write to UBRR0L
    
    ; 2. Configure UCSR0C: 8 data bits, 1 stop bit, no parity
    ldi r16, 0b00000110 ; Set UCSZ01 and UCSZ00 bits
    sts 0xC2, r16      ; Write to UCSR0C

    ; 3. Enable Receiver and RX Interrupt
    ldi r16, 0b10010000 ; Set RXCIE0 and RXEN0 bits
    sts 0xC1, r16      ; Write to UCSR0B
    sei                ; Enable global interrupts

loop:
    rjmp loop

costycnc:
    lds r18, 0xC6  ; Read byte from UDR0
    cpi r18, 'A'   ; Is it 'A'?
    brne jos
    PINB: Toggle PB5 (Built-in LED) on match
jos:
    reti
