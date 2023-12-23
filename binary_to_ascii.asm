;convert binary to ascii character
.model small
.data
msg db 10,13, "Enter the binary number : $"
msg1 db 10,13, "The Ascii character is : $"
arr db ?
.code
.startup
mov ah,09h
mov dx,offset msg
int 21h
mov bl,00h
mov cl,08h
INPUT:
    mov ah,01h
    int 21h
    sub al,30h
    shl bl,1
    add bl,al
loop INPUT
mov ah,09h
lea dx,msg1
int 21h
mov ah,02h
mov dl,bl
int 21h
.exit
end


