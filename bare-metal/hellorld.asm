;SAGE I. HENDRICKS 2023 OCT 26
;CLEARS THE SCREEN THEN PRINT HELLORLD AT HOME POS (TOP LEFT)

;MADE TO RUN ON CP/M V2.2

;CONSTANTS
VID0    EQU     1000$0000B      ;VIDEO PART 1 (16K)
VID1    EQU     1000$0001B      ;VIDEO PART 2 (4X 4K)
PROM    EQU     1000$0100B      ;PROM (2K)
PAGE0   EQU     0A0H            ;00000-03FFFH
PAGE1   EQU     0A1H            ;04000-07FFFH
PAGE2   EQU     0A2H            ;08000-0BFFFH

SCANREG EQU     090H            ;VIDEO SCAN REG. TOP VISIBLE LINE

VBASE   EQU     08000H          ;BASE ADDR OF VIDEO DRIVER
VDRIVER EQU     VBASE+007FDH    ;VIDEO DRIVER JMP ADDR
VFONT   EQU     VBASE+00561H    ;STANDARD CHARACTER SET

NULL    EQU     000H            ;NULL BYTE

CCLEAR  EQU     00FH            ;CLEAR SCREEN CHARACTER
CHOME   EQU     01EH            ;CURSOR HOME CHARACTER
CCUROFF EQU     019H            ;CURSOR OFF CHARACTER

;CP/M START (VVV LARGE EXECUTABLE)
;       ORG     00100H          ;CP/M'S TPA
;       JMP     START

;PROM START (MUST BE ON SIDE 0 TRACK 0 SECT 4-7 OF FLOPPY)
        ORG     0C000H          ;PROM'S "TPA"
        DB      0C0H            ;FIRST BYTE TELLS THE PROM WHERE THE PROGRAM
                                ;SHOULD BE LOADED, IN MEM. C0 == C0000
        ORG     0C00AH          ;PROM STARTS EXECUTING CODE 10 BYTES AFTER
        JMP     START           ;THE SPECIFIED LOAD ADDR, IT EXPECTS A JUMP

;PROGRAM START
START:
        CALL    VSETUP          ;SETUP THE DISPLAY FOR THE VIDEO DRIVER
        CALL    VCLEAR          ;CLEAR THE DISPLAY
        LXI     D,MSG           ;LOAD MESSAGE ADDR INTO DE
        CALL    PRINT           ;PRINT LOADED MESSAGE FROM CURSOR POS
        HLT                     ;HALT THE SYSTEM

VSETUP: MVI     A,VID0          ;SPECIFY VRAM PART 1
        OUT     PAGE0           ;MAP TO PAGE 0
        MVI     A,VID1          ;SPECIFY VRAM PART 2
        OUT     PAGE1           ;MAP TO PAGE 1
        MVI     A,PROM          ;SPECIFY PROM (W/ VIDEO DRIVER)
        OUT     PAGE2           ;MAP TO PAGE 2
        RET

COUT:   DB      0DDH,021H       ;MVI    IX,VBLOCK
        DW      VBLOCK
        JMP     VDRIVER         ;GOTO VDRIVER
RETURN: RET                     ;VDRIVER RETURNS HERE

VCLEAR:
        MVI     A,CCUROFF       ;LOAD CURSOR OFF CHARACTER
        CALL    COUT            ;TURN THE CURSOR OFF
        MVI     A,000H          ;SPECIFY TOP OF VRAM
        OUT     SCANREG         ;SET TOP LINE OFFSET TO 00
        MVI     A,CHOME         ;LOAD HOME CHARACTER
        CALL    COUT            ;GOTO THE HOME POSITION
        MVI     A,CCLEAR        ;LOAD CLEAR CHARACTER
        CALL    COUT            ;CLEAR FROM CURSOR TO END OF SCREEN
        RET

PRINT:  LDAX    D               ;LOAD CHARACTER FROM DE
        CPI     NULL            ;CHECK FOR NULL CHARACTER
        RZ                      ;IF NULL TERMINATOR IS REACHED, RETURN
        PUSH    D               ;SAVE DE
        CALL    COUT            ;PRINT THE CHARACTER
        POP     D               ;RESTORE DE
        INX     D               ;MOVE TO NEXT CHARACTER
        JMP     PRINT           ;REPEAT

;DATA BLOCK
;VIDEO DRIVER DATA
VCUR:   DW      0FFFFH,0FFFFH,0FFFFH,0FFFFH,0FFFFH

VBLCOK:
CURSX:  DB      000H            ;CURSOR X POS
CURSY:  DB      000H            ;CURSOR Y POS
PIXEL:  DW      VFONT           ;USE THE STANDARD CHARACTER SET
SCRCT:  DB      000H            ;TOP LINE OFFSET
STATS:  DB      0000$0110B      ;NO-WRAP, NO-SCROLL
RETFP:  DW      RETURN          ;VDRIVER JUMPS HERE AFTER DONE
CTEMP:  DW      VCUR            ;CURSOR TO USE
VMODE:  DB      000H            ;DISPLAY MODE, 00 NORMAL, FF REVERSE

;MESSAGE
MSG:    DB      'HELLORLD',NULL

        END
