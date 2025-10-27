INCLUDE Irvine32.inc
.data
prompt1 BYTE &quot;Enter a 16-bit value: &quot;, 0
prompt2 BYTE &quot;Enter the rotation key (1-7): &quot;, 0
encrypted BYTE &quot;Encrypted value (after left rotation): &quot;, 0
decrypted BYTE &quot;Decrypted value (after right rotation): &quot;, 0
.code
main PROC
mov edx, OFFSET prompt1
call WriteString
call ReadInt
mov bx, ax
mov edx, OFFSET prompt2
call WriteString
call ReadInt
mov cl, al
mov ax, bx
rol ax, cl
mov edx, OFFSET encrypted
call WriteString
call WriteDec
call Crlf
mov ax, bx
rol ax, cl
ror ax, cl
mov edx, OFFSET decrypted
call WriteString
call WriteDec
call Crlf
exit
main ENDP
END main
