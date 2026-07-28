init
configure-baud-rate-to-9600
configure-8N1
enable-receiver-and-RX-Interrupt
loop:
    rjmp loop

usart-interrupt:
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
    jmp usart-interrupt
.org 0x0060
RESET:
    sbi 0x04, 5    ; DDRB: Set PB5 as output
.endmacro
.macro configure-baud-rate-to-9600 
    ldi r16, 103
    sts 0xC4, r16  ; Write to UBRR0L
.endmacro   
.macro configure-8N1
    ldi r16, 0b00000110 ; Set UCSZ01 and UCSZ00 bits
    sts 0xC2, r16      ; Write to UCSR0C
.endmacro
.macro enable-receiver-and-RX-Interrupt
    ldi r16, 0b10010000 ; Set RXCIE0 and RXEN0 bits
    sts 0xC1, r16      ; Write to UCSR0B
    sei                ; Enable global interrupts
.endmacro


