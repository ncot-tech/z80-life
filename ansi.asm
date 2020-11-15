; de - address of text to print
printStr:
    push hl
    ld c,$06
    rst $30
    pop hl
    ret

; Put the char into a
printChr:
    push hl
    push bc
    ld c,$02
    rst $30
    pop bc
    pop hl
    ret

printNl:
    push hl
    push bc
    ld c,$07
    rst $30
    pop bc
    pop hl
    ret


; de - address of text to print
; bc - x,y position
printat:
    push ix
    push de ; for later
    push bc ; so we don't lose it

    ; x pos first, stored in b
    ld ix,cursoransi+5  ; column (x) comes second
    ld c,b
    call itoa

    ; y pos now
    pop bc
    ld ix,cursoransi+2  ; row (y)
    call itoa
    
    ; print ansi escape sequence
    ld de,cursoransi
    call printStr

    ; print text
    pop de
    call printStr
    pop ix
    ret

cls:
    ld de,clsansi
    ld c,$06
    rst $30
    ret

; ###############################################################
; Clear a character
clearchar:
    push de
    ld de,clearChar
    call printat
    pop de
    ret

clearChar:
    dz $1B,"[1;5;37;42m", " "
clsansi:
    db $1B,"[36;40m"    ; Cyan on black text
    ; dz $1B,"[2J",$1B,"[0;0f"    ; Clear and home
    dz $1B,"[0;0f"
cursoransi:
    dz $1B,"[00;00f"