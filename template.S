#include <avr/io.h>

.global mia_somma

mia_somma:
    ; --- Automatic Macro Start ---
    push r16          ; Save r16 for safety
    push r17          ; Save r17 for safety
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
    ; --- Automatic Macro End ---

    ; --- Student's Code ---
    mov r16, r24      ; Arduino puts the 1st parameter (10) in r24. Move it to r16.
    mov r17, r22      ; Arduino puts the 2nd parameter (5) in r22. Move it to r17.
    
    add r16, r17      ; Perform the addition: r16 = r16 + r17 (10 + 5)
    
    mov r24, r16      ; Fixed rule: Arduino expects the final result inside r24.
    ; -----------------------------

    ; --- Automatic Macro Start ---
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
    pop r17           ; Restore the old r17
    pop r16           ; Restore the old r16
    ret               ; Return to Arduino C++ code with a clean Stack!
    ; --- Automatic Macro End ---
