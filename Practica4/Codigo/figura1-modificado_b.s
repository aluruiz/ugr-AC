	.file	"figura1-modificado_b.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Tiempo(seg.):%11.9f\t"
.LC2:
	.string	"R[0] = %i, R[3999] = %i\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB3:
	.section	.text.startup,"ax",@progbits
.LHOTB3:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB38:
	.cfi_startproc
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	xorl	%edi, %edi
	movq	%rsp, %rsi
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	call	clock_gettime
	xorl	%r10d, %r10d
	movl	$S+40000, %r9d
	.p2align 4,,10
	.p2align 3
.L2:
	movl	%r10d, %r8d
	movl	$S, %eax
	xorl	%edx, %edx
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L3:
	movl	(%rax), %ecx
	addq	$32, %rax
	leal	(%r8,%rcx,2), %edi
	movl	-28(%rax), %ecx
	addl	%esi, %edi
	leal	(%rcx,%rcx,2), %esi
	movl	-24(%rax), %ecx
	subl	%r8d, %esi
	addl	%esi, %edx
	leal	(%r8,%rcx,2), %esi
	movl	-20(%rax), %ecx
	addl	%esi, %edi
	leal	(%rcx,%rcx,2), %ecx
	subl	%r8d, %ecx
	leal	(%rcx,%rdx), %esi
	movl	-16(%rax), %edx
	leal	(%r8,%rdx,2), %edx
	addl	%edx, %edi
	movl	-12(%rax), %edx
	leal	(%rdx,%rdx,2), %edx
	subl	%r8d, %edx
	leal	(%rdx,%rsi), %ecx
	movl	-8(%rax), %edx
	leal	(%r8,%rdx,2), %edx
	leal	(%rdx,%rdi), %esi
	movl	-4(%rax), %edx
	leal	(%rdx,%rdx,2), %edx
	subl	%r8d, %edx
	addl	%ecx, %edx
	cmpq	%rax, %r9
	jne	.L3
	cmpl	%edx, %esi
	cmovl	%esi, %edx
	movl	%edx, R(,%r10,4)
	addq	$1, %r10
	cmpq	$40000, %r10
	jne	.L2
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	movl	$.LC1, %esi
	pxor	%xmm0, %xmm0
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	movapd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	divsd	.LC0(%rip), %xmm1
	cvtsi2sdq	%rax, %xmm0
	movl	$1, %eax
	addsd	%xmm1, %xmm0
	call	__printf_chk
	movl	R+15996(%rip), %ecx
	movl	R(%rip), %edx
	movl	$1, %edi
	xorl	%eax, %eax
	movl	$.LC2, %esi
	call	__printf_chk
	xorl	%eax, %eax
	movq	40(%rsp), %rdi
	xorq	%fs:40, %rdi
	jne	.L11
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L11:
	.cfi_restore_state
	call	__stack_chk_fail
	.cfi_endproc
.LFE38:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE3:
	.section	.text.startup
.LHOTE3:
	.comm	R,160000,32
	.comm	S,40000,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
