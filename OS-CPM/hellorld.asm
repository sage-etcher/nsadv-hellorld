BDOS    EQU     00005H          ;BDOS ENTRY POINT
B$PSTR  EQU     009H            ;BDOS PRINT STRING PROCEDURE ID
BS$TERM EQU     '$'             ;BDOS STRING TERMINATOR

LF      EQU     00AH            ;LINEFEED
CR      EQU     00DH            ;CARTRIDGE-RETURN

        ORG     00100H          ;ORIGIN POINT AT CPM'S TPA
START:  LXI     D,MSG           ;LOAD MSG ADDR INTO DE
        MVI     C,B$PSTR        ;LOAD PSTR ID IN PROC SPECIFIER REG 
        CALL    BDOS            ;EXECUTE PROCEDURE ON ADDR IN DE
        RST     0               ;WARM-BOOT CP/M

MSG:    DB      'HELLORLD!',CR,LF,BS$TERM

        END
