; Defines to avoid having to do any actual maths in the simulation
middleRowLength EQU ScreenWidth*(ScreenHeight-1)-1

CellA EQU 0
CellB EQU ScreenWidth-1
CellC EQU ScreenWidth*(ScreenHeight-1)
CellD EQU ScreenSize-1

; Total returned in a
; Later we can optimise the order of additions
; to remove all the ld hl,(currentGrid) calls
calcA:
    or a ; a=0

    ; Get contents of Cell D
    ld hl,(currentGrid)
    ld bc,CellD
    add hl,bc
    ld a,(hl)   ; Add to A

    ; Get contents of Cell C
    ld hl,(currentGrid)
    ld bc,CellC
    add hl,bc
    add a,(hl)   ; Add to A

    ; Get contents of Cell C+1
    ld hl,(currentGrid)
    ld bc,CellC+1
    add hl,bc
    add a,(hl)   ; Add to A

    ; Get contents of Cell B
    ld hl,(currentGrid)
    ld bc,CellB
    add hl,bc
    add a,(hl)   ; Add to A

    ; Get contents of Cell A+1
    ld hl,(currentGrid)
    ld bc,CellA+1
    add hl,bc
    add a,(hl)   ; Add to A

    ; Get contents of Cell B+Width
    ld hl,(currentGrid)
    ld bc,CellB+ScreenWidth
    add hl,bc
    add a,(hl)   ; Add to A

    ; Get contents of Cell B+1
    ld hl,(currentGrid)
    ld bc,CellB+1
    add hl,bc
    add a,(hl)   ; Add to A

    ; Get contents of Cell B+2
    ld hl,(currentGrid)
    ld bc,CellB+2
    add hl,bc
    add a,(hl)   ; Add to A

    ret

calcB:
    or a ; a=0

    ; Get contents of Cell D-1
    ld hl,(currentGrid)
    ld bc,CellD-1
    add hl,bc
    ld a,(hl)   ; Add to A

    ; Get contents of Cell D
    ld hl,(currentGrid)
    ld bc,CellD
    add hl,bc
    add a,(hl)   ; Add to A

    ; Get contents of Cell C
    ld hl,(currentGrid)
    ld bc,CellC
    add hl,bc
    add a,(hl)   ; Add to A

    ; Get contents of Cell B-1
    ld hl,(currentGrid)
    ld bc,CellB-1
    add hl,bc
    add a,(hl)   ; Add to A

    ; Get contents of Cell A
    ld hl,(currentGrid)
    ld bc,CellA
    add hl,bc
    add a,(hl)   ; Add to A

    ; Get contents of Cell B+Width-1
    ld hl,(currentGrid)
    ld bc,CellB+ScreenWidth-1
    add hl,bc
    add a,(hl)   ; Add to A

    ; Get contents of Cell B+Width
    ld hl,(currentGrid)
    ld bc,CellB+ScreenWidth
    add hl,bc
    add a,(hl)   ; Add to A

    ; Get contents of Cell B+1
    ld hl,(currentGrid)
    ld bc,CellB+1
    add hl,bc
    add a,(hl)   ; Add to A

    ret

calcC:
    or a ; a=0

    ; Get contents of Cell D-ScreenWidth
    ld hl,(currentGrid)
    ld bc,CellD-ScreenWidth
    add hl,bc
    ld a,(hl)   ; Add to A

    ; Get contents of Cell C-ScreenWidth
    ld hl,(currentGrid)
    ld bc,CellC-ScreenWidth
    add hl,bc
    add a,(hl)   ; Add to A

    ; Get contents of Cell C-ScreenWidth-1
    ld hl,(currentGrid)
    ld bc,CellC-ScreenWidth-1
    add hl,bc
    add a,(hl)   ; Add to A

    ; Get contents of Cell D
    ld hl,(currentGrid)
    ld bc,CellD
    add hl,bc
    add a,(hl)   ; Add to A

    ; Get contents of Cell C+1
    ld hl,(currentGrid)
    ld bc,CellC+1
    add hl,bc
    add a,(hl)   ; Add to A

    ; Get contents of Cell B
    ld hl,(currentGrid)
    ld bc,CellB
    add hl,bc
    add a,(hl)   ; Add to A

    ; Get contents of Cell A
    ld hl,(currentGrid)
    ld bc,CellA
    add hl,bc
    add a,(hl)   ; Add to A

    ; Get contents of Cell A+1
    ld hl,(currentGrid)
    ld bc,CellA+1
    add hl,bc
    add a,(hl)   ; Add to A

    ret

