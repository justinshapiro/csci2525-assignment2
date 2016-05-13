; Programming Assignmnet #2 for CSCI 2525 - Assembly Language & Computer Organization
; Written by Justin Shapiro

; DISCLAIMER:
; BEST VIEWED IN NOTEPAD++
; COMMENTS MAY MAKE CODE HARD TO READ IF VIEWED ELSEWHERE

TITLE reorder.asm

INCLUDE Irvine32.inc

.data
	clearEAX TEXTEQU <sub eax, eax>
	clearEBX TEXTEQU <sub ebx, ebx>
	clearECX TEXTEQU <sub ecx, ecx>
	
	arrayD DWORD 1,2,3
	
.code
main PROC

	clearEAX
	clearEBX
	clearECX
		
	mov eax, [arrayD]		    ; move the first element of arrayD into eax
	mov ebx, [arrayD + 4]		; move the second element of arrayD into ebx
	mov ecx, [arrayD + 8]		; move the last element of array D into ecx
	
	xchg eax, ecx				; exchange ecx (stores element 3) with eax (stores element 1)
	xchg ebx, ecx				; exchange ecx (now stores element 1) with ebx (stores element 2)
	
	mov [arrayD], eax			; move what now stores element 3 into the first element of arrayD
	mov [arrayD + 4], ebx		; move what now stores element 1 into the second element of arrayD
	mov [arrayD + 8], ecx		; move what now stores element 2 into the third element of arrayD
		
	call DumpRegs
	
exit
main ENDP
END main