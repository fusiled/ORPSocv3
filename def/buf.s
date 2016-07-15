	.file	"buf.c"
	.comm	x0,4,4
	.comm	x1,4,4
	.comm	x2,4,4
	.comm	x3,4,4
	.comm	x4,4,4
	.comm	x5,4,4
	.comm	x6,4,4
	.comm	x7,4,4
	.comm	x8,4,4
	.comm	x9,4,4
	.comm	x10,4,4
	.comm	x11,4,4
	.comm	x12,4,4
	.comm	x13,4,4
	.section	.rodata
.LC0:
	.string	"x3: %d\n"
	.section .text
	.align	4
.proc	main
	.global main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	l.nop			# nop delay slot
	l.nop			# nop delay slot
	l.nop			# nop delay slot
	l.nop			# nop delay slot
	l.nop			# nop delay slot added by the dev
	l.nop			# nop delay slot
	l.nop			# nop delay slot
	l.nop			# nop delay slot
	l.nop			# nop delay slot
	l.nop			# nop delay slot added by the dev
	l.nop			# nop delay slot
	l.nop			# nop delay slot
	l.nop			# nop delay slot
	l.nop			# nop delay slot
	l.nop			# nop delay slot added by the dev
	l.nop			# nop delay slot
	l.nop			# nop delay slot
	l.nop			# nop delay slot
	l.nop			# nop delay slot
	l.nop			# nop delay slot added by the dev
	l.nop			# nop delay slot
	l.nop			# nop delay slot
	l.nop			# nop delay slot
	l.nop			# nop delay slot
	l.nop			# nop delay slot added by the dev
	l.nop			# nop delay slot
	l.nop			# nop delay slot
	l.nop			# nop delay slot
	l.nop			# nop delay slot
	l.nop			# nop delay slot added by the dev
	l.lwz	   	r2,0(r0)	 # SI load
	l.lwz	   	r3,0(r0)	 # SI load
	l.lwz	   	r4,0(r0)	 # SI load
	l.lwz		r5,0(r0)
	l.lwz	   	r2,0(r0)	 # SI load
	l.lwz	   	r3,0(r0)	 # SI load
	l.lwz	   	r4,0(r0)	 # SI load
	l.lwz		r5,0(r0)
	l.lwz	   	r2,0(r0)	 # SI load
	l.lwz	   	r3,0(r0)	 # SI load
	l.lwz	   	r4,0(r0)	 # SI load
	l.lwz		r5,0(r0)
	l.addi		r2,r2,7
	l.addi		r3,r3,11
	l.addi		r4,r4,13
	l.addi		r5,r5,17
	l.sw    	16(r0),r2	 # SI store
	l.sw    	8(r0),r3	 # SI store
	l.sw    	4(r0),r4	 # SI store
	l.sw    	0(r0),r5	 # SI store
	l.sw    	16(r0),r2	 # SI store
	l.sw    	8(r0),r3	 # SI store
	l.sw    	4(r0),r4	 # SI store
	l.sw    	0(r0),r5	 # SI store
	l.sw    	16(r0),r2	 # SI store
	l.sw    	8(r0),r3	 # SI store
	l.sw    	4(r0),r4	 # SI store
	l.sw    	0(r0),r5	 # SI store
	l.nop			# nop delay slot
	l.nop			# nop delay slot
	l.nop			# nop delay slot
	l.nop			# nop delay slot
	l.nop			# nop delay slot added by the dev
	l.nop			# nop delay slot
	l.nop			# nop delay slot
	l.nop			# nop delay slot
	l.nop			# nop delay slot
	l.nop			# nop delay slot added by the dev
	l.nop			# nop delay slot
	l.nop			# nop delay slot
	l.nop			# nop delay slot
	l.nop			# nop delay slot
	l.nop			# nop delay slot added by the dev
	l.nop			# nop delay slot
	l.nop			# nop delay slot
	l.nop			# nop delay slot
	l.nop			# nop delay slot
	l.nop			# nop delay slot added by the dev
	l.nop			# nop delay slot
	l.nop			# nop delay slot
	l.nop			# nop delay slot
	l.nop			# nop delay slot
	l.nop			# nop delay slot added by the dev
	l.nop			# nop delay slot
	l.nop			# nop delay slot
	l.nop			# nop delay slot
	l.nop			# nop delay slot
	l.nop			# nop delay slot added by the dev
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.9.2"