calcD:
    or a ; a=0

    ; Get contents of Cell C-2
    ld hl,(currentGrid)
    ld bc,CellC-2
    add hl,bc
    ld a,(hl)   ; Add to A

    ; Get contents of Cell C-1
    ld hl,(currentGrid)
    ld bc,CellC-1
    add hl,bc
    add a,(hl)   ; Add to A

    ; Get contents of Cell C-ScreenWidth
    ld hl,(currentGrid)
    ld bc,CellC-ScreenWidth
    add hl,bc
    add a,(hl)   ; Add to A

    ; Get contents of Cell D-1
    ld hl,(currentGrid)
    ld bc,CellD-1
    add hl,bc
    add a,(hl)   ; Add to A

    ; Get contents of Cell C
    ld hl,(currentGrid)
    ld bc,CellC
    add hl,bc
    add a,(hl)   ; Add to A

    ; Get contents of Cell B-1
    ld hl,(currentGrid)
    ld bc,CellB-1
    add hl,bc
    add a,(hl)   ; Add to A

    ; Get contents of Cell B
    ld hl,(currentGrid)
    ld bc,CellB
    add hl,bc
    add a,(hl)   ; Add to A

    ; Get contents of Cell A
    ld hl,(currentGrid)
    ld bc,CellA
    add hl,bc
    add a,(hl)   ; Add to A

    ret

; pass in cell to check as de
calcTopRowCell:
    or a ; a=0

    ld hl,de
    ; Get contents of Cell C+x-1
    ld bc,CellC
    add hl,bc   ; c+x
    dec hl      ; -1
    ld bc,(currentGrid)
    add hl,bc   
    ld a,(hl)   ; Add to A

    ld hl,de
    ; Get contents of Cell C+x
    ld bc,CellC
    add hl,bc   ; c+x
    ld bc,(currentGrid)
    add hl,bc   
    add a,(hl)   ; Add to A

    ld hl,de
    ; Get contents of Cell C+x+1
    ld bc,CellC
    add hl,bc   ; c+x
    inc hl      ; +1
    ld bc,(currentGrid)
    add hl,bc   
    add a,(hl)   ; Add to A

    ld hl,de
    ; Get contents of x-1
    dec hl      ; -1
    ld bc,(currentGrid)
    add hl,bc   
    add a,(hl)   ; Add to A

    ld hl,de
    ; Get contents of x+1
    inc hl      ; -1
    ld bc,(currentGrid)
    add hl,bc   
    add a,(hl)   ; Add to A

    ld hl,de
    ; Get contents of x+width-1
    ld bc,ScreenWidth
    add hl,bc   ; x+width
    dec hl      ; -1
    ld bc,(currentGrid)
    add hl,bc   
    add a,(hl)   ; Add to A

    ld hl,de
    ; Get contents of x+width
    ld bc,ScreenWidth
    add hl,bc   ; x+width
    ld bc,(currentGrid)
    add hl,bc   
    add a,(hl)   ; Add to A

    ld hl,de
    ; Get contents of x+width+1
    ld bc,ScreenWidth
    add hl,bc   ; x+width
    inc hl      ; +1
    ld bc,(currentGrid)
    add hl,bc   
    add a,(hl)   ; Add to A

    ret
; pass in cell to check as de
calcMiddleCell:
    or a ; a=0

    ld hl,de
    ; Get contents of Cell x-width-1
    ld bc,ScreenWidth
    sbc hl,bc   ; x-width
    dec hl      ; -1
    ld bc,(currentGrid)
    add hl,bc   
    ld a,(hl)   ; Add to A

    ld hl,de
    ; Get contents of Cell x-width
    ld bc,ScreenWidth
    sbc hl,bc   ; x-width
    ld bc,(currentGrid)
    add hl,bc   
    add a,(hl)   ; Add to A

    ld hl,de
    ; Get contents of Cell x-width+1
    ld bc,ScreenWidth
    sbc hl,bc   ; x-width
    inc hl      ; +1
    ld bc,(currentGrid)
    add hl,bc   
    add a,(hl)   ; Add to A

    ld hl,de
    ; Get contents of Cell x-1
    dec hl      ; -1
    ld bc,(currentGrid)
    add hl,bc   
    add a,(hl)   ; Add to A

    ld hl,de
    ; Get contents of Cell x+1
    inc hl      ; +1
    ld bc,(currentGrid)
    add hl,bc   
    add hl,bc   ; Add to A

    ld hl,de
    ; Get contents of Cell x+width-1
    ld bc,ScreenWidth
    add hl,bc   ; x+width
    dec hl      ; -1
    ld bc,(currentGrid)
    add hl,bc   
    add a,(hl)   ; Add to A

    ld hl,de
    ; Get contents of Cell x+width
    ld bc,ScreenWidth
    add hl,bc   ; x+width
    ld bc,(currentGrid)
    add hl,bc   
    add a,(hl)   ; Add to A

    ld hl,de
    ; Get contents of Cell x+width+1
    ld bc,ScreenWidth
    add hl,bc   ; x+width
    inc hl      ; +1
    ld bc,(currentGrid)
    add hl,bc   
    add a,(hl)   ; Add to A

    ret
