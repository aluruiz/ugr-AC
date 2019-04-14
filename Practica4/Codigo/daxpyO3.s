	.file	"daxpy_O3.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"ERROR: falta tam del vector y constante\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC5:
	.string	"\nTiempo (seg.) = %11.9f\t"
.LC6:
	.string	"y[0] = %i, y[%i] = %i\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB7:
	.section	.text.startup,"ax",@progbits
.LHOTB7:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB41:
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
	cmpl	$2, %edi
	jle	.L51
	movq	8(%rsi), %rdi
	movq	%rsi, %rbx
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movq	16(%rbx), %rdi
	movq	%rax, %r12
	xorl	%esi, %esi
	movl	%r12d, %ebp
	movl	$10, %edx
	salq	$2, %rbp
	call	strtol
	movq	%rbp, %rdi
	movq	%rax, %r15
	movl	%eax, 8(%rsp)
	call	malloc
	movq	%rbp, %rdi
	movq	%rax, %rbx
	call	malloc
	testl	%r12d, %r12d
	movq	%rax, %r13
	je	.L3
	movq	%rbx, %rbp
	movl	%r12d, %edx
	andl	$15, %ebp
	shrq	$2, %rbp
	negq	%rbp
	andl	$3, %ebp
	cmpl	%r12d, %ebp
	cmova	%r12d, %ebp
	cmpl	$5, %r12d
	ja	.L52
.L4:
	cmpl	$1, %edx
	movl	$2, (%rbx)
	movl	$0, 0(%r13)
	je	.L27
	cmpl	$2, %edx
	movl	$3, 4(%rbx)
	movl	$2, 4(%r13)
	je	.L28
	cmpl	$3, %edx
	movl	$4, 8(%rbx)
	movl	$4, 8(%r13)
	je	.L29
	cmpl	$5, %edx
	movl	$5, 12(%rbx)
	movl	$6, 12(%r13)
	jne	.L30
	movl	$6, 16(%rbx)
	movl	$8, 16(%r13)
	movl	$5, %eax
.L6:
	cmpl	%edx, %r12d
	leal	-1(%r12), %r14d
	je	.L7
.L5:
	movl	%r12d, %edi
	leal	-1(%r12), %r14d
	movl	%edx, %esi
	subl	%edx, %edi
	leal	-4(%rdi), %ecx
	movl	%r14d, %r11d
	subl	%edx, %r11d
	shrl	$2, %ecx
	addl	$1, %ecx
	cmpl	$2, %r11d
	leal	0(,%rcx,4), %r8d
	jbe	.L8
	movl	%eax, 12(%rsp)
	salq	$2, %rsi
	xorl	%edx, %edx
	movd	12(%rsp), %xmm5
	leaq	(%rbx,%rsi), %r10
	xorl	%r9d, %r9d
	movdqa	.LC2(%rip), %xmm3
	addq	%r13, %rsi
	pshufd	$0, %xmm5, %xmm0
	movdqa	.LC3(%rip), %xmm2
	paddd	.LC1(%rip), %xmm0
.L9:
	movdqa	%xmm0, %xmm1
	addl	$1, %r9d
	movdqa	%xmm0, %xmm4
	pslld	$1, %xmm0
	paddd	%xmm2, %xmm1
	movups	%xmm0, (%rsi,%rdx)
	paddd	%xmm3, %xmm4
	movaps	%xmm1, (%r10,%rdx)
	addq	$16, %rdx
	cmpl	%ecx, %r9d
	jnb	.L53
	movdqa	%xmm4, %xmm0
	jmp	.L9
.L53:
	addl	%r8d, %eax
	cmpl	%r8d, %edi
	je	.L7
.L8:
	leal	2(%rax), %edx
	leal	(%rax,%rax), %esi
	movslq	%eax, %rcx
	movl	%edx, (%rbx,%rcx,4)
	movl	%esi, 0(%r13,%rcx,4)
	leal	1(%rax), %ecx
	cmpl	%ecx, %r12d
	jbe	.L7
	leal	3(%rax), %edi
	movslq	%ecx, %rsi
	addl	%ecx, %ecx
	cmpl	%edx, %r12d
	movl	%ecx, 0(%r13,%rsi,4)
	movl	%edi, (%rbx,%rsi,4)
	jbe	.L7
	movslq	%edx, %rcx
	addl	$4, %eax
	addl	%edx, %edx
	movl	%eax, (%rbx,%rcx,4)
	movl	%edx, 0(%r13,%rcx,4)
.L7:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	cmpl	$4, %r12d
	ja	.L54
	movl	%r12d, %ebp
