.globl main
.data

	case:		.long 0
	number1:	.long 0
	number2:	.long 0
	result:		.long 1
	reszta:		.long 0
	max:		.long 0
	format_dodawanie:		.string "addition: %d + %d = %d \n"
	format_odejmowanie:		.string "subtraction: %d - %d = %d \n"
	format_mnozenie:		.string "multiplication: %d * %d = %d \n"
	format_potegowanie:		.string "exponentiation: %d ^ %d = %d \n"
	format_dzielenie:		.string "division: %d / %d = %d and the rest is %d\n"
	format_brak_opcji:		.string "there is no option like that\n"
	
.text
main:
	cmp 	$4,%edi
	jne	exit

	sub	$8,%rsp 	#wyrównanie stostu
	
	mov	%rsi,%rbx	#kopia inputu

	mov	8(%rbx),%rdi	#1 argument
	call atoi		#atoi(arg)	
	mov	%eax, case
	
	mov	16(%rbx),%rdi	#2 argument
	call atoi		#atoi(arg)
	mov	%eax, number1
	
	mov	24(%rbx),%rdi	#3 argument
	call atoi		#atoi(arg)
	mov	%eax, number2
	
	cmpl	$1,case
	je	dodawanie
	cmpl	$2,case
	je	odejmowanie
	cmpl	$3,case
	je	mnozenie
	cmpl	$4,case
	je	dzielenie
	cmpl	$5,case
	je	potegowanie
	jne	brak
	
dodawanie:
	xor	%eax,%eax
	mov 	number1,%eax
	add	number2,%eax
	mov	%eax,result
	
	mov	$format_dodawanie,%rdi
	mov	number1,%rsi
	mov	number2,%rdx
	mov	result,%rcx
	call printf		#pritf("$format",arg1, arg2)
	jmp	end
	
odejmowanie:
	xor	%eax,%eax
	mov 	number1,%eax
	sub	number2,%eax
	mov	%eax,result
	
	mov	$format_odejmowanie,%rdi
	mov	number1,%rsi
	mov	number2,%rdx
	mov	result,%rcx
	call printf		#pritf("$format",arg1, arg2)
	jmp	end
	
mnozenie:
	xor	%eax,%eax
	mov 	number1,%eax
	imul	number2,%eax
	mov	%eax,result
	
	
	mov	$format_mnozenie,%rdi
	mov	number1,%rsi
	mov	number2,%rdx
	mov	result,%rcx
	call printf		#pritf("$format",arg1, arg2)
	jmp	end

potegowanie:
	xor	%eax,%eax
	mov	$0,%ebx
	mov 	number2,%eax
	
	cmp	$0,%eax
	je	zero
	
	xor	%eax,%eax
	mov 	number2,%eax
	mov	%eax,max
loop:
	cmp	%ebx,max
	je	zero	
	
	xor	%eax,%eax
	mov	number1,%eax
	imul	result,%eax
	mov	%eax,result
	inc	%ebx
	jmp	loop
zero:
	mov	$format_potegowanie,%rdi
	mov	number1,%rsi
	mov	number2,%rdx
	mov	result,%rcx
	call printf		#pritf("$format",arg1, arg2)
	jmp	end
	
dzielenie:
	cmpl	$0,number2
	je	end
	
	xor	%eax,%eax
	mov 	number1,%eax
	cdq
	idivl	number2,%eax
	mov	%eax,result
	mov	%edx,reszta
	
	
	mov	$format_dzielenie,%rdi
	mov	number1,%rsi
	mov	number2,%rdx
	mov	result,%rcx
	mov	reszta,%r8
	call printf		#pritf("$format",arg1, arg2)
	jmp	end
brak:
	mov	$format_brak_opcji,%rdi
	call printf

end:
	add	$8,%rsp		#wyrównanie stostu
exit:
	ret