; pass in cell to check as de
calcBottomRowCell:
    or a ; a=0

    ld hl,de
    ; Get contents of Cell x-width-1
    ld bc,ScreenWidth
    sbc hl,bc   ; x-width
    dec hl      ; -1
    ld bc,(currentGrid)
    add hl,bc   
    ld a,(hl)   ; Add to A

    ld hl,de
    ; Get contents of Cell x-width
    ld bc,ScreenWidth
    sbc hl,bc   ; x-width
    ld bc,(currentGrid)
    add hl,bc   
    add a,(hl)   ; Add to A

    ld hl,de
    ; Get contents of Cell x-width+1
    ld bc,ScreenWidth
    sbc hl,bc   ; x-width
    inc hl      ; +1
    ld bc,(currentGrid)
    add hl,bc   
    add a,(hl)   ; Add to A

    ld hl,de
    ; Get contents of Cell x-1
    dec hl      ; -1
    ld bc,(currentGrid)
    add hl,bc   
    add a,(hl)   ; Add to A

    ld hl,de
    ; Get contents of Cell x+1
    inc hl      ; +1
    ld bc,(currentGrid)
    add hl,bc   
    add a,(hl)   ; Add to A

    ; bottom cells that are actually at the top
    ; calculate cell offset
    ld hl,de
    ld de,ScreenSize-ScreenWidth
    sbc hl,de
    add a,(hl)   ; Add to A

    ; offset -1
    dec hl
    add a,(hl)   ; Add to A

    ; offset +1
    inc hl
    inc hl
    add a,(hl)   ; Add to A

    ret
calcLCell:
    or a ; a=0

    ld hl,de
    ; Get contents of Cell x-1
    dec hl      ; -1
    ld bc,(currentGrid)
    add hl,bc   
    ld a,(hl)   ; Add to A

    ld hl,de
    ; Get contents of Cell x-width
    ld bc,ScreenWidth
    sbc hl,bc   ; x-width
    ld bc,(currentGrid)
    add hl,bc   
    add a,(hl)   ; Add to A

    ld hl,de
    ; Get contents of Cell x+width+1
    ld bc,ScreenWidth
    sbc hl,bc   ; x-width
    inc hl      ; +1
    ld bc,(currentGrid)
    add hl,bc   
    add a,(hl)   ; Add to A

    ld hl,de
    ; Get contents of Cell x-width+1
    ld bc,ScreenWidth
    sbc hl,bc   ; x-width
    dec hl      ; -1
    ld bc,(currentGrid)
    add hl,bc   
    add a,(hl)   ; Add to A

    ld hl,de
    ; Get contents of Cell x+1
    inc hl      ; +1
    ld bc,(currentGrid)
    add hl,bc   
    add hl,bc   ; Add to A

    ld hl,de
    ; Get contents of Cell x+(width*2)-1
    ld bc,ScreenWidth*2
    add hl,bc   ; x+(width*2)
    inc hl      ; +1
    ld bc,(currentGrid)
    add hl,bc   
    add a,(hl)   ; Add to A

    ld hl,de
    ; Get contents of Cell x+width
    ld bc,ScreenWidth
    add hl,bc   ; x+width
    ld bc,(currentGrid)
    add hl,bc   
    add a,(hl)   ; Add to A

    ld hl,de
    ; Get contents of Cell x+width+1
    ld bc,ScreenWidth
    add hl,bc   ; x+width
    inc hl      ; +1
    ld bc,(currentGrid)
    add hl,bc   
    add a,(hl)   ; Add to A

    ret
