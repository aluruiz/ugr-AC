	.file	"pmm-secuencial-modificado_b.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"./pmm-secuencial [TAM]\n"
.LC1:
	.string	"%d "
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"Tiempo = %11.9f\t Primera = %d\t Ultima=%d\n"
	.section	.rodata.str1.1
.LC4:
	.string	"Matriz b:"
.LC5:
	.string	"Matriz c:"
.LC6:
	.string	"Matriz a:"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB7:
	.section	.text.startup,"ax",@progbits
.LHOTB7:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB38:
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
	subq	$64, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L49
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movl	$3355, %ebp
	call	strtol
	cmpl	$3355, %eax
	cmovbe	%eax, %ebp
	testl	%ebp, %ebp
	je	.L3
	leal	-1(%rbp), %ebx
	xorl	%edx, %edx
	movq	%rbx, %r12
	addq	$1, %rbx
	imulq	$13420, %rbx, %r13
	salq	$2, %rbx
.L5:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L4:
	movl	$0, a(%rdx,%rax)
	movl	$2, b(%rdx,%rax)
	movl	$2, c(%rdx,%rax)
	addq	$4, %rax
	cmpq	%rbx, %rax
	jne	.L4
	addq	$13420, %rdx
	cmpq	%r13, %rdx
	jne	.L5
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	xorl	%edx, %edx
.L10:
	leaq	b(%rdx), %r8
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L8:
	movl	(%r8), %edi
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L7:
	movl	c(%rsi,%rax), %ecx
	imull	%edi, %ecx
	addl	%ecx, a(%rdx,%rax)
	addq	$4, %rax
	cmpq	%rbx, %rax
	jne	.L7
	addq	$13420, %rsi
	addq	$4, %r8
	cmpq	%r13, %rsi
	jne	.L8
	addq	$13420, %rdx
	cmpq	%rsi, %rdx
	jne	.L10
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	40(%rsp), %rax
	subq	24(%rsp), %rax
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm0
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	cmpl	$9, %ebp
	cvtsi2sdq	%rax, %xmm1
	divsd	.LC3(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 8(%rsp)
	jbe	.L50
.L20:
	movl	%r12d, %eax
	movl	a(%rip), %edx
	movl	$1, %edi
	imulq	$13424, %rax, %rax
	movsd	8(%rsp), %xmm0
	movl	$.LC2, %esi
	movl	a(%rax), %ecx
	movl	$1, %eax
	call	__printf_chk
	xorl	%eax, %eax
	movq	56(%rsp), %rdi
	xorq	%fs:40, %rdi
	jne	.L51
	addq	$64, %rsp
	.cfi_remember_state
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
.L3:
	.cfi_restore_state
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	movl	$-1, %r12d
	call	clock_gettime
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	40(%rsp), %rax
	subq	24(%rsp), %rax
	movl	$.LC4, %edi
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm0
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	divsd	.LC3(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 8(%rsp)
	call	puts
	movl	$.LC5, %edi
	call	puts
	movl	$.LC6, %edi
	call	puts
	jmp	.L20
.L49:
	movq	stderr(%rip), %rcx
	movl	$.LC0, %edi
	movl	$23, %edx
	movl	$1, %esi
	call	fwrite
	movl	$-1, %edi
	call	exit
.L51:
	call	__stack_chk_fail
.L50:
	movl	$.LC4, %edi
	xorl	%r13d, %r13d
	xorl	%r14d, %r14d
	call	puts
.L13:
	xorl	%ebx, %ebx
.L12:
	movl	b(%r13,%rbx,4), %edx
	xorl	%eax, %eax
	movl	$.LC1, %esi
	movl	$1, %edi
	addq	$1, %rbx
	call	__printf_chk
	cmpl	%ebx, %ebp
	ja	.L12
	movl	$10, %edi
	addl	$1, %r14d
	addq	$13420, %r13
	call	putchar
	cmpl	%ebp, %r14d
	jb	.L13
	movl	$.LC5, %edi
	xorl	%r13d, %r13d
	xorl	%r14d, %r14d
	call	puts
.L16:
	xorl	%ebx, %ebx
.L15:
	movl	c(%r13,%rbx,4), %edx
	xorl	%eax, %eax
	movl	$.LC1, %esi
	movl	$1, %edi
	addq	$1, %rbx
	call	__printf_chk
	cmpl	%ebx, %ebp
	ja	.L15
	movl	$10, %edi
	addl	$1, %r14d
	addq	$13420, %r13
	call	putchar
	cmpl	%ebp, %r14d
	jb	.L16
	movl	$.LC6, %edi
	xorl	%r13d, %r13d
	xorl	%r14d, %r14d
	call	puts
.L19:
	xorl	%ebx, %ebx
.L18:
	movl	a(%r13,%rbx,4), %edx
	xorl	%eax, %eax
	movl	$.LC1, %esi
	movl	$1, %edi
	addq	$1, %rbx
	call	__printf_chk
	cmpl	%ebx, %ebp
	ja	.L18
	movl	$10, %edi
	addl	$1, %r14d
	addq	$13420, %r13
	call	putchar
	cmpl	%ebp, %r14d
	jb	.L19
	jmp	.L20
	.cfi_endproc
.LFE38:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE7:
	.section	.text.startup
.LHOTE7:
	.comm	c,45024100,32
	.comm	b,45024100,32
	.comm	a,45024100,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
