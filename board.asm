getCell:
; Inputs
; a - y
; c - x
; Outputs (all can be ignored)
; e - unchanged
; d - 0
; a - value read from backScreen
; bc - (backScreen)
; hl - offset into bc
    ld d,0
    ld e,ScreenWidth
    call DE_Times_A ; answer in HL
    ld b,0
    add hl,bc
    ; HL contains offset
    ; add offset to start of buffer
    ld bc,(backScreen)
    add hl,bc
    ld a,(hl)   ; get value at x,y
    ret

setCellAlive:
; Inputs
; a - y
; c - x
; Outputs (all can be ignored)
; e - unchanged
; a - unchanged
; bc - (frontScreen)
; hl - offset into bc
    ld d,0
    ld e,ScreenWidth
    call DE_Times_A ; answer in HL
    ld b,0
    add hl,bc
    ; HL contains offset
    ; add offset to start of buffer
    ld bc,(frontScreen)
    add hl,bc

    ; Set cell alive
    ld (hl),1   ; set value at x,y to 1
    ret

setCellDead:
; Inputs
; a - y
; c - x
; Outputs (all can be ignored)
; e - unchanged
; a - unchanged
; bc - (frontScreen)
; hl - offset into bc
    ld d,0
    ld e,ScreenWidth
    call DE_Times_A ; answer in HL
    ld b,0
    add hl,bc
    ; HL contains offset
    ; add offset to start of buffer
    ld bc,(frontScreen)
    add hl,bc

    ; Set cell alive
    ld (hl),0   ; set value at x,y to 1
    ret

; need these for later
Ex: db 0
Wx: db 0
Ny: db 0
Sy: db 0
cellTot: db 0

calcNeighbour:
; Inputs
; global "currentCell" variable to be copied into hl

; Used internally
; c,a - xy co-ords of cell to check
; Return
; a contains total

    ld ix,cellTot

; N
    ld hl,(currentCell)
    ld c,h  ; store X pos
    ld a,l  ; store Y pos
    sub 1   ; decrement Y pos
    jp nc, calcn   ; No carry means we're done
    ; else
    ld a,ScreenHeight
    dec a

calcn:      ; get value from N cell
    ; store y pos for later
    ld (Ny),a
    ; here c,a should contain xy position of cell to check
    call getCell
    ld (ix+0),a  ; store result

; S
    ld hl,(currentCell)
    ld c,h  ; store X pos
    ld a,l  ; store Y pos
    inc a
    cp ScreenHeight
    jp nz, calcs    ; no zero means we're done
    ; else
    ;ld a,0
    xor a
calcs:
    ; store Y for later
    ld (Sy),a
    call getCell
    add a,(ix+0)
    ld (ix+0),a  ; store result

; E
    ld hl,(currentCell)
    ld a,h  ; X
    inc a
    cp ScreenWidth
    jp nz, calce
    ;ld a,0
    xor a
calce:
    ld (Ex),a   ; store X for later
    ld c,a  ; New X
    ld a,l  ; Existing Y
    call getCell
    add a,(ix+0)
    ld (ix+0),a  ; store result

; W
    ld hl,(currentCell)
    ld a,h
    sub 1
    jp nc, calcw
    ld a,ScreenWidth
    dec a
calcw:
    ld (Wx),a   ; store X for later
    ld c,a  ; New X
    ld a,l  ; Existing Y
    call getCell
    add a,(ix+0)
    ld (ix+0),a  ; store result

; NE
    ld a,(Ex)
    ld c,a
    ld a,(Ny)
    call getCell
    add a,(ix+0)
    ld (ix+0),a  ; store result
; SE
    ld a,(Ex)
    ld c,a
    ld a,(Sy)
    call getCell
    add a,(ix+0)
    ld (ix+0),a  ; store result
; SW
    ld a,(Wx)
    ld c,a
    ld a,(Sy)
    call getCell
    add a,(ix+0)
    ld (ix+0),a  ; store result
; NW
    ld a,(Wx)
    ld c,a
    ld a,(Ny)
    call getCell
    add a,(ix+0)

    ld (ix+0),a  ; store result
; a now contains total of all neighbours
    ret


neighbourCount: db 0
currentCell: db 0,0
; lifeRules
simulate:
    ; always write to back screen, data comes from front screen
    ld c, ScreenHeight  ; Y

    ; This loop counts backwards, starting at 'ScreenWidth' and stops at 1
    ; So indices need offsetting by -1
nextCSim:
    ld b,ScreenWidth    ; X
    ; outer loop code here
nextBSim:
    ; inner loop code here
    push bc

    ; Fix x,y by -1
    dec b
    dec c
    
    ; Put fixed x,y co-ords into hl
    ld h,b
    ld l,c
    ld (currentCell),hl

    ; Calculate neighbour total of x,y
    call calcNeighbour
    ; total in a
    ld (neighbourCount),a

    ld hl,(currentCell)
    ld c,h
    ld a,l
    call getCell
    ; cell in a
    ;cp 1    ; cell alive?
    dec a
    jp nz,deadCell

aliveCell:
    ld a,(neighbourCount)
    ; if you have 2 or 3 neighbours, stay alive
    cp 2
    jp z,beAlive
    cp 3
    jp z,beAlive
    jp beDead   ; else you're dead
deadCell:
    ld a,(neighbourCount)
    cp 3    ; If you have 3 live neighbours, you become alive
    jp nz,beDead
beAlive:
    ld hl,(currentCell)
    ld c,h
    ld a,l
    call setCellAlive
    jp cellDone
beDead:
    ld hl,(currentCell)
    ld c,h
    ld a,l
    call setCellDead
cellDone:
    pop bc
    djnz nextBSim
    dec c
    jp nz,nextCSim

    ret