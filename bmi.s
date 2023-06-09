.globl	main

.data

mass:		.double	62.0
height:		.double	1.82
bmi:		.double	0.0

cw:		.word 0

outstr:	.string "BMI = %lf\n"

.text

main:
sub	$8,%rsp

finit
				
	fstcw cw 			
	movw $0b0000001001111111, cw
	fldcw cw	

# bmi = mass / height^2

	fldl	height
	fmull	height
	fdivrl	mass
	fstl	bmi

	mov	$1,%rax
	mov	$outstr,%rdi
	movsd	bmi,%xmm0
	call	printf

add	$8,%rsp
ret