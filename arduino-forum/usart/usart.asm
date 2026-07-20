; ============================================================
; USART TRANSMIT 'A' EVERY ~2 SECONDS
; ATmega328P @ 16MHz, 9600 baud, 8N1
; ============================================================

.org 0x00
jmp init
.org 0x60

init:
    ; 1. Set USART CONFIGURATION AT 9600 BAUD, 8N1
    ldi r16, 103         ; 9600 BAUD, 8N1 - 103 in binary = 01100111
    sts 0xC4, r16        ; 0xC4 = UBRR0L

    ; 2. Set the rules (8 data, 1 stop, no parity)
    ldi r16, 0b00000110  ; UCSZ01=1, UCSZ00=1
    sts 0xC2, r16        ; 0xC2 = UCSR0C

    ; 3. Turn on transmitter
    ldi r16, 0b00010000  ; TXEN0=1
    sts 0xC1, r16        ; 0xC1 = UCSR0B

loop:
    ; === TRANSMIT A BYTE ===
    ; Wait for UDRE0 indicator to be on (drawer empty)
wait_tx:
    lds r17, 0xC0        ; 0xC0 = UCSR0A
    sbrs r17, 5          ; Check bit 5 (UDRE0)
    rjmp wait_tx

    ; Place the data in the mail carrier's drawer
    ldi r16, 'A'         ; Character 'A' to send
    sts 0xC6, r16        ; 0xC6 = UDR0

wait:                    ; Wait some seconds
    inc r16
    brne wait
    inc r17
    brne wait
    inc r18
    brne wait
    rjmp loop