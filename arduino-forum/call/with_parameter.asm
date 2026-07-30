.org 0
rjmp start

.org 0x60
start:
; led_on(32)
ldi r16, 32
push r16
rcall led_on

loop:
rjmp loop

; void led_on(byte mask) { PORTB = mask; }
led_on:
pop r20   ; Pop the Return Address Low Byte from the Stack
pop r21   ; Pop the Return Address High Byte from the Stack
pop r17   ; Grab our parameter (32) off the top of the Stack
out 5, r17 ; Write directly to PORTB (Note: the LED will glow faintly!)
push r21  ; Restore the Return Address High Byte onto the Stack
push r20  ; Restore the Return Address Low Byte onto the Stack
ret       ; Safe return back to the main loop caller
