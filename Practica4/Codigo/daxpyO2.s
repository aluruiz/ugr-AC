	.file	"daxpy_O2.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"ERROR: falta tam del vector y constante\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"\nTiempo (seg.) = %11.9f\t"
.LC3:
	.string	"y[0] = %i, y[%i] = %i\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB4:
	.section	.text.startup,"ax",@progbits
.LHOTB4:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB41:
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
	jle	.L14
	movq	8(%rsi), %rdi
	movq	%rsi, %rbx
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movq	16(%rbx), %rdi
	movq	%rax, %rbp
	xorl	%esi, %esi
	movl	%ebp, %r12d
	movl	$10, %edx
	movl	%eax, %r14d
	salq	$2, %r12
	call	strtol
	movq	%r12, %rdi
	movl	%eax, %r13d
	call	malloc
	movq	%r12, %rdi
	movq	%rax, %rbx
	call	malloc
	testl	%ebp, %ebp
	movq	%rax, %r12
	je	.L3
	leal	2(%rbp), %eax
	xorl	%edi, %edi
	xorl	%esi, %esi
	movl	$2, %edx
	.p2align 4,,10
	.p2align 3
.L4:
	movl	%edx, (%rbx,%rsi)
	addl	$1, %edx
	movl	%edi, (%r12,%rsi)
	addq	$4, %rsi
	addl	$2, %edi
	cmpl	%eax, %edx
	jne	.L4
	movq	%rsp, %rsi
	xorl	%edi, %edi
	call	clock_gettime
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L5:
	movl	(%r12,%rdx,4), %ecx
	imull	%r13d, %ecx
	addl	%ecx, (%rbx,%rdx,4)
	addq	$1, %rdx
	cmpl	%edx, %r14d
	ja	.L5
.L6:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	movl	$.LC2, %esi
	pxor	%xmm0, %xmm0
	movl	$1, %edi
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm0
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %eax
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
	movq	40(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L15
	addq	$48, %rsp
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
	movq	%rsp, %rsi
	xorl	%edi, %edi
	call	clock_gettime
	jmp	.L6
.L15:
	call	__stack_chk_fail
.L14:
	movq	stderr(%rip), %rcx
	movl	$.LC0, %edi
	movl	$40, %edx
	movl	$1, %esi
	call	fwrite
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE41:
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
