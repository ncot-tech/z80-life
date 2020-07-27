; compares two x,y points to see if they overlap
; bc - point 1, de - point 2
; a - 1 if they overlap, else 0
comparepoints:
; x pos
    ld a,b  ; compare b-d
    cp d
    jp z, ypos
    jp nocollide
ypos:
    ld a,c  ; compare c-e
    cp e
    jp z, collide
    jp nocollide
collide:
    ld a,1
    ret

nocollide:
    ld a,0
    ret

; convert 8 bit integer into ascii
; put number into c
; put address of string position in ix
; a changed
itoa:
    push bc
    push de
    ld d,10
    call C_Div_D
    add a,$30
    ld (ix+1),a
    ld a,c
    add $30
    ld (ix),a
    pop de
    pop bc
    ret

;-----> Generate a random number
; output a=answer 0<=a<=255
; all registers are preserved except: af
random:
        push    hl
        push    de
        ld      hl,(randData)
        ld      a,r
        ld      d,a
        ld      e,(hl)
        add     hl,de
        add     a,l
        xor     h
        ld      (randData),hl
        pop     de
        pop     hl
        ret

randData:
    db 0,0

C_Div_D:
;Inputs:
;     C is the numerator (C/d)
;     D is the denominator (c/D)
;Outputs:
;     A is the remainder
;     B is 0
;     C is the result of C/D
;     D,E,H,L are not changed
;
    ld b,8
    xor a
    sla c
    rla
    cp d
    jr c,$+4
        inc c
        sub d
    djnz $-8
    ret

C_Times_D:
;Outputs:
;     A is the result
;     B is 0
     ld b,8          ;7           7
     xor a           ;4           4
       rlca          ;4*8        32
       rlc c         ;8*8        64
       jr nc,$+3     ;(12|11)    96|88
         add a,d     ;--
       djnz $-6      ;13*7+8     99
     ret             ;10         10
;304+b (b is number of bits)
;308 is average speed.
;12 bytes

;===============================================================
DE_Times_A:
;===============================================================
;Inputs:
;     DE and A are factors
;Outputs:
;     A is unchanged
;     BC is unchanged
;     DE is unchanged
;     HL is the product
;speed: min 199 cycles
;       max 261 cycles
;        212+6b cycles +15 if odd, -11 if non-negative
;=====================================Cycles====================
;1
     ld hl,0            ;210000           10      10
     rlca                   ;07             4
     jr nc,$+5 : ld h,d : ld e,l  ;3002626B   12+14p
;2
     add hl,hl              ;29            --
     rlca                   ;07             4
     jr nc,$+3 : add hl,de  ;300119     12+6b
;3
     add hl,hl              ;29            11
     rlca                   ;07             4
     jr nc,$+3 : add hl,de  ;300119     12+6b
;4
     add hl,hl              ;29            11
     rlca                   ;07             4
     jr nc,$+3 : add hl,de  ;300119     12+6b
;5
     add hl,hl              ;29            11
     rlca                   ;07             4
     jr nc,$+3 : add hl,de  ;300119     12+6b
;6
     add hl,hl              ;29            11
     rlca                   ;07             4
     jr nc,$+3 : add hl,de  ;300119     12+6b
;7
     add hl,hl              ;29            11
     rlca                   ;07             4
     jr nc,$+3 : add hl,de  ;300119     12+6b
;8
     add hl,hl              ;29            11
     rlca                   ;07             4
     ret nc                 ;D0         11-6b
     add hl,de              ;300119     12+6b
     ret                    ;C9            10

DE_Times_Aslow:
;Inputs:
;     DE and A are factors
;Outputs:
;     A is not changed
;     B is 0
;     C is not changed
;     DE is not changed
;     HL is the product
;Time:
;     342+6x
;
     ld b,8          ;7           7
     ld hl,0         ;10         10
       add hl,hl     ;11*8       88
       rlca          ;4*8        32
       jr nc,$+3     ;(12|18)*8  96+6x
         add hl,de   ;--         --
       djnz $-5      ;13*7+8     99
     ret             ;10         10

; Delays for bc * de times
delay:
    LD BC, 100h            ;Loads BC with hex 1000
Outer:
    LD DE, 100h            ;Loads DE with hex 1000
Inner:
    DEC DE                  ;Decrements DE
    LD A, D                 ;Copies D into A
    OR E                    ;Bitwise OR of E with A (now, A = D | E)
    JP NZ, Inner            ;Jumps back to Inner: label if A is not zero
    DEC BC                  ;Decrements BC
    LD A, B                 ;Copies B into A
    OR C                    ;Bitwise OR of C with A (now, A = B | C)
    JP NZ, Outer            ;Jumps back to Outer: label if A is not zero
    RET                     ;Return from call to this subroutine