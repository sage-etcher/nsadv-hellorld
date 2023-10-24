# NorthStar Advantage Hellorld

hellorld written for the NorthStar Advantage  
Seperate versions to run in NS-GDOS v1.0.0AQ and on the Bare Metal (no OS)  
As of October 24th 2023, the Bare Metal version is untested

Poorly Filmed Video of it (NS-GDOS Example) running can be found here :P  
<https://youtu.be/os8kyX2G1v0>  

Phone's camera is a potato, so sorry bout that-  

All 100% hand assembled  

## Random Notes (mainly just complaning)  

- NS-GDOS versoin is compatible with z80 and i8080  
- Bare Metal version is exclusive to z80 system
- Man, I miss having a Text Editor and Assembler. Ain't got either for NS-GDOS, gotta rely entirely on SF and MC000 ://  
- Got NO CLUE how I'm going to test the Bare Metal example ATM. It needs to be saved at a specific area on the floppy (side 0, track 0, sector 4), but I dont have anyway of doing a raw unformatted write/read to a floppy. Contemplating writing a BASIC script to do so, but it's all still up in the air. Got ED for CP/M but I'd like to avoid raw disk access with ASM if possible, tracking where on the disk you're at is all software side which is kinda terifying
- Converted the Bare Metal assembly file to z80 pnemonics. Never noticed how strange looking it is in comparison to i8080. Been using the i8080 pnemonics for the machine the entire time I've had it, so finally using z80 for it (the CPU it actually has) is strange  
