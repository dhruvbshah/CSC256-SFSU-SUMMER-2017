
# CSC256 Project 1
# Name: Dhruv Shah
# Date: 06-23-2017
# Description: This program checks whether the two integers are even or odd. It also checks, the divisibilty of the first integer with
#	       second one. It takes the remainder and compares wether it is zero. if it is, then it is even. else it is odd. 
	     

.data
str:	 	.asciiz "Enter the first integer"
str1: 	 	.asciiz "Enter the second integer"
endl:	 	.asciiz "\n"
strOdd:  	.asciiz "The integer is odd"
strEven: 	.asciiz "The integer is even"
strDiv:  	.asciiz "The first integer is divisible by second"
strNotDiv: 	.asciiz "The first integer is not divisible by second"

.text

main:	
	
	#Ask the first integer
	li	$v0, 4
	la      $a0, str
	syscall
	
	#endl	
	li	$v0, 4
	la	$a0, endl
	syscall
	
	#Input from the user for first integer
	li $v0, 5 					# cin >> n1;
	syscall
	move $s0, $v0					#$s0 is the first integer variable
	
	#reminder
	li $t1, 2					#$t1 stores 2
	rem $s3,$s0,$t1  				#$s3 stores the remainder when $s0 is divided by $t1 
	
	#Check for even or odd
	beq $s3,$0,Even  
							#Even is a lable, to display the it is a even number
	#if fails, then it prints odd
	li	$v0, 4
	la      $a0, strOdd				#Prints if even
	syscall
	j continue  					#skips the part below, and jumps to the corresponding lable
	
	#even
	Even: 
	li	$v0, 4
	la      $a0, strEven				#Prints even number
	syscall
	
	#continue
	continue:
	
	#endl
	li	$v0, 4
	la	$a0, endl
	syscall
	
	#Ask the second integer
	li	$v0, 4
	la      $a0, str1
	syscall
	#endl
	
	li	$v0, 4
	la	$a0, endl
	syscall
	
	#Accept the second integer
	li $v0, 5 					# cin >> n2;
	syscall
	move $s1, $v0					#$s1 is the second integer
	
	#check for divisibilty
	li $t1, 2 
	rem $s2,$s1,$t1					#$s2 stores the remainder of when $s1 is divided by $t1
		
	beq $s2,$0,Even1 				#checks if it is even, goes to lable Even1
	
	
	#Prints if the integer is odd
	li	$v0, 4
	la      $a0, strOdd				#prints odd number
	syscall
	j continue1					#jumps to the corresponding lable
	
	#Prints if the integer is Even
	Even1: 
	li	$v0, 4
	la      $a0, strEven				#prints even number
	syscall
	
	continue1:
	#Checks for the divisibility of first number with second number
	rem $s4,$s0,$s1 				#takes the reminder two numbers and stores it in $s4
	
	#Checks for divisibility
	beq $s4,$0 Divide
	
	#endl
	li	$v0, 4
	la	$a0, endl
	syscall
	
	#prints if not divisible  and exits
	li	$v0, 4
	la      $a0, strNotDiv
	syscall
	j exit 						#jumps to exit lable
	
	
	#Divide
	Divide:
	
	#endl
	li	$v0, 4
	la	$a0, endl
	syscall
	
	#prints if divisible
	li	$v0, 4
	la      $a0, strDiv
	syscall
	j exit 						#jumps to exit lable
	
	#program terminates
	exit:
	li	$v0, 10
	syscall


