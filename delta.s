.global main
.data
	a:	.double 1.0
	b:	.double 5.0
	c:	.double 4.0
	
	four:	.double 4.0
	
	wynik:	.double 0.0
	
	format:	.string "%lf\n"
.text
main:
	
	#FPU
	#bb-4ac
	
	fldl	c; 		#st(0) = c
	fldl	a; 		#st(0) = a, st(1) = c
	fmull	four		#st(0) = 4a, st(1) = c
	fmul	%st(1), %st(0)	#st(0) = 4ac, st(1) = c
	fldl	b;		#st(0) = b, st(1) = 4ac, st(2) = c
	fmull	b;		#st(0) = bb, st(1) = 4ac, st(2) = c
	fsub	%st(1)		#st(0) = st(0) - st(1), st(1) = 4ac, st(2) = c
	
	fstl	wynik
	
	#wypisywanie
	
	sub	$8, %rsp
	
	mov	$format, %rdi
	mov	$1,  %rax
	movsd	wynik, %xmm0
				#cvtss2sd %xmm0, %xmm0	¿eby flota przerobic
	call	printf
	
	add	$8, %rsp
	ret