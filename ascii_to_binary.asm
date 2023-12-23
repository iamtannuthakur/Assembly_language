;program to convert ascii to binary
.model small
.386
.data
m1 db 10,13,"Enter a ascii code: $"
m2 db 10,13,"Binary digits: $"
.code
.startup

mov dx, offset m1
mov ah,09h
int 21h

mov ah,1
int 21h
 mov dx,offset m2
 mov ah,09h
 int 21h
 mov dx,0000H
 mov ebx,00000000H
 mov ebx,eax
           mov cl,8
           displayResult1:
             rol bl,1
             mov dl,bl
             and dl,01h
             add dl,30h
             mov ah,02h
             int 21h
             loop displayResult1
.exit
end
