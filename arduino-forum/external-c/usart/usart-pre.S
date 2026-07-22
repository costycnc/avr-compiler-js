/* 
===================================================================
1. ARDUINO CODE (.ino file)
   Copy and paste this code into your main Arduino sketch tab.
===================================================================

extern "C" {
  void send_char_asm(); // Chiamiamo solo la funzione di trasmissione
}

void setup() {
  Serial.begin(9600); // Arduino configura l'hardware in modo sicuro
}

void loop() {
  send_char_asm(); // L'Assembly inserisce il byte direttamente nel registro
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
    lds r17, 0xC0        ; Leggi lo stato della USART (UCSR0A)
    sbrs r17, 5          ; Aspetta che il cassetto di trasmissione sia vuoto
    rjmp wait_tx

    ldi r16, 0b01000001  ; BIN: 0b01000001 | DEC: 65 | HEX: 0x41 | CHAR: 'A'
    sts 0xC6, r16        ; Scrivi nel registro UDR0
    ret                  ; Ritorna felicemente al loop di Arduino