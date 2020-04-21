	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_c2p0"
	.file	"test.c"
	.globl	foo                     # -- Begin function foo
	.p2align	1
	.type	foo,@function
foo:                                    # @foo
.Lfoo$local:
# %bb.0:
	addi	sp, sp, -32
	sd	ra, 24(sp)
	sd	s0, 16(sp)
	addi	s0, sp, 32
	addi	a0, zero, 10
	sw	a0, -20(s0)
	addi	a0, zero, 20
	sw	a0, -24(s0)
	lw	a0, -20(s0)
	lw	a1, -24(s0)
	add	a0, a0, a1
	sw	a0, -28(s0)
	lw	a0, -28(s0)
	ld	s0, 16(sp)
	ld	ra, 24(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end0:
	.size	foo, .Lfunc_end0-foo
                                        # -- End function
	.ident	"clang version 11.0.0 (https://github.com/llvm/llvm-project.git 1c57752ff5e2e5effcedc5da097c4109696f44bb)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
