/* 
===================================================================
1. ARDUINO CODE (.ino file)
   Copy and paste this code into your main Arduino sketch tab.
===================================================================

extern "C" { 
    void led_on(); 
}

void setup() {
    led_on(); // Calls the Assembly routine once
}

void loop() {
    // Left empty: the Assembly function will handle execution
}

 ===================================================================
 2. ASSEMBLY CODE (.S file)
 Click the "Export template" button to save this file 
 inside the same folder as your main .ino file.
 ===================================================================
*/
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
