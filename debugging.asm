; Puts neighbour count into grid for debugging
; set de to be cell to check
; set b to be neighbour count of that cell
setNewCellNeighbourCount:
    ld hl,(otherGrid)
    add hl,de
    ld (hl),b
    ret

printBoardNeighbourCount:
    call cls
    ld de,0
    ld b,0
printLoopN:
    ld hl,(currentGrid)
    add hl,de
    ld a,(hl)
    add a,48
    call printChr
    
    inc de
    inc b

    ld hl,ScreenSize   ; this is a constant
    or a
    sbc hl,de
    add hl,de
    jp z,printLoopDoneN
        
    ld a,ScreenWidth
    cp b
    jp nz,printLoopN
    call printNl
    ld b,0
    jp printLoopN
printLoopDoneN:
    call printNl
    ld a,'N'
    call printChr
    call printNl
    ret