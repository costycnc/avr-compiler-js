/* 
===================================================================
1. ARDUINO CODE (.ino file)
   Copy and paste this code into your main Arduino sketch tab.
===================================================================

extern "C" {
  void init_usart_asm(); // Assembly function to configure the hardware registers
  void send_char_asm();  // Assembly function to transmit the character
}

void setup() {
  // Configure the serial interface ONLY with your Assembly code.
  // Do not use "Serial.begin()" to avoid register conflicts!
  init_usart_asm(); 
}

void loop() {
  send_char_asm(); // Transmit the character 'A' continuously
  delay(500);      // Software delay to avoid clogging the buffer
}


===================================================================
2. ASSEMBLY CODE (.S file)
   Click the "Export template" button to save this file 
   inside the same folder as your main .ino file.
===================================================================
*/
.global init_usart_asm
.global send_char_asm

; --- 1. Initial Configuration (Called only inside setup) ---
init_usart_asm:
    ldi r16, 103         ; 9600 Baud rate for 16MHz clock
    sts 0xC4, r16        ; 0xC4 = UBRR0L
    ldi r16, 0b00000110  ; 8N1 frame format (8 data bits, 1 stop bit, no parity)
    sts 0xC2, r16        ; 0xC2 = UCSR0C
    ldi r16, 0b00001000  ; Enable the Transmitter only (TXEN0 = 1)
    sts 0xC1, r16        ; 0xC1 = UCSR0B
    ret                  ; Return back to Arduino's setup()

; --- 2. Single Byte Transmission (Called inside loop) ---
send_char_asm:
wait_tx:
    lds r17, 0xC0        ; Read status register (0xC0 = UCSR0A)
    sbrs r17, 5          ; Check bit 5 (UDRE0 indicator: is the drawer empty?)
    rjmp wait_tx
    
    ldi r16, 0b01000001  ; BIN: 0b01000001 | DEC: 65 | HEX: 0x41 | CHAR: 'A'
    sts 0xC6, r16        ; Place the data in the mail carrier's drawer (0xC6 = UDR0)
    ret                  ; Return back to Arduino's loop() to execute the delay
