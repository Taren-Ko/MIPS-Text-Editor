#############################################################################################
#
# Montek Singh
# COMP 541 Final Projects
# Apr 12, 2017
#
# This is a MIPS program that tests the MIPS processor and the VGA display,
# using a very simple animation.
#
# This program assumes the memory-IO map introduced in class specifically for the final
# projects.  In MARS, please select:  Settings ==> Memory Configuration ==> Default.
#
# NOTE:  MEMORY SIZES.
#
# Instruction memory:  This program has 103 instructions.  So, make instruction memory
# have a size of 128 locations.
#
# Data memory:  Make data memory 64 locations.  This program only uses two locations for data,
# and a handful more for the stack.  Top of the stack is set at the word address
# [0x100100fc - 0x100100ff], giving a total of 64 locations for data and stack together.
# If you need larger data memory than 64 words, you will have to move the top of the stack
# to a higher address.
#
#############################################################################################
#
# THIS VERSION HAS NO PAUSES:  Suitable for Vivado simulation, NOT for board deployment.
#
#############################################################################################

.data 0x10010000 			# Start of data memory
a_sqr:	.space 4
a:	.word 3

.text 0x00400000			# Start of instruction memory
main:
	lui	$sp, 0x1001		# Initialize stack pointer to the 64th location above start of data
	ori 	$sp, $sp, 0x0100	# top of the stack is the word at address [0x100100fc - 0x100100ff]


	li	$a1, 0			# initialize to first screen col (X=0)
	li	$a2, 0			# initialize to first screen row (Y=0)

	#################################################################################################

key_loop:
	li $a0, 41
	jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
	jal 	get_key			# get a key (if available)
	beq	$v0, $0, key_loop	# 0 means no valid key

key1:
bne	$v0, 1, key2
li $a0, 0
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key2:
bne	$v0, 2, key3
li $a0, 1
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key3:
bne	$v0, 3, key4
li $a0, 2
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key4:
bne	$v0, 4, key5
li $a0, 3
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key5:
bne	$v0, 5, key6
li $a0, 4
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key6:
bne	$v0, 6, key7
li $a0, 5
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key7:
bne	$v0, 7, key8
li $a0, 6
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key8:
bne	$v0, 8, key9
li $a0, 7
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key9:
bne	$v0, 9, key10
li $a0, 8
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key10:
bne	$v0, 10, key11
li $a0, 9
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key11:
bne	$v0, 11, key12
li $a0, 10
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key12:
bne	$v0, 12, key13
li $a0, 11
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key13:
bne	$v0, 13, key14
li $a0, 12
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key14:
bne	$v0, 14, key15
li $a0, 13
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key15:
bne	$v0, 15, key16
li $a0, 14
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key16:
bne	$v0, 16, key17
li $a0, 15
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key17:
bne	$v0, 17, key18
li $a0, 16
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key18:
bne	$v0, 18, key19
li $a0, 17
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key19:
bne	$v0, 19, key20
li $a0, 18
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key20:
bne	$v0, 20, key21
li $a0, 19
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key21:
bne	$v0, 21, key22
li $a0, 20
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key22:
bne	$v0, 22, key23
li $a0, 21
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key23:
bne	$v0, 23, key24
li $a0, 22
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key24:
bne	$v0, 24, key25
li $a0, 23
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key25:
bne	$v0, 25, key26
li $a0, 24
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key26:
bne	$v0, 26, key27
li $a0, 25
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key27:
bne	$v0, 27, key28
li $a0, 26
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key28:
bne	$v0, 28, key29
li $a0, 27
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key29:
bne	$v0, 29, key30
li $a0, 28
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key30:
bne	$v0, 30, key31
li $a0, 29
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key31:
bne	$v0, 31, key32
li $a0, 30
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key32:
bne	$v0, 32, key33
li $a0, 31
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key33:
bne	$v0, 33, key34
li $a0, 32
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key34:
bne	$v0, 34, key35
li $a0, 33
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key35:
bne	$v0, 35, key36
li $a0, 34
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key36:
bne	$v0, 36, key37
li $a0, 35
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key37:
bne	$v0, 37, key38
li $a0, 36
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key38:
bne	$v0, 38, key39
li $a0, 37
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key39:
bne	$v0, 39, key40
li $a0, 38
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key40:
bne	$v0, 40, key41
li $a0, 39
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key41:
bne	$v0, 41, key42
li $a0, 40
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y
li	$a0, 15			# pause for 1/4 second
jal	pause

addi	$a1, $a1, 1 		# move right
slti $1, $a1, 1200
bne $1, $0, key_loop
li $a1, 1199
j	key_loop

key42:
bne	$v0, 42, key_loop
li $a0, 0
jal	putChar_atXY 		# $a0 is char, $a1 is X, $a2 is Y

addi	$a1, $a1, -1 		# move left
li	$a0, 15			# pause for 1/4 second
jal	pause

slt	$1, $a1, $0		# make sure X >= 0
beq	$1, $0, key_loop
li	$a1, 0


j	key_loop






	###############################
	# END using infinite loop     #
	###############################
end:
	j	end          	# infinite loop "trap" because we don't have syscalls to exit


######## END OF MAIN #################################################################################



######## END OF CODE #################################################################################

.include "procs_board.asm"
