/* 
===================================================================
1. ARDUINO CODE (.ino file)
   Copy and paste this code into your main Arduino sketch tab.
===================================================================

extern "C" {
  void init_usart_asm(); // Funzione Assembly per configurare i registri
  void send_char_asm();  // Funzione Assembly per trasmettere il carattere
}

void setup() {
  // Configura la seriale SOLO con il tuo codice Assembly.
  // Non usare "Serial.begin()" per evitare conflitti!
  init_usart_asm(); 
}

void loop() {
  send_char_asm(); // Invia la 'A' a ciclo continuo
  delay(500);      // Ritardo software per non intasare il buffer
}


 ===================================================================
 2. ASSEMBLY CODE (.S file)
 Click the "Export template" button to save this file 
 inside the same folder as your main .ino file.
 ===================================================================
*/
.global init_usart_asm
.global send_char_asm

; --- 1. Configurazione Iniziale (Chiamata solo nel setup) ---
init_usart_asm:
    ldi r16, 103         ; 9600 Baud per 16MHz
    sts 0xC4, r16        ; UBRR0L
    ldi r16, 0b00000110  ; 8N1 (8 data bits, 1 stop bit, no parity)
    sts 0xC2, r16        ; UCSR0C
    ldi r16, 0b00001000  ; Abilita solo il Trasmettitore (TXEN0)
    sts 0xC1, r16        ; UCSR0B
    ret                  ; Ritorna al setup() di Arduino

; --- 2. Trasmissione del singolo byte (Chiamata nel loop) ---
send_char_asm:
wait_tx:
    lds r17, 0xC0        ; Leggi UCSR0A
    sbrs r17, 5          ; Controlla se il registro UDRE0 è vuoto
    rjmp wait_tx
    
    ldi r16, 0b01000001  ; BIN: 0b01000001 | DEC: 65 | HEX: 0x41 | CHAR: 'A'
    sts 0xC6, r16        ; Inserisci in UDR0 per trasmettere
    ret                  ; Ritorna al loop() di Arduino per fare il delay