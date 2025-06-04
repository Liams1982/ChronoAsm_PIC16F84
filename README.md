PIC16F84 Chronometer with Shift Register Output Expansion

Author: Smail Lotmani
Original Development Year: 2009


---

Project Overview

This digital chronometer (stopwatch) is built using the PIC16F84 microcontroller programmed in Microchip assembly language. It solves the PIC’s limited I/O pins problem by using 74HC595 shift registers to control four 7-segment displays via a custom serial protocol.

Thanks to carefully crafted delay loops and precise instruction cycle counting, the chronometer maintains high accuracy.


---

Features

Controls four 7-segment displays using shift registers

Precise timing with manual delay loops in assembly

Simple interface with three buttons: Start, Stop, and Reset

Educational example of low-level microcontroller programming and hardware resource management



---

History

I developed this project in 2009 while still a student. It was published in 2011 on the ABC Electronique website, thanks to Mr. Bigonoff, and has since been downloaded nearly 3,000 times.


---

License and Usage

This project is free for educational and non-commercial use with required attribution to Smail Lotmani. See the LICENSE file for details.


---

Technical Details

Microcontroller: PIC16F84

Programming language: Microchip Assembly

Displays: Four 7-segment LEDs driven by 74HC595 shift registers

Controls: Start, Stop, Reset buttons
