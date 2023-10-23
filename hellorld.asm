COUT    EQU     0F80DH          ;GDOS CHAR OUT
RESTART EQU     0F828H          ;GDOS RESTART

CON0    EQU     000H            ;COUT SPECIFIER

NULL    EQU     000H            ;NULL CHAR/STR TERMINATOR
CR      EQU     00DH            ;CARTRIDGE RETURN
LF      EQU     00AH            ;LINEFEED

        ORG     00000H          ;TPA STARTS AT 0000

        LXI     D,MSG           ;LOAD MESSAGE 
        CALL    PRINT           ;PRINT THE STRING
        CALL    RESTART         ;RETURN CONTROL TO NSDOS

PRINT:  LDAX    D               ;GET CHARACTER AT DE
        CPI     NULL            ;CHECK IF CHARACTER IS NULL TERMINATOR
        RZ                      ;IF IT IS, RETURN
        MOV     B,A             ;OTHERWISE, PREPARE THE CHAR TO BE PRINTED
        MVI     A,CON0          ;SPECIFY COUT DEVICE
        CALL    COUT            ;PRINT THE CHARACTER TO CONSOLE
        INX     D               ;MOVE TO THE NEXT CHARACTER
        JMP     PRINT           ;PRINT NEXT CHARACTER

MSG:    DB      'HELLORLD!',CR,LF,NULL

        END

