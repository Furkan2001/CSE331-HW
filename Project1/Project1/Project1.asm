.data

String:		.asciiz		"Enter two dimensional array sizes: "

Array:		.asciiz		"Enter the elements of two dimensional array(they must be dot or small letter o): "

Second:		.asciiz		"Enter second (how many steps the program will run): "

NewLine:	.asciiz		"\n"

FirstArray:	.asciiz		"\n\nThis is array that you entered with inputs:\n"

BombArray:	.asciiz		"\n\nAll indices of this array contain the letter o:\n"

ResultArray:	.asciiz		"\n\nThis array is the array where the explosions took place:\n"


.text
# s0 -> row length
# s1 -> column length
# s2 -> row * length
# s3 -> starting array in memory
# s4 -> second
# s5 -> counter for second

# Prints the content of the String variable to the screen.
li	$v0,	4 # I recorded number 4 in register v0. To print the string to the screen
la	$a0,	String
syscall # system call

li	$v0,	5 # I got the row length from the user
syscall # system call

move	$s0	$v0 # I will keep the row length in the s0 register until the end of the program.

li	$v0,	5 # I got the column length from the user
syscall # system call

move	$s1	$v0 # I will keep the column length in the s1 register until the end of the program.

mul	$s2,	$s1,	$s0 # s2 = row * column

# I am writing to allocate as much space in memory as the user wants.
move	$a0,	$s2 # I entered the size of the area I want to reserve in the a0 register.
li	$v0,	9
syscall # system call
move	$s3,	$v0 # I saved the starting address of the array in the s3 register.

# Publish the message so that the user can enter the elements of the two-dimensional array
li	$v0,	4 # I recorded number 4 in register v0. To print the string to the screen
la	$a0,	Array
syscall # system call

# Here, I will get data from the user character by character with a loop similar to the while loop for the array.
li	$t0,	0 # I will use register t0 as counter
TakeCharacterFromUser:
li	$v0,	12 # user enters a character in here
syscall # system call
add	$t1,	$t0,	$s3 # As I progress from the starting address of the array, I add the starting address with the counter and save the current address to the t1 register.
sb	$v0,	0($t1) # The character entered by the user in the v0 register is saved in the array blocks in memory, respectively.
addi	$t0,	$t0,	1 # counter++
bne	$t0,	$s2,	TakeCharacterFromUser # If the counter does not reach the size of the array, the loop continues. The loop ends when the number of received inputs equals the size of the array.

# I will print \n to screen, I mean line will past next line
la	$a0,	NewLine # I loaded the address of the Newline string into the a0 register.
li	$v0,	4 # I recorded number 4 in register v0. To print the string to the screen
syscall # system calls

# I write these codes to get a second information from the user
li	$v0,	4 # I recorded number 4 in register v0. To print the string to the screen
la	$a0,	Second
syscall # system call
li	$v0,	5
syscall # system call
move	$s4,	$v0 # I saved the seconds information I received from the user to the S4 register.
li	$s5,	0 # I created the s5 register as a second counter

# I pressed the FirstArray variable to the screen
li	$v0,	4 # I recorded number 4 in register v0. To print the string to the screen
la	$a0,	FirstArray
syscall # system call
jal	PrintRealArray # print Array to screen
addi	$s5,	$s5,	1 # Each time I press the array onto the screen, it counts as advancing one second.
beq	$s4,	$s5,	exit
MultiplesOfTwoForSecond:
	li	$v0,	4 # I recorded number 4 in register v0. To print the string to the screen
	la	$a0,	BombArray
	syscall # system call
	jal	PrintDummyArray # print dummy Array to screen
	addi	$s5,	$s5,	1 # Each time I press the array onto the screen, it counts as advancing one second.
	beq	$s4,	$s5,	exit
MultiplesForThreeForSecond:
	li	$v0,	4 # I recorded number 4 in register v0. To print the string to the screen
	la	$a0,	ResultArray
	syscall # system call	
	jal	FillWithXArray
	jal 	ExplodeFields
	jal 	ChangeXWithO
	jal	PrintRealArray # print Array to screen
	addi	$s5,	$s5,	1 # Each time I press the array onto the screen, it counts as advancing one second.
	beq	$s4,	$s5,	exit
	bne	$s4,	$s5,	MultiplesOfTwoForSecond


# exit (terminate execution)
exit:	
	li	$v0,	10
	syscall # system calls
	
	
