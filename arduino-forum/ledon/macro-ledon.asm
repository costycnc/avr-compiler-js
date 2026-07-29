init
loop:
ledon ;ledoff
rjmp loop

;--------------------background----------------------------------------
.macro init
.org 0
    rjmp loop
.org 0x60
.endmacro

.macro ledon
sbi 5,5
.endmacro

.macro ledoff
cbi 5,5
.endmacro
