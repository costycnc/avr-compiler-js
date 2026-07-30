.org 0
    rjmp init
.org 0x68
init:
	rcall led_on
loop:
    rjmp loop  
led_on:
	sbi 5,5
ret