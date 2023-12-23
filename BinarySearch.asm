.model small
.386
.data
m1 db 10,13,'Enter size of array : $'
m2 db 10,13,'Enter array elements in sorted order : $'
m3 db 10,13,'Enter Key : $'
m4 db 10,13,'Key Found $'
m5 db 10,13,'Key not found $'
;lbreak db "",13,10,"$"
size db (?)
key db (?)
l db (?)
h db (?)
mid db (?)
a db(?)
index db (?)
arr1 db 10 dup(?)

.code
.startup

mov dx,offset m1
mov ah,09h
int 21h

mov ah,1
int 21h

sub al,30h
mov size,al


;mov dx,offset lbreak
;mov ah,09h
;int 21h

mov dx,offset m2
mov ah,09h
int 21h

mov al,0
LEA SI,arr1
mov cl,size
inparr:
 
      mov ah,1
      int 21h
      
      cmp al,'A'
      jge l1      
      
      sub al,30h
      jmp l2
      
      l1: sub al,37h
      
      l2:
            mov [SI],al
            inc SI
      mov dl,20h
      mov ah,02h
      int 21h
      loop inparr

      ;mov dx,offset lbreak
      ;mov ah;,09h
      ;int 21h

mov dx,offset m3
mov ah,09h
int 21h

inpkey:
        mov ah,1
        int 21h
        cmp al,'A'
        jge l3
        sub al,30h
        jmp l4
        l3:sub al,37h
        l4:
            mov key,al
mov al,0
mov SI,00000000H
LEA BX,arr1
mov cl,key
mov bl,0
mov dl,size
    
findkey:
    cmp bl,dl
    ja findfalse
    mov al,bl
    add al,dl
    mov ah,0
    shr ax,1
    mov si,ax
    cmp cl,arr1[si]
    jae greater
    dec al
    mov dl,al
    jmp findkey
    
greater:
    je findtrue
    inc al
    mov bl,al
    jmp findkey
    

findfalse:
    ;mov dx,offset lbreak
    ;mov ah,09h
    ;int 21h

    mov dx,offset m5
    mov ah,09h
    int 21h
    jmp myexit


findtrue:
    ;mov dx,offset lbreak
    ;mov ah,09h
    ;int 21h

    mov dx,offset m4
    mov ah,09h
    int 21h

    
    

myexit:
    mov ah,4ch
    int 21h
end