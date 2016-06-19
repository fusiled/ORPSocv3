	.file	"fill2.c"
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
	l.nop			# nop delay slot
	l.nop			# nop delay slot
	l.nop			# nop delay slot
	l.nop			# nop delay slot
	l.nop			# nop delay slot added by the dev
	.cfi_startproc
	l.sw    	-8(r1),r2	 # SI store
	.cfi_offset 2, -8
	l.addi  	r2,r1,0 # addsi3
	.cfi_def_cfa_register 2
	l.sw    	-4(r1),r9	 # SI store
	l.addi	r1,r1,-20	# allocate frame
	.cfi_offset 9, -4
	l.sw    	-12(r2),r3	 # SI store
	l.sw    	-16(r2),r4	 # SI store
	l.movhi  	r3,hi(x0) # movsi_high
	l.ori   	r3,r3,lo(x0) # movsi_lo_sum
	l.addi  	r4,r0,1	 # move immediate I
	l.sw    	0(r3),r4	 # SI store
	l.movhi  	r3,hi(x1) # movsi_high
	l.ori   	r3,r3,lo(x1) # movsi_lo_sum
	l.addi  	r4,r0,2	 # move immediate I
	l.sw    	0(r3),r4	 # SI store
	l.movhi  	r3,hi(x1) # movsi_high
	l.ori   	r3,r3,lo(x1) # movsi_lo_sum
	l.lwz   	r4,0(r3)	 # SI load
	l.movhi  	r3,hi(x2) # movsi_high
	l.ori   	r3,r3,lo(x2) # movsi_lo_sum
	l.lwz   	r3,0(r3)	 # SI load
	l.add   	r4,r4,r3 # addsi3
	l.movhi  	r3,hi(x2) # movsi_high
	l.ori   	r3,r3,lo(x2) # movsi_lo_sum
	l.sw    	0(r3),r4	 # SI store
	l.movhi  	r3,hi(x2) # movsi_high
	l.ori   	r3,r3,lo(x2) # movsi_lo_sum
	l.lwz   	r3,0(r3)	 # SI load
	l.addi  	r4,r3,1 # addsi3
	l.movhi  	r3,hi(x2) # movsi_high
	l.ori   	r3,r3,lo(x2) # movsi_lo_sum
	l.sw    	0(r3),r4	 # SI store
	l.movhi  	r3,hi(x3) # movsi_high
	l.ori   	r3,r3,lo(x3) # movsi_lo_sum
	l.addi  	r4,r0,5	 # move immediate I
	l.sw    	0(r3),r4	 # SI store
	l.movhi  	r3,hi(x3) # movsi_high
	l.ori   	r3,r3,lo(x3) # movsi_lo_sum
	l.lwz   	r4,0(r3)	 # SI load
	l.movhi  	r3,hi(x2) # movsi_high
	l.ori   	r3,r3,lo(x2) # movsi_lo_sum
	l.lwz   	r3,0(r3)	 # SI load
	l.add   	r4,r4,r3 # addsi3
	l.movhi  	r3,hi(x4) # movsi_high
	l.ori   	r3,r3,lo(x4) # movsi_lo_sum
	l.sw    	0(r3),r4	 # SI store
	l.movhi  	r3,hi(x5) # movsi_high
	l.ori   	r3,r3,lo(x5) # movsi_lo_sum
	l.lwz   	r3,0(r3)	 # SI load
	l.addi  	r4,r3,4 # addsi3
	l.movhi  	r3,hi(x5) # movsi_high
	l.ori   	r3,r3,lo(x5) # movsi_lo_sum
	l.sw    	0(r3),r4	 # SI store
	l.movhi  	r3,hi(x6) # movsi_high
	l.ori   	r3,r3,lo(x6) # movsi_lo_sum
	l.addi  	r4,r0,13	 # move immediate I
	l.sw    	0(r3),r4	 # SI store
	l.movhi  	r3,hi(x0) # movsi_high
	l.ori   	r3,r3,lo(x0) # movsi_lo_sum
	l.lwz   	r4,0(r3)	 # SI load
	l.movhi  	r3,hi(x1) # movsi_high
	l.ori   	r3,r3,lo(x1) # movsi_lo_sum
	l.lwz   	r3,0(r3)	 # SI load
	l.add   	r4,r4,r3 # addsi3
	l.movhi  	r3,hi(x2) # movsi_high
	l.ori   	r3,r3,lo(x2) # movsi_lo_sum
	l.lwz   	r3,0(r3)	 # SI load
	l.add   	r4,r4,r3 # addsi3
	l.movhi  	r3,hi(x7) # movsi_high
	l.ori   	r3,r3,lo(x7) # movsi_lo_sum
	l.sw    	0(r3),r4	 # SI store
	l.movhi  	r3,hi(x5) # movsi_high
	l.ori   	r3,r3,lo(x5) # movsi_lo_sum
	l.lwz   	r4,0(r3)	 # SI load
	l.movhi  	r3,hi(x7) # movsi_high
	l.ori   	r3,r3,lo(x7) # movsi_lo_sum
	l.lwz   	r3,0(r3)	 # SI load
	l.add   	r4,r4,r3 # addsi3
	l.movhi  	r3,hi(x8) # movsi_high
	l.ori   	r3,r3,lo(x8) # movsi_lo_sum
	l.sw    	0(r3),r4	 # SI store
	l.movhi  	r3,hi(x6) # movsi_high
	l.ori   	r3,r3,lo(x6) # movsi_lo_sum
	l.lwz   	r3,0(r3)	 # SI load
	l.addi  	r4,r3,7 # addsi3
	l.movhi  	r3,hi(x9) # movsi_high
	l.ori   	r3,r3,lo(x9) # movsi_lo_sum
	l.sw    	0(r3),r4	 # SI store
	l.movhi  	r3,hi(x10) # movsi_high
	l.ori   	r3,r3,lo(x10) # movsi_lo_sum
	l.addi  	r4,r0,255	 # move immediate I
	l.sw    	0(r3),r4	 # SI store
	l.movhi  	r3,hi(x11) # movsi_high
	l.ori   	r3,r3,lo(x11) # movsi_lo_sum
	l.addi  	r4,r0,512	 # move immediate I
	l.sw    	0(r3),r4	 # SI store
	l.movhi  	r3,hi(x11) # movsi_high
	l.ori   	r3,r3,lo(x11) # movsi_lo_sum
	l.lwz   	r4,0(r3)	 # SI load
	l.movhi  	r3,hi(x10) # movsi_high
	l.ori   	r3,r3,lo(x10) # movsi_lo_sum
	l.lwz   	r3,0(r3)	 # SI load
	l.add   	r4,r4,r3 # addsi3
	l.movhi  	r3,hi(x12) # movsi_high
	l.ori   	r3,r3,lo(x12) # movsi_lo_sum
	l.sw    	0(r3),r4	 # SI store
	l.movhi  	r3,hi(x12) # movsi_high
	l.ori   	r3,r3,lo(x12) # movsi_lo_sum
	l.lwz   	r4,0(r3)	 # SI load
	l.movhi  	r3,hi(x13) # movsi_high
	l.ori   	r3,r3,lo(x13) # movsi_lo_sum
	l.sw    	0(r3),r4	 # SI store
	l.movhi  	r3,hi(x3) # movsi_high
	l.ori   	r3,r3,lo(x3) # movsi_lo_sum
	l.lwz   	r3,0(r3)	 # SI load
	l.sw    	0(r1),r3	 # SI store
	l.movhi  	r3,hi(.LC0) # movsi_high
	l.ori   	r3,r3,lo(.LC0) # movsi_lo_sum
	l.jal   	printf # call_value_internal
	l.nop			# nop delay slot
	l.addi  	r3,r0,0	 # move immediate I
	l.ori   	r11,r3,0	 # move reg to reg
	l.ori	r1,r2,0	# deallocate frame
	l.lwz   	r2,-8(r1)	 # SI load
	l.lwz   	r9,-4(r1)	 # SI load
	l.jr    	r9	# return_internal
	l.nop			# nop delay slot
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.9.2"
