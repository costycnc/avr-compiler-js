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


🛠️ MANIFESTO FOR RECLAIMING REAL TECH KNOWLEDGE
👉 “From abstract programming to concrete understanding of the physical world.”
📍 1. The invisible problem
We live in a world where:

📱 Everything is smart, yet almost nobody truly knows how it works.

👨‍💻 Millions of developers write code for web or embedded devices, but ignore what’s inside a microcontroller.

🏭 Devices controlling factories, robots, hospitals, energy, and infrastructure…
➤ are designed and understood by less than 0.1% of the world’s population.

This widespread technical ignorance is a silent threat to technological sovereignty, true innovation, and countries’ independence.

🚨 2. Worrying numbers
🌍 World population: 8 billion

👨‍💻 Programmers with real and voluntary microcontroller experience: ~0.2–0.4%

🔬 Of those, who understand registers, peripherals, memory: ~0.02–0.05%

🧠 So: 1 person out of 1000 (or less) has real embedded hardware knowledge.

🧩 Almost the entire humanity lives in an electronic world it does not understand, not even at a basic level.

⚠️ 3. Why this is a strategic risk
🔌 Automation, defense, medicine, energy, smart agriculture: all rely on embedded systems.

📦 But if few know how to build and control them, we become dependent on whoever designs them elsewhere.

🇨🇳 Some countries (e.g. China) understood this and train millions of embedded technicians.

🇪🇺 Other countries (Europe, Latin America, Africa…) are losing deep technical knowledge in favor of digital convenience.

🧱 4. What needs to be done
🔁 Change school and university curricula
Abstract tools like Arduino or ESP32 with simplified libraries are no longer enough.

We must teach bare-metal programming starting from simple, well-documented microcontrollers like AVR (Atmega328).

Programming directly the registers (PORTB, DDRD, TCCR1A…) is the true embedded school, not just calling abstract functions.

🛠️ A great help: the online AVR assembler
➡️ https://costycnc.github.io/avr-compiler-js/

A fully online tool, no installation needed.

Allows writing and testing AVR assembly code that acts directly on hardware registers.

Facilitates concrete, accessible learning, breaking down technological barriers.

Answers a burning need for real, practical embedded training largely unmet today.

🚩 5. Why do it?
Because a country that doesn’t control the electronics it uses is a technologically colonized country.

Because a people that doesn’t understand its physical world is easy to manipulate and dependent.

Because autonomy, resilience, and freedom also come from knowing what happens inside a microcontroller.

✊ Sign this manifesto if you believe that...
Every student should know what a GPIO pin does.

Every citizen should be able to touch real technology firsthand.

Every nation should train people who can build real technology, not just showcase software.
