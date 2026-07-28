    init
LOOP:
    sbi 3,5
    wait 30 ; aproximative 1 second
rjmp LOOP

;------------------- MACRO ZONE ------------------------------------

.macro init
    .org 0
    rjmp init
     .org 0x60
    init:
.endmacro

.macro wait
     ldi r18,@0
     wait1:
     inc r16
     brne wait1
     inc r17
     brne wait1
     dec r18
     brne wait1
.endmacro
