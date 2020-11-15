    OUTPUT life.z80
    ORG $8000

; Defines
ScreenWidth EQU 80
ScreenHeight EQU 25
ScreenSize EQU ScreenWidth*ScreenHeight

DeadChar EQU $20
AliveChar EQU $40

    call printBoard
main:
    call calcCells
    call swapScreen
    call printBoard
    ;call printBoardNeighbourCount
    ; loop
    jp main
    ret

printBoard:
    call cls
    ld de,boardTop
    call printStr
    call printNl
    ld a,'|'
    call printChr

    ld de,0
    ld b,0
printLoop:
    ld hl,(currentGrid)
    add hl,de
    ld a,(hl)
    cp 1

    jp nz, printDeadCell
    ld a,AliveChar
    call printChr
    jp printCharDone
printDeadCell:
    ld a,DeadChar
    call printChr
printCharDone:
    inc de
    inc b

    ld hl,ScreenSize   ; this is a constant
    or a
    sbc hl,de
    add hl,de
    jp z,printLoopDone
        
    ld a,ScreenWidth
    cp b
    jp nz,printLoop
    ld a,'|'
    call printChr
    call printNl
    ld a,'|'
    call printChr
    ld b,0
    jp printLoop
printLoopDone:
    ld a,'|'
    call printChr
    call printNl
    ld de,boardBottom
    call printStr

    ret

; This works, stop debugging it
swapScreen:
    ld hl,(currentGrid)
    ld de,(otherGrid)
    ld (otherGrid),hl
    ld (currentGrid),de
    ret

    include debugging.asm
    include board2.asm
    include utils.asm
    include ansi.asm

    include data.asm

end: