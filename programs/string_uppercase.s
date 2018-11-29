.constant HALT 0xff00
.constant TERM 0xff10
.constant KB 0xff20
.constant STACK_TOP 0xf800

nop
main:
  li $s0, TERM
  li $s1, KB
  li $sp, STACK_TOP
  li $s2, 'A'
  li $s3, 'a'
  li $t3, 'z'
  subi $s2, $s2, 'a' 				# $s2 = difference between uppercase and lowercase characters
  
loop_top:
  lw $t2, 0($s1)	
  blt! $t2, $s3, print				# determine if the given character's ASCII value is below 'a' 
									# meaning that the character is not lowercase
  nop
  bgt! $t2, $t3, print				# determine if the given characer's ASCII value is above 'z'
									# meaning that the character is not lowercase
  nop
  add $t2, $t2, $s2					# add the difference between 'A' - 'a' ($s2) to the character's
									# ASCII code
  
print: 
  beq $t2, $zero, loop_top
  sw $t2, 0($s0)
  li $t1, '\n'						# $t1 is a null character
  beq $t2, $t1, end					# check if the given character is a null, if true, jump to end
  j loop_top


end:
  li $s0, HALT						# store the HALT value 0xff00 into $s0 
  jr $s0							# halt the program
