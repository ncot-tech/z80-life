; Defines to avoid having to do any actual maths in the simulation
middleRowLength EQU ScreenWidth*(ScreenHeight-1)    ;-1

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
    push de
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
    pop de

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
    add a,(hl)   ; Add to A

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
    add a,(hl)   ; Add to A
    
    ret

; Puts neighbour count into grid for debugging
; set de to be cell to check
; set b to be neighbour count of that cell
setNewCellNeighbourCount:
    ld hl,(otherGrid)
    add hl,de
    ld (hl),b

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
;    call printNl
    ; use de as the counter
    ld de,0

    ; do "A"
    call calcA
    ld b,a
    call setNewCell
    inc de

;    ld a,'A'
;    call printChr

    
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
;    ld a,"T"
;    call printChr

    inc de
    jp doTopRow
doneTopRow: 

    ; do "B"
    call calcB
    ld b,a
    call setNewCell
    inc de

;    ld a,"B"
;    call printChr
;    call printNl

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

;    ld a,"L"
;    call printChr

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
    
;    ld a,"M"
;    call printChr

    inc de
    jp doMiddleCells ; repeat if not finished
doneMiddleCells:

    ; calculate right cell
    call calcRCell
    ld b,a
    call setNewCell
    
;    ld a,'R'
;    call printChr
;    call printNl
    inc de
    jp doMiddleRows ; if not looped enough, go back
doneMiddleRows:

    call calcC
    ld b,a
    call setNewCell
    inc de

;    ld a,'C'
;    call printChr

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
    
;    ld a,'B'
;    call printChr
    
    inc de
    jp doBottomRow ; if not looped enough, go back
doneBottomRow:

    call calcD
    ld b,a
    call setNewCell

;    ld a,'D'
;    call printChr

    ret

CellCtr:
    db  0,0