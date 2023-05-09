.globl main
.data

	tab: .long 0, 4, 0, 0, 0, 9, 3, 0, 0, 0, 8, 0, 0, 1, 0
	str: .string "jest %d elementow zerowych\n"
	suma: 	.long 0

.text
main:
	sub 	$8,%rsp
	
	mov 	$0,%ebx
loop:
	cmp 	$15,%ebx
	je end_loop
	
	mov 	tab(,%ebx,4),%eax
	inc 	%ebx
	
	cmp	$0,%eax
	jne	loop
	
	addb	$1,suma 
	
	jmp loop
end_loop:
	
	xor 	%eax,%eax
	mov 	$str, %edi
	mov 	suma, %esi
	call printf

	add	$8,%rsp
	xor 	%eax,%eax
	ret