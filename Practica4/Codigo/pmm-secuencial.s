	.file	"pmm-secuencial.c"
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
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L49
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movl	$3355, %ebx
	call	strtol
	cmpl	$3355, %eax
	cmovbe	%eax, %ebx
	testl	%ebx, %ebx
	je	.L3
	leal	-1(%rbx), %r14d
	xorl	%r12d, %r12d
	leaq	1(%r14), %r15
	movq	%r14, %rbp
	imulq	$13420, %r15, %rdx
	leaq	0(,%r15,4), %r13
.L5:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L4:
	movl	$0, a(%r12,%rax)
	movl	$2, b(%r12,%rax)
	movl	$2, c(%r12,%rax)
	addq	$4, %rax
	cmpq	%rax, %r13
	jne	.L4
	addq	$13420, %r12
	cmpq	%rdx, %r12
	jne	.L5
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	addq	$a, %r13
	addq	$c, %r12
	call	clock_gettime
	imulq	$-13420, %r14, %rax
	movq	%r14, %rdx
	movl	$b, %r9d
	imulq	$13424, %r15, %r11
	negq	%rdx
	leaq	-4(,%rdx,4), %r14
	leaq	-13420(%rax), %r10
	addq	$a, %r11
.L10:
	leaq	(%r14,%r13), %r8
	movq	%r12, %rdi
	.p2align 4,,10
	.p2align 3
.L8:
	movl	(%r8), %esi
	leaq	(%r10,%rdi), %rax
	movq	%r9, %rcx
	.p2align 4,,10
	.p2align 3
.L7:
	movl	(%rcx), %edx
	addq	$13420, %rax
	addq	$4, %rcx
	imull	-13420(%rax), %edx
	addl	%edx, %esi
	cmpq	%rdi, %rax
	jne	.L7
	movl	%esi, (%r8)
	addq	$4, %r8
	leaq	4(%rax), %rdi
	cmpq	%r13, %r8
	jne	.L8
	leaq	13420(%r8), %r13
	addq	$13420, %r9
	cmpq	%r11, %r13
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
	cmpl	$9, %ebx
	cvtsi2sdq	%rax, %xmm1
	divsd	.LC3(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 8(%rsp)
	jbe	.L50
.L20:
	movl	%ebp, %eax
	movl	a(%rip), %edx
	movl	$.LC2, %esi
	imulq	$13424, %rax, %rax
	movsd	8(%rsp), %xmm0
	movl	$1, %edi
	movl	a(%rax), %ecx
	movl	$1, %eax
	call	__printf_chk
	xorl	%eax, %eax
	movq	56(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L51
	addq	$72, %rsp
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
.L3:
	.cfi_restore_state
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	movl	$-1, %ebp
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
	xorl	%r12d, %r12d
.L12:
	movl	b(%r13,%r12,4), %edx
	xorl	%eax, %eax
	movl	$.LC1, %esi
	movl	$1, %edi
	addq	$1, %r12
	call	__printf_chk
	cmpl	%r12d, %ebx
	ja	.L12
	movl	$10, %edi
	addl	$1, %r14d
	addq	$13420, %r13
	call	putchar
	cmpl	%ebx, %r14d
	jb	.L13
	movl	$.LC5, %edi
	xorl	%r13d, %r13d
	xorl	%r14d, %r14d
	call	puts
.L16:
	xorl	%r12d, %r12d
.L15:
	movl	c(%r13,%r12,4), %edx
	xorl	%eax, %eax
	movl	$.LC1, %esi
	movl	$1, %edi
	addq	$1, %r12
	call	__printf_chk
	cmpl	%r12d, %ebx
	ja	.L15
	movl	$10, %edi
	addl	$1, %r14d
	addq	$13420, %r13
	call	putchar
	cmpl	%ebx, %r14d
	jb	.L16
	movl	$.LC6, %edi
	xorl	%r13d, %r13d
	xorl	%r14d, %r14d
	call	puts
.L19:
	xorl	%r12d, %r12d
.L18:
	movl	a(%r13,%r12,4), %edx
	xorl	%eax, %eax
	movl	$.LC1, %esi
	movl	$1, %edi
	addq	$1, %r12
	call	__printf_chk
	cmpl	%r12d, %ebx
	ja	.L18
	movl	$10, %edi
	addl	$1, %r14d
	addq	$13420, %r13
	call	putchar
	cmpl	%ebx, %r14d
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
