	.file	"pmm-secuencial-modificado_a.c"
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
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	movq	%fs:40, %rax
	movq	%rax, 72(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L52
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movl	%eax, %r12d
	movl	$3355, %edx
	shrl	$2, %r12d
	cmpl	$3355, %eax
	cmovbe	%eax, %edx
	testl	%edx, %edx
	movl	%edx, %r15d
	je	.L3
	leal	-1(%rdx), %r13d
	xorl	%eax, %eax
	leaq	1(%r13), %rbp
	movl	%r13d, 24(%rsp)
	imulq	$13420, %rbp, %rcx
	leaq	0(,%rbp,4), %rdx
.L5:
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L4:
	movl	$0, a(%rax,%rbx)
	movl	$2, b(%rax,%rbx)
	movl	$2, c(%rax,%rbx)
	addq	$4, %rbx
	cmpq	%rdx, %rbx
	jne	.L4
	addq	$13420, %rax
	cmpq	%rcx, %rax
	jne	.L5
	imulq	$13424, %rbp, %rbp
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	negq	%r13
	addq	$a, %rbx
	call	clock_gettime
	leal	-1(%r12), %eax
	movl	%r15d, 28(%rsp)
	leaq	a(%rbp), %rdi
	movq	%rax, %rdx
	negq	%rax
	salq	$4, %rdx
	movq	%rdi, (%rsp)
	salq	$4, %rax
	leaq	-4(,%r13,4), %rdi
	subq	$16, %rax
	leaq	b+16(%rdx), %r11
	movq	%rax, 16(%rsp)
	movq	%rdi, 8(%rsp)
.L11:
	movq	8(%rsp), %rax
	movl	$c, %r14d
	movl	$c+4, %r13d
	leaq	(%rax,%rbx), %rbp
	movq	16(%rsp), %rax
	leaq	(%rax,%r11), %r15
	.p2align 4,,10
	.p2align 3
.L8:
	testl	%r12d, %r12d
	je	.L53
	movq	%r13, %rdx
	movq	%r14, %rsi
	movq	%r15, %rax
	xorl	%edi, %edi
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	xorl	%r10d, %r10d
	.p2align 4,,10
	.p2align 3
.L7:
	movl	(%rax), %ecx
	addq	$16, %rax
	addq	$53680, %rsi
	imull	-53680(%rsi), %ecx
	addq	$16, %rdx
	addl	%ecx, %r10d
	movl	-12(%rax), %ecx
	imull	-16(%rdx), %ecx
	addl	%ecx, %r9d
	movl	-8(%rax), %ecx
	imull	-12(%rdx), %ecx
	addl	%ecx, %r8d
	movl	-4(%rax), %ecx
	imull	-8(%rdx), %ecx
	addl	%ecx, %edi
	cmpq	%rax, %r11
	jne	.L7
	addl	%r10d, %r9d
	addl	%r9d, %r8d
	addl	%r8d, %edi
.L10:
	movl	%edi, 0(%rbp)
	addq	$4, %rbp
	addq	$4, %r14
	addq	$13420, %r13
	cmpq	%rbp, %rbx
	jne	.L8
	addq	$13420, %rbx
	addq	$13420, %r11
	cmpq	(%rsp), %rbx
	jne	.L11
	leaq	48(%rsp), %rsi
	xorl	%edi, %edi
	movl	28(%rsp), %r15d
	call	clock_gettime
	movq	56(%rsp), %rax
	subq	40(%rsp), %rax
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm0
	movq	48(%rsp), %rax
	subq	32(%rsp), %rax
	cmpl	$9, %r15d
	cvtsi2sdq	%rax, %xmm1
	divsd	.LC3(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rsp)
	ja	.L21
	movl	$.LC4, %edi
	xorl	%r12d, %r12d
	xorl	%ebp, %ebp
	call	puts
.L14:
	xorl	%ebx, %ebx
.L13:
	movl	b(%r12,%rbx,4), %edx
	xorl	%eax, %eax
	movl	$.LC1, %esi
	movl	$1, %edi
	addq	$1, %rbx
	call	__printf_chk
	cmpl	%ebx, %r15d
	ja	.L13
	movl	$10, %edi
	addl	$1, %ebp
	addq	$13420, %r12
	call	putchar
	cmpl	%r15d, %ebp
	jb	.L14
	movl	$.LC5, %edi
	xorl	%r12d, %r12d
	xorl	%ebp, %ebp
	call	puts
.L17:
	xorl	%ebx, %ebx
.L16:
	movl	c(%r12,%rbx,4), %edx
	xorl	%eax, %eax
	movl	$.LC1, %esi
	movl	$1, %edi
	addq	$1, %rbx
	call	__printf_chk
	cmpl	%ebx, %r15d
	ja	.L16
	movl	$10, %edi
	addl	$1, %ebp
	addq	$13420, %r12
	call	putchar
	cmpl	%r15d, %ebp
	jb	.L17
	movl	$.LC6, %edi
	xorl	%r12d, %r12d
	xorl	%ebp, %ebp
	call	puts
.L20:
	xorl	%ebx, %ebx
.L19:
	movl	a(%r12,%rbx,4), %edx
	xorl	%eax, %eax
	movl	$.LC1, %esi
	movl	$1, %edi
	addq	$1, %rbx
	call	__printf_chk
	cmpl	%ebx, %r15d
	ja	.L19
	movl	$10, %edi
	addl	$1, %ebp
	addq	$13420, %r12
	call	putchar
	cmpl	%r15d, %ebp
	jb	.L20
	jmp	.L21
.L3:
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	leaq	48(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	56(%rsp), %rax
	subq	40(%rsp), %rax
	movl	$.LC4, %edi
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm0
	movq	48(%rsp), %rax
	subq	32(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	divsd	.LC3(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rsp)
	call	puts
	movl	$.LC5, %edi
	call	puts
	movl	$.LC6, %edi
	call	puts
	movl	$-1, 24(%rsp)
.L21:
	movl	24(%rsp), %eax
	movl	a(%rip), %edx
	movl	$.LC2, %esi
	movsd	(%rsp), %xmm0
	movl	$1, %edi
	imulq	$13424, %rax, %rax
	movl	a(%rax), %ecx
	movl	$1, %eax
	call	__printf_chk
	xorl	%eax, %eax
	movq	72(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L54
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L52:
	.cfi_restore_state
	movq	stderr(%rip), %rcx
	movl	$.LC0, %edi
	movl	$23, %edx
	movl	$1, %esi
	call	fwrite
	movl	$-1, %edi
	call	exit
	.p2align 4,,10
	.p2align 3
.L53:
	xorl	%edi, %edi
	jmp	.L10
.L54:
	call	__stack_chk_fail
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
