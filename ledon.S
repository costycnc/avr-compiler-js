;ARDUINO CODE
;extern "C" {void led_on();}
;void setup() {led_on();}
;void loop() {}

.global led_on
led_on:
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
    sbi 0x04, 5    ; Cabinet 4, switch 5 UP: Pin D13 becomes a power output
    sbi 0x05, 5    ; Cabinet 5, switch 5 UP: Light is ON at full brightness!
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
    ret            ; End of function: go back to the main program
