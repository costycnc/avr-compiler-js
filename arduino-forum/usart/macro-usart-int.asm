init
enable_serial_interrupt
loop:
    rjmp loop

serial_interrupt:
    lds r18, 0xC6  ; Read byte from UDR0
    cpi r18, 'A'   ; Is it 'A'?
    brne jos
    sbi 3,5; Toggle PB5 (Built-in LED) on match
jos:
    reti
    
;---------------------------------MACRO ZONE------------------------------------------------------
.macro init
.org 0x0000
    jmp RESET
.org 0x0024        ; USART RX Complete Interrupt vector
    jmp serial_interrupt
.org 0x0060
RESET:
    sbi 0x04, 5    ; DDRB: Set PB5 as output
.endmacro
.macro enable_serial_interrupt 
    ldi r16, 103   ;bauds 9600
    sts 0xC4, r16  ; Write to UBRR0L
    ldi r16, 0b00000110 ; Set UCSZ01 and UCSZ00 bits 8N1
    sts 0xC2, r16      ; Write to UCSR0C
    ldi r16, 0b10010000 ; Set RXCIE0 and RXEN0 bits activate rx_interrupt
    sts 0xC1, r16      ; Write to UCSR0B
    sei                ; Enable global interrupts
.endmacro


