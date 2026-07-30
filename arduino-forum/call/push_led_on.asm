;Simulate CALL
.org 0
    rjmp init
.org 0x60
init:
	ldi r16,0
        push r16
        ldi r16,0x65
        push r16
        rjmp 0x66
loop:
    rjmp loop  
led_on:
	sbi 5,5
ret