# I printed array to the screen
PrintRealArray:
	# I will print \n to screen, I mean line will past next line
	la	$a0,	NewLine # I loaded the address of the Newline string into the a0 register.
	li	$v0,	4 # I recorded number 4 in register v0. To print the string to the screen
	syscall # system calls
	move	$t2,	$s3 # I saved the starting address of the array in memory to the t2 register.
	li	$t0,	0 # i = 0 , I used t0 register as i counter in c
	LoopRealRows:
		li	$t1,	0 # j = 0 , I used t1 register as j counter in c
		LoopRealColumn:
			lb	$t3,	0($t2) # I saved the value at address t2 of memory to register t3.
			# for print charachter
			move	$a0,	$t3 # I sent the value I brought from memory to register a0.
			li	$v0,	11 # I wrote 11 to v0 register because it is a rule for print character to screen.
			syscall # system calls
			addi	$t1,	$t1,	1 #j++
			addi	$t2,	$t2,	1 # Load the memory address of the next index of the array into t2 register
			bne	$t1,	$s1	LoopRealColumn # If the loop has not looped as many times as the number of columns, let it continue looping.
		# I will print \n to screen, I mean line will past next line
		la	$a0,	NewLine # I loaded the address of the Newline string into the a0 register.
		li	$v0,	4 # I recorded number 4 in register v0. To print the string to the screen
		syscall # system calls
		addi	$t0,	$t0,	1 # i++
		bne	$t0,	$s0,	LoopRealRows # If not all rows have been cycled then the loop continues to loop.
	jr	$ra # Causes the subroutine to jump back to where it was called
	
	
# I print array as whole indexes are letter o
PrintDummyArray:
	li	$t9,	111 # I saved 111 to register t9 register. Because 111 is ascii value of small letter o
	# I will print \n to screen, I mean line will past next line
	la	$a0,	NewLine # I loaded the address of the Newline string into the a0 register.
	li	$v0,	4 # I recorded number 4 in register v0. To print the string to the screen
	syscall # system calls
	li	$t0,	0 # i = 0 , I used t0 register as i counter in c
	LoopDummyRows:
		li	$t1,	0 # j = 0 , I used t1 register as j counter in c
		LoopDummyColumn:
			# for print charachter
			move	$a0,	$t9 # I sent the value I brought from memory to register a0.
			li	$v0,	11 # I wrote 11 to v0 register because it is a rule for print character to screen.
			syscall # system calls
			addi	$t1,	$t1,	1 #j++
			bne	$t1,	$s1	LoopDummyColumn # If the loop has not looped as many times as the number of columns, let it continue looping.
		# I will print \n to screen, I mean line will past next line
		la	$a0,	NewLine # I loaded the address of the Newline string into the a0 register.
		li	$v0,	4 # I recorded number 4 in register v0. To print the string to the screen
		syscall # system calls
		addi	$t0,	$t0,	1 # i++
		bne	$t0,	$s0,	LoopDummyRows # If not all rows have been cycled then the loop continues to loop.
	jr	$ra # Causes the subroutine to jump back to where it was called

		
# I wrote this subroutine to put x where there are dots in the index.
FillWithXArray:
	li	$t8,	46 # I saved 46 to register t9 register. Because 46 is ascii value of dot
	li	$t7,	120 # I saved 120 to register t9 register. Because 120 is ascii value of small letter x
	move	$t2,	$s3 # I saved the starting address of the array in memory to the t2 register.
	li	$t0,	0 # i = 0 , I used t0 register as i counter in c
	LoopFillRows:
		li	$t1,	0 # j = 0 , I used t1 register as j counter in c
		LoopFillColumn:
			lb	$t3,	0($t2) # I saved the value at address t2 of memory to register t3.
			# for print charachter
			bne	$t3,	$t8,	continueNotFill # If this index is a dot, I fill that point with x
			sb	$t7,	0($t2) # If there is a dot in the index of the memory where we are, I replaced it with the letter x.
continueNotFill:	addi	$t1,	$t1,	1 #j++
			addi	$t2,	$t2,	1 # Load the memory address of the next index of the array into t2 register
			bne	$t1,	$s1	LoopFillColumn # If the loop has not looped as many times as the number of columns, let it continue looping.
		addi	$t0,	$t0,	1 # i++
		bne	$t0,	$s0,	LoopFillRows # If not all rows have been cycled then the loop continues to loop.
	jr	$ra # Causes the subroutine to jump back to where it was called
	
	
# I wrote this subroutine to put o where there is x in the index inside array.
ChangeXWithO:
	li	$t9,	111 # I saved 111 to register t9 register. Because 111 is ascii value of small letter o
	li	$t7,	120 # I saved 120 to register t9 register. Because 120 is ascii value of small letter x
	move	$t2,	$s3 # I saved the starting address of the array in memory to the t2 register.
	li	$t0,	0 # i = 0 , I used t0 register as i counter in c
	LoopChangeRows:
		li	$t1,	0 # j = 0 , I used t1 register as j counter in c
		LoopChangeColumn:
			lb	$t3,	0($t2) # I saved the value at address t2 of memory to register t3.
			# for print charachter
			bne	$t3,	$t7,	continueNotChange # If this index is a letter x, I fill that point with o
			sb	$t9,	0($t2) # If there is a dot in the index of the memory where we are, I replaced it with the letter x.
continueNotChange:	addi	$t1,	$t1,	1 #j++
			addi	$t2,	$t2,	1 # Load the memory address of the next index of the array into t2 register
			bne	$t1,	$s1	LoopChangeColumn # If the loop has not looped as many times as the number of columns, let it continue looping.
		addi	$t0,	$t0,	1 # i++
		bne	$t0,	$s0,	LoopChangeRows # If not all rows have been cycled then the loop continues to loop.
	jr	$ra # Causes the subroutine to jump back to where it was called
	
	