calcRCell:
    or a ; a=0

    ld hl,de
    ; Get contents of Cell x-width-1
    ld bc,ScreenWidth
    sbc hl,bc   ; x-width
    dec hl      ; -1
    ld bc,(currentGrid)
    add hl,bc   
    ld a,(hl)   ; Add to A

    ld hl,de
    ; Get contents of Cell x-width
    ld bc,ScreenWidth
    sbc hl,bc   ; x-width
    ld bc,(currentGrid)
    add hl,bc   
    add a,(hl)   ; Add to A

    ; x-width-width+1
    ; hl already contains x-width
    ld bc,ScreenWidth
    sbc hl,bc   ; x-width-width
    inc hl      ; +1
    add a,(hl)   ; Add to A

    ld hl,de
    ; Get contents of Cell x-1
    dec hl      ; -1
    ld bc,(currentGrid)
    add hl,bc   
    ld a,(hl)   ; Add to A

    ld hl,de
    ; Get contents of Cell x-width+1
    ld bc,ScreenWidth
    sbc hl,bc   ; x-width
    dec hl      ; -1
    ld bc,(currentGrid)
    add hl,bc   
    add a,(hl)   ; Add to A

    ld hl,de
    ; Get contents of Cell x+width-1
    ld bc,ScreenWidth
    add hl,bc   ; x+width
    dec hl      ; -1
    ld bc,(currentGrid)
    add hl,bc   
    add a,(hl)   ; Add to A

    ld hl,de
    ; Get contents of Cell x+width
    ld bc,ScreenWidth
    add hl,bc   ; x+width
    ld bc,(currentGrid)
    add hl,bc   
    add a,(hl)   ; Add to A

    ld hl,de
    ; Get contents of Cell x+1
    inc hl      ; +1
    ld bc,(currentGrid)
    add hl,bc   
    add hl,bc   ; Add to A
    
    ret
; Set cell to alive or dead
; set de to be cell to check
; set b to be neighbour count of that cell
setNewCell:
    push de
    ld hl,de
    ld de,(currentGrid)
    add hl,de
    ld a,(hl)   ; A contains state of current cell
    cp a,1      ; if a == 1
    jp nz,cellDead:  ;   if a == 0, jump over this code
    ld a,b
    cp a,3
    jp z,setCellAlive  ; is the neighbour count 3?
    cp a,2
    jp z,setCellDead  ; is the neighbour count 2?
    jp nz,setCellDead

cellDead:       ; cell is dead
    ld a,b
    cp a,3
    jp z,setCellAlive
    ; else fall through
setCellDead:
    ld hl,de
    ld de,(otherGrid)
    add hl,de
    ld (hl),0
    pop de
    ret
setCellAlive:
    ld hl,de
    ld de,(otherGrid)
    add hl,de
    ld (hl),1
    pop de
    ret

; Main calculations for whole grid
calcCells:
    ; use de as the counter
    ld de,0

    ; do "A"
    call calcA
    ld b,a
    call setNewCell
    inc de

doTopRow:
    ; calculate cell's neighbours
    call calcTopRowCell
    ld b,a
    ; and set next state
    call setNewCell

    ; now work out if we need to loop again
    ld hl,ScreenWidth-1
    or a
    sbc hl,de
    add hl,de

    inc de
    jp nz,doTopRow  ; while de < width-1

    ; do "B"
    call calcB
    ld b,a
    call setNewCell
    inc de

doMiddleRows:
    ; work out when this row ends

    ; end = pos + width -1
    ld hl,ScreenWidth       ; get screen width
    add hl,de               ; add current cell index
    dec hl                  ; subtract 1
    ld (CellCtr),hl   ; store result
    ; de still contains current cell index
    
    ; calculate left cell
;    call calcLCell
    ld b,a
;    call setNewCell
    inc de

    ; loop and calculate middle cells of row
doMiddleCells:
    ; calculate middle cell
;    call calcMiddleCell
    ld b,a
;    call setNewCell
    

    ; comparison to see if we're at the end of the row -1
    ; de contains current cell index
    ; hl contains loop counter
    ld hl,(CellCtr)   ; get end index
    or a        ; clear flags
    sbc hl,de   ;
    add hl,de   ; do 16 bit comparison between hl and de

    inc de
    jp nz,doMiddleCells ; repeat if not finished

    ; calculate right cell
;    call calcRCell
    ld b,a
;    call setNewCell
    
    ; comparison to see if we're at the end of the whole middle section
    ; de contains current cell index
    ; hl contains value to stop at
    ld hl,middleRowLength   ; this is a constant
    or a
    sbc hl,de
    add hl,de

    inc de
    jp nz,doMiddleRows ; if not looped enough, go back

; does not get here

    call calcC
    ld b,a
    call setNewCell
    inc de

    ; end = pos + width -2
    ld hl,ScreenWidth       ; get screen width
    add hl,de               ; add current cell index
    dec hl                  ; subtract 1
    dec hl                  ; subtract 2
    ld (CellCtr),hl   ; store result
    ; de still contains current cell index

doBottomRow:
    call calcBottomRowCell
    ld b,a
    call setNewCell
    

    ; comparison to see if we're at the end of the bottom row
    ; de contains current cell index
    ; hl contains loop counter
    ld hl,(CellCtr)
    or a
    sbc hl,de
    add hl,de

    inc de
    jp nz,doBottomRow ; if not looped enough, go back

    call calcD
    ld b,a
    call setNewCell

    ret

CellCtr:
    db  0,0