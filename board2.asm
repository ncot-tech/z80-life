; Defines to avoid having to do any actual maths in the simulation
middleRowLength EQU ScreenWidth*(ScreenHeight-1)

CellA EQU 0
CellB EQU ScreenWidth-1
CellC EQU ScreenSize-ScreenWidth
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
    inc hl : add a,(hl)   ; Add to A

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
    inc hl : add a,(hl)   ; Add to A

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
    inc hl : add a,(hl)   ; Add to A

    ret

calcD:
    or a ; a=0

    ; Get contents of Cell C-2
    ld hl,(currentGrid)
    ld bc,CellC-2
    add hl,bc
    ld a,(hl)   ; Add to A

    ; Get contents of Cell C-1
    inc hl : add a,(hl)   ; Add to A

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
    inc hl : add a,(hl)   ; Add to A

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

    ; Get contents of Cell C+x   
    inc hl : add a,(hl)   ; Add to A

    ; Get contents of Cell C+x+1
    inc hl : add a,(hl)   ; Add to A

    ld hl,de
    ; Get contents of x-1
    dec hl      ; -1
    ld bc,(currentGrid)
    add hl,bc   
    add a,(hl)   ; Add to A

    ; Get contents of x+1
    inc hl : inc hl
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
    add hl,bc : ld a,(hl)  ; Add to A

    ; Get contents of Cell x-width
    inc hl : add a,(hl)   ; Add to A

    ; Get contents of Cell x-width+1
    inc hl : add a,(hl)   ; Add to A

    ; Get contents of Cell x-1  
    ld bc,ScreenWidth-2 ; x-1 is ScreenWidth-2 away
    add hl,bc : add a,(hl)   ; Add to A

    ; Get contents of Cell x+1 
    inc hl : inc hl : add a,(hl)   ; Add to A

    ; Get contents of Cell x+width-1
    ld bc,ScreenWidth-2; x+width-1 is ScreenWidth-2 away
    add hl,bc : add a,(hl)   ; Add to A

    ; Get contents of Cell x+width
    inc hl : add a,(hl)   ; Add to A

    ; Get contents of Cell x+width+1
    inc hl : add a,(hl)   ; Add to A
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

    ; Get contents of Cell x-width
    inc hl : add a,(hl)   ; Add to A

    ; Get contents of Cell x-width+1
    inc hl : add a,(hl)   ; Add to A

    ld hl,de
    ; Get contents of Cell x-1
    dec hl      ; -1
    ld bc,(currentGrid)
    add hl,bc   
    add a,(hl)   ; Add to A

    ; Get contents of Cell x+1
    inc hl : inc hl : add a,(hl)   ; Add to A

    ; bottom cells that are actually at the top
    ; calculate cell offset
    ld hl,de
    ld bc,ScreenSize-ScreenWidth
    sbc hl,bc ; this gives us the offset...
    ; but it needs to be taken from the start of the grid...
    ld bc,(currentGrid)
    add hl,bc
    add a,(hl)   ; Add to A

    ; offset -1
    dec hl : add a,(hl)   ; Add to A

    ; offset +1
    inc hl : inc hl : add a,(hl)   ; Add to A

    ret
calcLCell:
    or a ; a=0

    ; start with (2)
    ld hl,de
    ld bc,ScreenWidth
    sbc hl,bc
    ld bc,(currentGrid)
    add hl,bc   
    ld a,(hl)   ; Add to A

    ; then 3
    inc hl : add a,(hl)   ; Add to A
    
    ; then 1
    ld bc,ScreenWidth-2
    add hl,bc : add a,(hl)   ; Add to A

    ; then 5
    inc hl : inc hl : add a,(hl)   ; Add to A

    ; then 4
    ld bc,ScreenWidth-2
    add hl,bc : add a,(hl)   ; Add to A

    ; then 7
    inc hl : add a,(hl)   ; Add to A

    ; then 8
    inc hl : add a,(hl)   ; Add to A

    ; then 6
    ld bc,ScreenWidth-2
    add hl,bc : add a,(hl)   ; Add to A

    ret
