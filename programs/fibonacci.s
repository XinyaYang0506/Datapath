# Program to print out the Fibonacci numbers
.constant TERMINAL 0xff10
.constant HALT 0xff00

nop
li $s1, TERMINAL
li $sp, 0xf800 

fibonacci:

  li $s0, 2 #counter = 2
  li $s2, 1
  li $s3, 1
  addi $a0, $s2, 0 
  jal print_decimal_number
  nop
  li $t0, 0x0a                                  # Load ASCII value for newline
  sb $t0, 0($s1)                                # Print newline
  addi $a0, $s3, 0 
  jal print_decimal_number
  nop
  
fibonacci_loop: 
  li $t0, 0x0a                                  # Load ASCII value for newline
  sb $t0, 0($s1)                                # Print newline
  li $t3, 15				        # set the limit to 15 numbers to print
  beq $t3, $s0, fibonacci_end
  nop
  add $a0, $s3, $s2
  addi $s2, $s3, 0
  addi $s3, $a0, 0
  jal print_decimal_number
  nop
  addi $s0, $s0, 1                              #counter++
  j fibonacci_loop
  nop
  
fibonacci_end:
  j HALT                                        # Stop execution
  nop
  
  
remainder: 
  slt $t0, $a0, $a1 				# $a0 = numerator, $a1 = denominator
  bne $t0, $zero, remainder_end
  nop
  sub $a0, $a0, $a1
  j remainder
  nop
  
remainder_end:
  addi $v0, $a0, 0
  jr $ra
  nop
  
quotient: 
  li $v0, 0					# counter = $v0 
quotient_loop:
  slt $t1, $a0, $a1				# see if $a0 < $a1 (bottom of the loop)
  bne $t1, $zero, quotient_exit	
  nop
  sub $a0, $a0, $a1 				# SUB $a0 from $a1 
  addi $v0, $v0, 1				# counter++ 
  nop
  j quotient_loop
  nop
 
quotient_exit: 
  jr $ra
  nop

  
  
print_decimal_number:
  bne $a0, $zero, else
  nop
  li $t0, 0x30                      # '0'
  sb $t0, 0($s1)
  jr $ra
  nop
  
 else:
  li $a1, 10
  addi $sp, $sp, -12
  sw $ra, 8($sp)
  sw $a0, 0($sp)
  jal remainder
  nop
  sw $v0, 4($sp)            #store digit 
  lw $a0, 0($sp)            #get back n
  slt $t2, $v0, $a0
  beq $t2, $zero, end
  nop 
  jal quotient
  nop
  addi $a0, $v0, 0
  jal print_decimal_number
  nop
   
end:
  lw $t3, 4($sp)
  addi $t3, $t3, 0x30
  sb $t3, 0($s1)
  lw $ra, 8($sp)            #restore the return address
  addi $sp, $sp, 12
  jr $ra
  nop
  
  
  
  

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
