.model SMALL
.386
.data
array db 5,9,10,30,4
m1 db 10,13,"Number found!$"
m2 db 10,13,"NOt found!$"
.code
.startup
mov cx,5
lea SI,array              ;source index
mov dl,40
l1:
     cmp dl,[SI]
     je l2                ;jump equal to
     inc SI
loop l1
lea dx,m2
mov ah,09
int 21h
jmp exit
l2:
    lea dx,m1
    mov ah,09
    int 21h
exit:
.exit
end
   