calcRCell:
    or a ; a=0

    ; Start at x-((width*2)-1) (3)
    ld hl,de
    ld bc,(ScreenWidth*2)-1
    sbc hl,bc
    ld bc,(currentGrid)
    add hl,bc   
    ld a,(hl)   ; Add to A

    ; move to x-width-1 which is width-2 away (1)
    ld bc,ScreenWidth-2
    add hl,bc : add a,(hl)   ; Add to A

    ; Then the next cell (2)
    inc hl : add a,(hl)   ; Add to A

    ; The next which is on the next row (5)
    inc hl : add a,(hl)   ; Add to A

    ; Then x-1 (4)
    ld bc,ScreenWidth-2
    add hl,bc : add a,(hl)

    ; then x+1 (8)
    inc hl : inc hl : add a,(hl)

    ; then (6)
    ld bc,ScreenWidth-2
    add hl,bc : add a,(hl)

    ; then (7)
    inc hl : add a,(hl)
    
    ret

; Set cell to alive or dead
; set de to be cell to check
; set b to be neighbour count of that cell
setNewCell:
    ld hl,(currentGrid)
    add hl,de
    ld a,(hl)   ; A contains state of current cell
    cp a,1      ; if a == 1
    jp nz,cellDead:  ;   if a == 0, jump over this code
    ; cell is alive
    ld a,b  
    cp a,3
    jp z,setCellAlive  ; is the neighbour count 3? => Lives
    cp a,2
    jp z,setCellAlive  ; is the neighbour count 2? => Lives
    jp nz,setCellDead  ; else => dies

cellDead:       ; cell is dead
    ld a,b
    cp a,3
    jp z,setCellAlive ; is neighbour count 3? => Lives
    ; else fall through
setCellDead:
    ld hl,(otherGrid)
    add hl,de
    ld (hl),0

    ret
setCellAlive:
    ld hl,(otherGrid)
    add hl,de
    ld (hl),1

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
    ; now work out if we need to loop again
    ld hl,ScreenWidth-1 ; while de < width-1
    or a
    sbc hl,de
    add hl,de
    jp z,doneTopRow

    ; calculate cell's neighbours
    call calcTopRowCell
    ld b,a
    ; and set next state
    call setNewCell

    inc de
    jp doTopRow
doneTopRow: 

    ; do "B"
    call calcB
    ld b,a
    call setNewCell
    inc de

doMiddleRows:
    ; comparison to see if we're at the end of the whole middle section
    ; de contains current cell index
    ; hl contains value to stop at
    ld hl,middleRowLength   ; this is a constant
    or a
    sbc hl,de
    add hl,de
    jp z,doneMiddleRows

    ; end = pos + width -1
    ld hl,ScreenWidth       ; get screen width
    add hl,de               ; add current cell index
    dec hl                  ; subtract 1
    ld (CellCtr),hl   ; store result
    ; de still contains current cell index
    
    ; calculate left cell
    call calcLCell
    ld b,a
    call setNewCell
    inc de

    ; loop and calculate middle cells of row
doMiddleCells:
    ; calculate middle cell

    ; comparison to see if we're at the end of the row -1
    ; de contains current cell index
    ; hl contains loop counter
    ld hl,(CellCtr)   ; get end index
    or a        ; clear flags
    sbc hl,de   ;
    add hl,de   ; do 16 bit comparison between hl and de
    jp z,doneMiddleCells

    call calcMiddleCell
    ld b,a
    call setNewCell

    inc de
    jp doMiddleCells ; repeat if not finished
doneMiddleCells:

    ; calculate right cell
    call calcRCell
    ld b,a
    call setNewCell
    
    inc de
    jp doMiddleRows ; if not looped enough, go back
doneMiddleRows:

    call calcC
    ld b,a
    call setNewCell
    inc de

doBottomRow:
    ; comparison to see if we're at the end of the bottom row
    ; de contains current cell index
    ; hl contains loop counter
    ld hl,(ScreenWidth*ScreenHeight)-1
    or a
    sbc hl,de
    add hl,de
    jp z,doneBottomRow

    call calcBottomRowCell
    ld b,a
    call setNewCell
       
    inc de
    jp doBottomRow ; if not looped enough, go back
doneBottomRow:

    call calcD
    ld b,a
    call setNewCell

    ret

CellCtr:
    db  0,0