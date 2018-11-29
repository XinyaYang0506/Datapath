.constant HALT 0xff00
.constant TERM 0xff10
.constant KB 0xff20
.constant STACK_TOP 0xf800

nop
main:
  li $s0, TERM
  li $s1, KB
  li $sp, STACK_TOP
  jal loop_top
  nop
  li $s0, HALT						# Load the HALT (0xff00) value to $s0 
  jr $s0	
  
loop_top:
  lw $t2, 0($s1) 					# $t2 loads from 0(KB), the first character
  li $t1, '\n'                      # $t1 is a newline character 
  beq $t2, $t1, end			        # checks if $t2 == '\n', jumps to end if true
  nop
  push $ra                          # store $ra
  push $t2							# store $t2
  jal loop_top
  nop
  pop $t2							# pop to $t2
  sw $t2, 0($s0)					# store $t0 (from KB) into 0(TERM)
  pop $ra							# pop to $ra
end:
  jr $ra


						
