	.file	"daxpy_Os.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"ERROR: falta tam del vector y constante\n"
.LC2:
	.string	"\nTiempo (seg.) = %11.9f\t"
.LC3:
	.string	"y[0] = %i, y[%i] = %i\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB4:
	.section	.text.startup,"ax",@progbits
.LHOTB4:
	.globl	main
	.type	main, @function
main:
.LFB20:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$48, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	cmpl	$2, %edi
	jg	.L2
	movq	stderr(%rip), %rsi
	movl	$.LC0, %edi
	call	fputs
	movl	$1, %edi
	call	exit
.L2:
	movq	8(%rsi), %rdi
	movq	%rsi, %rbx
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movq	16(%rbx), %rdi
	movq	%rax, %rbp
	movl	$10, %edx
	movl	%ebp, %r12d
	xorl	%esi, %esi
	movl	%eax, %r14d
	salq	$2, %r12
	call	strtol
	movq	%r12, %rdi
	movl	%eax, %r13d
	call	malloc
	movq	%r12, %rdi
	movq	%rax, %rbx
	call	malloc
	xorl	%edx, %edx
	movq	%rax, %r12
.L3:
	cmpl	%edx, %r14d
	jbe	.L10
	leal	2(%rdx), %eax
	movl	%eax, (%rbx,%rdx,4)
	leal	(%rdx,%rdx), %eax
	movl	%eax, (%r12,%rdx,4)
	incq	%rdx
	jmp	.L3
.L10:
	leaq	8(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	xorl	%eax, %eax
.L5:
	cmpl	%eax, %r14d
	jbe	.L11
	movl	(%r12,%rax,4), %edx
	imull	%r13d, %edx
	addl	%edx, (%rbx,%rax,4)
	incq	%rax
	jmp	.L5
.L11:
	leaq	24(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	movl	$.LC2, %esi
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movb	$1, %al
	divsd	.LC1(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	__printf_chk
	leal	-1(%rbp), %eax
	movl	(%rbx), %edx
	movl	$.LC3, %esi
	movl	$1, %edi
	movl	(%rbx,%rax,4), %r8d
	movq	%rax, %rcx
	xorl	%eax, %eax
	call	__printf_chk
	movq	%rbx, %rdi
	call	free
	movq	%r12, %rdi
	call	free
	xorl	%eax, %eax
	movq	40(%rsp), %rcx
	xorq	%fs:40, %rcx
	je	.L7
	call	__stack_chk_fail
.L7:
	addq	$48, %rsp
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE20:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE4:
	.section	.text.startup
.LHOTE4:
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
