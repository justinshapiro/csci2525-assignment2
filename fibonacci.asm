; Programming Assignmnet #2 for CSCI 2525 - Assembly Language & Computer Organization
; Written by Justin Shapiro

; DISCLAIMER:
; BEST VIEWED IN NOTEPAD++
; COMMENTS MAY MAKE CODE HARD TO READ IF VIEWED ELSEWHERE

TITLE fibonacci.asm

INCLUDE Irvine32.inc

.data
clearEAX TEXTEQU <sub eax, eax>	; macro that clears EAX
clearEBX TEXTEQU <sub ebx, ebx> ; macro that clears EBX
clearECX TEXTEQU <sub ecx, ecx> ; macro that clears ECX
clearEDX TEXTEQU <sub edx, edx> ; macro that clears EDX
clearESI TEXTEQU <sub esi, esi> ; macro that clears ESI
clearEDI TEXTEQU <sub edi, edi> ; macro that clears EDI

fibInitial 	BYTE 	0, 1		; used to store the first two Fibonacci numbers
fibComputed BYTE	5 DUP(0)	; used to store the Fibonacci numbers from fib(2) to fib(6)
threeToSix 	BYTE 	4 DUP(0)	; used to store the Fibonacci numbers from fib(3) to fib(6)
count 		DWORD 	0			; used to have an esi-custom counter in the L1 loop 

.code
main PROC

; --Clear All Registers-- ;
clearEAX
clearEBX
clearECX
clearEDX
clearEDI
clearESI

; -- Compute the first three Fibonacci numbers and ----------;
; -- store them in the main Fibonacci array (fibCompted)-- ;
mov al, fibInitial
mov bl, [fibInitial + 1]
add dl, al
add dl, bl
mov fibComputed, dl

clearEDX

mov al, [fibInitial + 1]
mov bl, fibComputed
add dl, al
add dl, bl
mov[fibComputed + 1], dl


; -- Start a loop that computes the remaining Fibonacci -- ;
; -- numbers that uses indirect operands ------------------;

mov count, 1	; set the counter for esi to appropriately grab Fibonacci-sum elements
mov ecx,   3	; sex the loop counter to iterate 3 times as required to get up to fib(6)

L1 :
	; clear all used registers just in case
	clearEAX
	clearEDX
	clearESI
	
	; start computing the next Fibonacci number
	mov esi, OFFSET fibComputed	; move the address of the first element in the fibComputed array to esi
	add esi, count				; go to the position of the first fib-sum number
	mov al, [esi]				; dereference esi and move the value at esi's current address to al
	dec esi						; go to the position the second fib-sum number
	mov dl, [esi]				; dereference esi and move the value at esi's current address to dl
	add al, dl					; add dl to al to obtain the next Fibonacci number
	add esi, 2					; prepare esi for the next loop iteration
	mov [esi], al				; move the next Fibonacci nuber to the location at esi's current address
	inc count					; increment count to prepare for the next loop iteration
loop L1


; -- Start another loop that will move the contents of all but the first ----;
; -- element of the fibComputed array to a new array to complete part 2(c) --;
mov count, 1	; set the counter back to 1 for use in stepping through fibComputed via esi
mov ecx,   4	; this will require 4 iterations this time since we are moving 4 elements

L2 :
	; clear all used registers just in case
	clearEAX
	clearEDX
	clearESI
	clearEDI
	
	; start copying values from fibCompted to the new array (threeToSix)
	mov esi, OFFSET fibComputed	; move the address of the first element in the fibComputed array to esi
	mov edi, OFFSET threeToSix  ; move the address of the first element in the fibComputed array to edi
	add esi, count				; move to the required position in the array, starting at its 2nd element
	mov al,  BYTE PTR count		; move the first byte of count to al
	dec al						; decrement al
	add edi, eax				; move the resultant value to edi (used as a counter)
	mov dl,  [esi]				; move the current element to dl
	mov[edi], dl				; copy the current element stored in dl to the new array's current position
	inc count					; prepare count for the next loop iteration to step through esi		
loop L2

clearEBX

; move each element of threeToSix to the appropriate bit position in ebx as requested
mov ebx, DWORD PTR threeToSix

call DumpRegs

exit

main ENDP
END main

