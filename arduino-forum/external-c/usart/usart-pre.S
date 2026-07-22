/* 
===================================================================
1. ARDUINO CODE (.ino file)
   Copy and paste this code into your main Arduino sketch tab.
===================================================================

extern "C" {
  void send_char_asm(); // We only call the transmission function
}

void setup() {
  Serial.begin(9600); // Arduino configures the hardware safely
}

void loop() {

asm volatile ("nop \n\t nop \n\t nop \n\t nop \n\t nop \n\t nop \n\t nop \n\t nop \n\t nop \n\t nop");

  send_char_asm(); // Assembly inserts the byte directly into the register

asm volatile ("nop \n\t nop \n\t nop \n\t nop \n\t nop \n\t nop \n\t nop \n\t nop \n\t nop \n\t nop");

  delay(1000);     
}


===================================================================
2. ASSEMBLY CODE (.S file)
   Click the "Export template" button to save this file 
   inside the same folder as your main .ino file.
===================================================================
*/
.global send_char_asm

send_char_asm:
wait_tx:
    lds r17, 0xC0        ; Read the USART status (0xC0 = UCSR0A)
    sbrs r17, 5          ; Wait until the transmission drawer is empty
    rjmp wait_tx

    ldi r16, 0b01000001  ; BIN: 0b01000001 | DEC: 65 | HEX: 0x41 | CHAR: 'A'
    sts 0xC6, r16        ; Write directly into the UDR0 register
    ret                  ; Happily return back to Arduino's loop()