# I wrote this subroutine to explode the fields containing that letter in the array.	
ExplodeFields:
	li	$t9,	111 # I saved 111 to register t9 register. Because 111 is ascii value of small letter o
	move	$t2,	$s3 # I saved the starting address of the array in memory to the t2 register.
	li	$t0,	0 # i = 0 , I used t0 register as i counter in c
	LoopExplodeRows:
		li	$t1,	0 # j = 0 , I used t1 register as j counter in c
		LoopExplodeColumn:
			lb	$t3,	0($t2) # I saved the value at address t2 of memory to register t3.
			# for print charachter
			bne	$t3,	$t9,	continue # If there is a point in an index, I fill continue to traverse in array
			# I used registers a1 and a2 as parameters
			move	$a1,	$t0 # a1 holds the row of the index
			move	$a2,	$t1 # a2 holds the column of the index
			j	UpControl # I jumped to this function to check if the index is on the top row.
	continue:	addi	$t1,	$t1,	1 #j++
			addi	$t2,	$t2,	1 # Load the memory address of the next index of the array into t2 register
			bne	$t1,	$s1	LoopExplodeColumn # If the loop has not looped as many times as the number of columns, let it continue looping.
		addi	$t0,	$t0,	1 # i++
		bne	$t0,	$s0,	LoopExplodeRows # If not all rows have been cycled then the loop continues to loop.
	jr	$ra # Causes the subroutine to jump back to where it was called
	

# It checks whether the index is on the top line or not, and if it is not on the top line, make the index above it a dot, that is, explode it.
UpControl:	
	li	$t8,	46 # I saved 46 to register t9 register. Because 46 is ascii value of dot
	beq	$a1,	$zero,	LeftControl # If the index is on the top row of the array, jump to LeftCoontrol
	sub	$t5,	$t2,	$s1 # In order to go from the current index to a higher index, I subtracted the column length from the current index and saved it in the t5 register.
	sb	$t8,	0($t5) # I recorded a dot inside the index to explode the index above.
	j	LeftControl
	

# If this is an index in the leftmost column, jump to rigtControl, but if not, explode the index to the left of it.
LeftControl:	
	li	$t8,	46 # I saved 46 to register t9 register. Because 46 is ascii value of dot
	beq	$a2,	$zero,	RightControl # If the index is in the leftmost column of the array, jump to LeftControl
	subi	$t5,	$t2,	1 # To move from the current index to a further left index, I subtracted 1 from the current index and recorded it in the t5 register.
	sb	$t8,	0($t5) # I recorded a dot inside the index to explode the index above.
	j	RightControl
	
	
# If this index is not in the last column, explode the index one position to the right of the current index.
RightControl:
	li	$t9,	111 # I saved 111 to register t9 register. Because 111 is ascii value of small letter o	
	li	$t8,	46 # I saved 46 to register t9 register. Because 46 is ascii value of dot
	addi	$a2,	$a2,	1 # To check if the current index is on the last column, I increased the column by one.
	beq	$a2,	$s1,	BottomControl # If the current index is on the rightmost column, jump to bottomControl
	addi	$t5,	$t2,	1 # To move from the current index to a further right index, I added 1 to the current index and recorded it in the t5 register.
	lb	$t7,	0($t5) # Save the contents of the element to the right of the current index into register t7
	beq	$t7,	$t9	BottomControl # If the index one to the right is equal to the letter o, jump to bottomControl
	sb	$t8,	0($t5) # If the index on the right does not have the letter o in it, explode that index, that is, place dot in it.
	j	BottomControl
	

# It checks whether the index is on the bottom line or not, if it is on the bottom line, it jumps to ExplodeItself.	
BottomControl:
	li	$t9,	111 # I saved 111 to register t9 register. Because 111 is ascii value of small letter o	
	li	$t8,	46 # I saved 46 to register t9 register. Because 46 is ascii value of dot
	addi	$a1,	$a1,	1 # To check if the current index is on the bottom row, I increased the row by one.
	beq	$a1,	$s0,	ExplodeItself # If the current index is on the bottom row, jump to ExplodeItself
	add	$t5,	$t2,	$s1 # In order to go from the current index to a bottom index, I added the column length to the current index and saved it in the t5 register.
	lb	$t7,	0($t5) # Save the contents of the element to the right of the current index into register t7
	beq	$t7,	$t9	ExplodeItself # If the index one to the bottom is equal to the letter o, jump to ExplodeItself
	sb	$t8,	0($t5) # If the index on the under does not have the letter o in it, explode that index, that is, place dot in it.
	j	ExplodeItself
	
	
# Since there is a bomb in this index, explode this index, that is, put a period.	
ExplodeItself:
	li	$t8,	46 # I saved 46 to register t9 register. Because 46 is ascii value of dot
	sb	$t8,	0($t2) # exploded this index
	j	continue
