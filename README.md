# avr-compiler-js

The CPU as a loyal servant in a room full of cabinets and little boxes (with a link to try it live!)

https://www.youtube.com/shorts/ZcSXHUBY7dc

I love this way of explaining what a CPU does — simple enough for my grandma or my 5-year-old nephew:

Imagine a room where a little servant lives. In that room, there are many cabinets:

One cabinet has numbered boxes with instructions, one per box.

Another cabinet controls the doors of the room (turn things on or off).

A third one stores things the servant needs to remember while working.

As soon as he wakes up, the servant goes to the cabinet of instructions and reads one box after another.

One says:


sbi 5,5
The servant understands:
"Go to the cabinet that controls the doors, open box number 5, and plug in a wire with electricity into hole number 5."

He doesn’t know what’s behind that hole. But there's a wire connected to a lamp — the onboard LED on Arduino (pin D13).
And he keeps doing it forever.

Then we change the box with a new instruction:

cbi 5,5
Now the servant understands:
"Unplug the wire from box number 5."
And the lamp turns off.

But he doesn't even know there is a lamp. He just follows orders.

✨ The best part? You can try it live, online, for free — no install needed:
Go to 👉 https://costycnc.it/avr1

You’ll find this code already there (compatible with Arduino Nano, ATmega328):

.org 0
    rjmp init
.org 0x68
init:
    sbi 4,5
    sbi 5,5
    rjmp init
Click Compile, then Upload — the onboard LED turns on.
Then replace sbi 5,5 with cbi 5,5, re-upload — the LED goes off.

📌 The servant worked for you, without knowing who you are, what you studied, or what language you speak.
You just speak his language: boxes, cabinets, and wires.

Want to give him more tasks?