.L22:
	movl	0(%r13), %eax
	imull	%r15d, %eax
	addl	%eax, (%rbx)
	cmpl	$1, %ebp
	je	.L33
	movl	4(%r13), %eax
	imull	%r15d, %eax
	addl	%eax, 4(%rbx)
	cmpl	$2, %ebp
	je	.L34
	movl	8(%r13), %eax
	imull	%r15d, %eax
	addl	%eax, 8(%rbx)
	cmpl	$4, %ebp
	jne	.L35
	movl	12(%r13), %eax
	imull	%r15d, %eax
	addl	%eax, 12(%rbx)
	movl	$4, %eax
.L14:
	cmpl	%ebp, %r12d
	je	.L21
.L13:
	movl	%r12d, %r8d
	movl	%r14d, %edx
	movl	%ebp, %esi
	subl	%ebp, %r8d
	subl	%ebp, %edx
	leal	-4(%r8), %ecx
	shrl	$2, %ecx
	addl	$1, %ecx
	cmpl	$2, %edx
	leal	0(,%rcx,4), %r9d
	jbe	.L16
	movd	8(%rsp), %xmm6
	salq	$2, %rsi
	xorl	%edx, %edx
	leaq	(%rbx,%rsi), %r10
	xorl	%edi, %edi
	addq	%r13, %rsi
	pshufd	$0, %xmm6, %xmm2
	movdqa	%xmm2, %xmm3
	psrlq	$32, %xmm3
.L17:
	movdqu	(%rsi,%rdx), %xmm0
	addl	$1, %edi
	movdqa	%xmm0, %xmm1
	psrlq	$32, %xmm0
	pmuludq	%xmm3, %xmm0
	pshufd	$8, %xmm0, %xmm0
	pmuludq	%xmm2, %xmm1
	pshufd	$8, %xmm1, %xmm1
	punpckldq	%xmm0, %xmm1
	movdqa	(%r10,%rdx), %xmm0
	paddd	%xmm1, %xmm0
	movaps	%xmm0, (%r10,%rdx)
	addq	$16, %rdx
	cmpl	%edi, %ecx
	ja	.L17
	addl	%r9d, %eax
	cmpl	%r9d, %r8d
	je	.L21
.L16:
	movslq	%eax, %rdx
	movl	0(%r13,%rdx,4), %ecx
	imull	%r15d, %ecx
	addl	%ecx, (%rbx,%rdx,4)
	leal	1(%rax), %edx
	cmpl	%edx, %r12d
	jbe	.L21
	movslq	%edx, %rdx
	addl	$2, %eax
	movl	0(%r13,%rdx,4), %ecx
	imull	%r15d, %ecx
	addl	%ecx, (%rbx,%rdx,4)
	cmpl	%eax, %r12d
	jbe	.L21
	movslq	%eax, %rdx
	imull	0(%r13,%rdx,4), %r15d
	addl	%r15d, (%rbx,%rdx,4)
.L21:
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	40(%rsp), %rax
	pxor	%xmm0, %xmm0
	subq	24(%rsp), %rax
	pxor	%xmm1, %xmm1
	movl	$.LC5, %esi
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %eax
	divsd	.LC4(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	__printf_chk
	movl	%r14d, %eax
	movl	(%rbx), %edx
	movl	%r14d, %ecx
	movl	(%rbx,%rax,4), %r8d
	movl	$.LC6, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movq	%rbx, %rdi
	call	free
	movq	%r13, %rdi
	call	free
	xorl	%eax, %eax
	movq	56(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L55
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
.L54:
	.cfi_restore_state
	xorl	%eax, %eax
	testl	%ebp, %ebp
	je	.L13
	jmp	.L22
.L52:
	xorl	%edx, %edx
	xorl	%eax, %eax
	testl	%ebp, %ebp
	je	.L5
	movl	%ebp, %edx
	jmp	.L4
.L35:
	movl	$3, %eax
	jmp	.L14
.L33:
	movl	$1, %eax
	jmp	.L14
.L34:
	movl	$2, %eax
	jmp	.L14
.L29:
	movl	$3, %eax
	jmp	.L6
.L30:
	movl	$4, %eax
	jmp	.L6
.L27:
	movl	$1, %eax
	jmp	.L6
.L28:
	movl	$2, %eax
	jmp	.L6
.L3:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	orl	$-1, %r14d
	call	clock_gettime
	jmp	.L21
.L51:
	movq	stderr(%rip), %rcx
	movl	$.LC0, %edi
	movl	$40, %edx
	movl	$1, %esi
	call	fwrite
	movl	$1, %edi
	call	exit
.L55:
	call	__stack_chk_fail
	.cfi_endproc
.LFE41:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE7:
	.section	.text.startup
.LHOTE7:
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC1:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC2:
	.long	4
	.long	4
	.long	4
	.long	4
	.align 16
.LC3:
	.long	2
	.long	2
	.long	2
	.long	2
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC4:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
