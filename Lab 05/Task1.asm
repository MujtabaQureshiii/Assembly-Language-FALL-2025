include irvine32.inc
.data
salaries dword 20000, 22000, 31000, 42000, 50000
totalbytes dword ?
sumall dword ?
avgsal dword ?
msgtotal byte &quot;total number of bytes: &quot;, 0
msgsum byte &quot;sum of all salaries: &quot;, 0
msgavg byte &quot;average salary: &quot;, 0
.code
main proc
mov eax, sizeof salaries
mov totalbytes, eax
mov eax, salaries[0*type salaries]
add eax, salaries[1*type salaries]
add eax, salaries[2*type salaries]
add eax, salaries[3*type salaries]
add eax, salaries[4*type salaries]
mov sumall, eax
mov ebx, lengthof salaries
cdq
idiv ebx
mov avgsal, eax
mov edx, offset msgtotal

call writestring
mov eax, totalbytes
call writeint
call crlf
mov edx, offset msgsum
call writestring
mov eax, sumall
call writeint
call crlf
mov edx, offset msgavg
call writestring
mov eax, avgsal
call writeint
call crlf
exit
main endp
end main
