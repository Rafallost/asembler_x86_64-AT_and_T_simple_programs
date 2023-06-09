.globl	main

.data

c32:		.float	32.0

tf1:		.float	0.0
tf2:		.float	0.0
tf3:		.float	0.0

tc1:		.float	0.0
tc2:		.float	0.0
tc3:		.float	0.0

five:		.float  5.0
nine:		.float  9.0
one:		.float  1.0

cw:		.word	0

outstr:		.string	"tc1 = %lf\ntc2 = %lf\ntc3 = %lf\n"

.text

main:

sub	$8,%rsp

	finit				
	fstcw cw 			
	movw $0b0000000001111111, cw	
	fldcw cw

# tc = 5.0/9.0 * (tf - 32.0)

	mov %rsi, %rbx
	
	
	mov 8(%rbx), %rdi	#strtod(char*, NULL)
	xor %rsi, %rsi
	call strtof
	movss %xmm0, tf1
	
	mov 16(%rbx), %rdi	#strtod(char*, NULL)
	xor %rsi, %rsi
	call strtof
	movss %xmm0, tf2
	
	mov 24(%rbx), %rdi	#strtod(char*, NULL)
	xor %rsi, %rsi
	call strtof
	movss %xmm0, tf3
	
	flds	nine		#st(0) = 9.
	flds	five		#st(0) = 5, st(1) = 9.
	fdivp			#st(0) = 5, st(1) = st(0)/st(1). "pop" st(0) =  st(0)/st(1).
	flds	c32		#st(0) = 32, st(1) = 5/9
	flds	tf1		#st(0) = tf1, st(1) = 32, st(2) = 5/9
	fsubp	%st(1)		#st(0) = tf1, st(1) = tf - 32, st(2) = 5/9. "pop" st(0) = tf-32, st(1) = 5/9
	fmulp			#st(1) = st(0)*st(1). "pop" st(0) = st(0)*st(1)
	fstps	tc1		#tc1 = st(0) "pop" stos pusty

	
	flds	nine		#st(0) = 9.
	flds	five		#st(0) = 5, st(1) = 9.
	fdivp			#st(0) = 5, st(1) = st(0)/st(1). "pop" st(0) =  st(0)/st(1).
	flds	c32		#st(0) = 32, st(1) = 5/9
	flds	tf2		#st(0) = tf2, st(1) = 32, st(2) = 5/9
	fsubp	%st(1)		#st(0) = tf2, st(1) = tf - 32, st(2) = 5/9. "pop" st(0) = tf-32, st(1) = 5/9
	fmulp			#st(1) = st(0)*st(1). "pop" st(0) = st(0)*st(1)
	fstps	tc2		#tc2 = st(0)

	flds	nine		#st(0) = 9.
	flds	five		#st(0) = 5, st(1) = 9.
	fdivp			#st(0) = 5, st(1) = st(0)/st(1). "pop" st(0) =  st(0)/st(1).
	flds	c32		#st(0) = 32, st(1) = 5/9
	flds	tf3		#st(0) = tf3, st(1) = 32, st(2) = 5/9
	fsubp	%st(1)		#st(0) = tf3, st(1) = tf - 32, st(2) = 5/9. "pop" st(0) = tf-32, st(1) = 5/9
	fmulp			#st(1) = st(0)*st(1). "pop" st(0) = st(0)*st(1)
	fstps	tc3		#tc1 = st(0)


	
	mov	$outstr, %rdi
	mov	$3, %rax
	movss	tc1, %xmm0
	cvtss2sd %xmm0,%xmm0
	movss	tc2, %xmm1
	cvtss2sd %xmm1,%xmm1
	movss	tc3, %xmm2
	cvtss2sd %xmm2,%xmm2
	call printf

add	$8,%rsp
ret