# Northstar Advantage Hellorld

In short the NorthStar Advantage was a Z80A-based business micro-computer from the early 1980s. It had superb graphics capabilities, but was a commercial failure, dragged down by it's requirement of hard-sectored floppy disks. Quickly outpaced by the ever growing IBM Personal PC

It offered a multitude of O/S's, with the main 3 'General Use' options being
- Graphics CP/M v2.2
- NorthStar Graphics DOS
- Graphics MS-DOS v1.0 (with 8088 co-proccessor card)


## Files

I have written several 'Hellorld!' programs for the machine, one for CP/M, NS-GDOS, and one to be run bare-metal, with no supporting Operating System.

To start, the project has it's files organized based on directory

| Name | Description
|:-----|:--------------|
| CPM/ | Graphics CP/M program sources, hex, and cross-ref file |
| NS-GDOS/ | NorthStar Graphics DOS program |
| bare-metal/ | Bare Metal |
| \*\*.asm | Assembly Language File, writen in intel 8080 pnemonics |
| \*\*.hex | Hand assembled binary for the program |
| \*\*.prn | Cross-Reference file between HEX and ASM |

## CP/M Hellorld

Arguably the easiest to write 'Hellorld' program, will run on just about any 8080 or Z80 based CP/M system. Doubled with the readily available text/context editor ED and ASM/LD, assembler and linker, the code practically writes itself!

## NorthStar GDOS Hellorld

This version of the program is extremely particular to the version of the OS that you are running. In my case, this was version 1.0.0AQ, if you are running 2.x it will NOT work, due to a restructureing of the code base and a different memmory mapping.

Please note that NS-GDOS is completely unrelated to MS-DOS. NS-GDOS predates MS-DOS by a number of a years, being origonally used on the NS-HORIZON system in 1976.

A poorly filmed video of this running can be found here :P  
<https://youtu.be/os8kyX2G1v0>  
Phone's camera is a potato, so sorry bout that-  

## Bare Metal Hellorld

This was, for lack of better words, painful. The Advantage is a wonderful system, but, it lacks a character out procedure in the PROM. Instead, we are given a Standard Character Set and a Video Driver. With this we can print character to the screen, given a large bit of structuring and preperation. 

Ontop of this, in order to propperly run the program on "Bare Metal" you must write the program at a specific location on a boot-floppy (Side 0, Track 0, Sector 4-7).

I currently do not have the tools/programs at my disposal to do a raw write to a floppy, so instead I provided a (commented out) way to run it through CP/M and simulate a bare metal run. However, this requires that the executable file become MUCH LARGER and that the LOAD command takes ages to finish. This is because the System looks at the first byte at Side 0, Track 0, Sector 4 and then loads the proceeding program into memory at an address based on the byte read. The lowest point in memory this lets you choose is at the start of page 3, 0C000H, this means that inorder to simulate this on CP/M the program COM file must have a preceeding 48K of blank space before the actual program.

Due to the limitation of not having any raw read/write access to floppies at the moment, the Bare Metal version is "Technically" untested, but it does run in a simulated CP/M enviornment.


## North Star History

The NorthStar Advantage system, released circa 1982, was a micro-computer sold by North Star Computer Inc. as the successor to their previously popular, North Star Horizon system. 
The computer was chocked full with 64KB general use RAM (expandable up to 256KB), 16KB of dedicated video RAM, a High-Resolution display (640x240), ans the Z80A proccessor (4Mhz)! 
The Advantage was marketted primarily as a "business computer" and was often sold as package containing the main system, bundled software, a multitude of manuals, and many accessories. 
A couple notable accessories commonly offered included: an 8088 co-processor card compatible with MS-DOS v1.0 and a Winchester Hard Disk (origonally 5MB but later expanded to 15/30MB).

Due to the system being marketted primarilly towards business use, not much software is known to be made for the system. Some of the common software bundled with system, by no means all inclusive, were: NorthWord, InfoManager, NorthPlan, PROPAC, Enhanced WordStar, SpellStar, MailMerge, Enhanced MicroPlan, dBase, FORTRAN, Pascal, COBOL/M-Sort, BuisGraph, ImageMaker, GraphicsLibrary-8, BASIC-16, FORTRAN-16, Pascal-16. 

What the machine lacked in software it made up for in supporting a multitude, arguably too many by some, operating systems: CP/M, NS-GDOS, MS-DOS, and NorthNet just to name a few. There are two in that list that you may not recognize, namely NS-GDOS and NorthNet, I do not know much about NorthNet but NS-GDOS was NorthStar's own operating system. there were many iteration of NS-DOS through out the companies life, the main one I will be touching on is NS-GDOS v1.0.0AQ, which came with the graphics subsystem, 2 program monitor/debuggers and the GBASIC. I have heard that later iterations also came with a text editor and an assembler but I am unable to verify that sentiment.

The Northstar Advantage had a substantial lot going for it, and initially saw great commercial success but ultimately was held down due to requiring Hard-Sectored Floppy Disk. This requirement meant that sharing data and programs to non-identical systems was verry difficult, and ended with the system being out paced by the ever popular IBM Personal Computer.

Soon after the failure of the otherwise great machine, the Northstar Advante, NorthStar made one final leap with the North Star Dimension, only 2 years later, in 1984. The company caried on with their Dimension line up until 1989, when the company disolved.


## Additional Notes

I do not currently have the 8088 Expansion card for the system, nor the MS-DOS v1.0 floppies, but if I get my hands on a working pair I will update this repo with examples of a Hellorld on them as well!

If anyone reading this has either of those feel free to reach out to me and i'll try to shoot ya a reasonable offer! =DD

I just got the NorthStar Advantage earlier this year so I am still learning, but for now this is were I sign off, thanks for reading this far, sage, logging off.
