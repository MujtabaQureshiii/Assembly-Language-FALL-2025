Include irvine32.inc
.data
promptStr byte &quot;Enter a string: &quot;, 0
wordMsg byte &quot;Word count: &quot;, 0
inputBuffer byte 256 dup(0)
maxLen dword 255
.code
main proc
mov edx, offset promptStr
call writestring
mov ecx, maxLen
mov edx, offset inputBuffer
call readstring
mov esi, offset inputBuffer
xor ebx, ebx
xor ecx, ecx
count_loop:
mov al, [esi]
cmp al, 0
je next
cmp al, 13
je next
cmp al, 10
je next
cmp al, &#39; &#39;

je is_space
cmp bl, 1
je advance_char
inc ecx
mov bl, 1
jmp advance_char
is_space:
mov bl, 0
advance_char:
inc esi
jmp count_loop
next:
mov edx, offset wordMsg
call writestring
mov eax, ecx
call writedec
call crlf
exit
main endp
end main
