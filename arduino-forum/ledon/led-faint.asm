.org 0
    rjmp init
.org 0x60
init:
   sbi 5,5
loop:
   rjmp loop