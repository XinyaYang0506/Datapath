# This is a simple program that tests j, jr, and jal

  nop
  li $s0, 3          		# Load a 3 into $s0
  li $s1, 1          		# Load a 1 into $s1
  li $sp, 0xf800
  addi $sp, $sp, -8
  sw $s1, $sp, 0 
  sw $s0, $sp, 4 
  lw $s2, $sp, 0 

# we used 'j_r' to check our jr jump and we used 'jump' to check out our j jump 
#j_r: 
#   add $t0, $s0, $s1		# ADD 1 ($s1) and 3 ($s0)	|	$t0 = 4     
#   jr $t0					# Jump to register $t0 
#   nop

#jump:  
#   and $t0, $s0, $s1  		# AND 1 ($s1) and 3 ($s0) 	| 	$t0 = 
#   andi $t1, $s0, 0   		# AND 0 and 3 ($s0) 		| 	$t1 = 
#   j jump 					# Jump to label 'jump' 
#   nop 


#test:
#  add $t0, $s0, $s1    		# ADD 1 ($s1) and 3 ($s0)	|	$t0 = 4  
#  add $t2, $s1, $s1 		# ADD 1 ($s1) and 1 ($s1) 	|	$t2 = 2
#  addi $t3, $t3, 1 			# ADD 1 to $t3				| 	$t3 = 1
#  beq $s0, $s0, equal		# Check if 3 ($s0) == 3 ($s0), if so jump to 'equal'
#  nop
#  add $t2, $s1, $s1 		# ADD 1 ($s1) and 1 ($s1) 	| 	$t2 = 2
#  addi $t3, $t3, 1 			# ADD 1 to $t3				
#  jal test 					# Jump and link back to 'test'
#  nop
  
#equal: 
#  sub $s0, $s0, $s1			# SUB 1 ($s1) from 3 ($s0) 	|	$s0 = 2
#  bne $s0, $s1, notequal	# Check if 2 ($s0) and 1 ($s0) are equal, if not jump to 'notequal'
#  nop
#  add $t2, $s1, $s1 		# ADD 1 ($s1) and 1 ($s1) 	| 	$t2 = 2
#  addi $t3, $t3, 1 			# ADD 1 to $t3				| 	$t3 = 1
  
#notequal:
#  add $t2, $s1, $s1 		# ADD 1 ($s1) and 1 ($s1) 	| 	$t2 = 2
#  addi $t3, $t3, 1 			# ADD 1 to $t3				| 	$t3 = 1
  
  



