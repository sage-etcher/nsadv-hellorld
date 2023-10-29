# Northstar Advantage Hellorld

In short, the NorthStar Advantage was a Z80A-based business micro-computer from the early 1980s. It had superb graphics capabilities but was a commercial failure, dragged down by its requirement of hard-sectored floppy disks. Quickly outpaced by the ever-growing IBM Personal PC

It offered a multitude of O/S's, with the main 3 'General Use' options being
- Graphics CP/M v2.2
- NorthStar Graphics DOS
- Graphics MS-DOS v1.0 (with 8088 co-processor card)


## Files

I have written several 'Hellorld!' programs for the machine, one for CP/M, NS-GDOS, and one to be run bare-metal, with no supporting Operating System.

To start, the project has its files organized based on the directory

| Name | Description
|:-----|:--------------|
| CPM/ | Graphics CP/M program sources, hex, and cross-ref file |
| NS-GDOS/ | NorthStar Graphics DOS program |
| bare-metal/ | Bare Metal |
| \*\*.asm | Assembly Language File, writen in intel 8080 pnemonics |
| \*\*.hex | Hand-assembled binary for the program |
| \*\*.prn | Cross-Reference file between HEX and ASM |

## CP/M Hellorld

Arguably the easiest to write 'Hellorld' program, will run on just about any 8080 or Z80-based CP/M system. Doubled with the readily available text/context editor ED and ASM/LOAD, assembler and hex2com, the code practically writes itself!

## NorthStar GDOS Hellorld

This version of the program is extremely particular to the version of the OS that you are running. In my case, this was version 1.0.0AQ, if you are running 2.x it will NOT work, due to a restructuring of the code base and a different memory mapping.

Please note that NS-GDOS is completely unrelated to MS-DOS. NS-GDOS predates MS-DOS by several years, being originally used on the NS-HORIZON system in 1976.

A poorly filmed video of this running can be found here :P  
<https://youtu.be/os8kyX2G1v0>  
The phone's camera is a potato, so sorry bout that-  

## Bare Metal Hellorld

This was, for lack of better words, painful. The Advantage is a wonderful system, but, it lacks a character out procedure in the PROM. Instead, we are given a Standard Character Set and a Video Driver. With this, we can print characters to the screen, given a large bit of structuring and preparation. 

On top of this, to properly run the program on "Bare Metal" you must write the program at a specific location on a boot-floppy (Side 0, Track 0, Sector 4-7).

I currently do not have the tools/programs at my disposal to do a raw write to a floppy, so instead I provided a (commented out) way to run it through CP/M and simulate a bare metal run. However, this requires that the executable file become MUCH LARGER and that the LOAD command takes ages to finish. This is because the System looks at the first byte at Side 0, Track 0, Sector 4, and then loads the proceeding program into memory at an address based on the byte read. The lowest point in memory this lets you choose is at the start of page 3, 0C000H, this means that to simulate this on CP/M the program COM file must have a preceding 48K of blank space before the actual program.

Due to the limitation of not having any raw read/write access to floppies at the moment, the Bare Metal version is "Technically" untested, but it does run in a simulated CP/M environment.


## North Star History

The NorthStar Advantage system, released circa 1982, was a micro-computer sold by North Star Computer Inc. as the successor to their previously popular, North Star Horizon system. 
The computer was chocked full with 64KB general use RAM (expandable up to 256KB), 16KB of dedicated video RAM, a High-Resolution display (640x240), and the Z80A processor (4Mhz)! 
The Advantage was marketed primarily as a "business computer" and was often sold as a package containing the main system, bundled software, a multitude of manuals, and many accessories. 
A couple of notable accessories commonly offered included: an 8088 co-processor card compatible with MS-DOS v1.0 and a Winchester Hard Disk (originally 5MB but later expanded to 15/30MB).

Due to the system being marketed primarily towards business use, not much software is known to be made for the system. Some of the common software bundled with the system, by no means all-inclusive, were: NorthWord, InfoManager, NorthPlan, PROPAC, Enhanced WordStar, SpellStar, MailMerge, Enhanced MicroPlan, dBase, FORTRAN, Pascal, COBOL/M-Sort, BuisGraph, ImageMaker, GraphicsLibrary-8, BASIC-16, FORTRAN-16, Pascal-16. 

What the machine lacked in software it made up for in supporting a multitude, arguably too many by some, operating systems: CP/M, NS-GDOS, MS-DOS, and NorthNet just to name a few. There are two in that list that you may not recognize, namely NS-GDOS and NorthNet, I do not know much about NorthNet but NS-GDOS was NorthStar's operating system. there were many iterations of NS-DOS throughout the company's life, the main one I will be touching on is NS-GDOS v1.0.0AQ, which came with the graphics subsystem, 2 program monitor/debuggers, and the GBASIC. I have heard that later iterations also came with a text editor and an assembler but I am unable to verify that sentiment.

The Northstar Advantage had a substantial lot going for it, and initially saw great commercial success but ultimately was held down due to requiring Hard-Sectored Floppy Disks. This requirement meant that sharing data and programs to non-identical systems was very difficult, and ended with the system being outpaced by the ever-popular IBM Personal Computer.

Soon after the failure of the otherwise great machine, the Northstar Advante, NorthStar made one final leap with the North Star Dimension, only 2 years later, in 1984. The company carried on with its Dimension lineup until 1989 when the company dissolved.


## Additional Notes

I do not currently have the 8088 Expansion card for the system, nor the MS-DOS v1.0 floppies, but if I get my hands on a working pair I will update this repo with examples of a Hellorld on them as well!

If anyone reading this has either of those feel free to reach out to me and I'll try to shoot ya a reasonable offer! =DD

I just got the NorthStar Advantage earlier this year so I am still learning, but for now, this is where I sign off, thanks for reading this far, sage, logging off.

## Open Source License (Apache version 2.0)

Copyright 2023 Sage I. Hendricks  

Licensed under the Apache License, Version 2.0 (the "License");  
you may not use this file except in compliance with the License.  
You may obtain a copy of the License at  

&nbsp;&nbsp;&nbsp;&nbsp;<http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software  
distributed under the License is distributed on an "AS IS" BASIS,  
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  
See the License for the specific language governing permissions and   
limitations under the License.  


