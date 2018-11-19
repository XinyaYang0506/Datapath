# This is a simple program that tests j, jr, and jal

  nop
  li $s1, 5
  li $s0, 0
  li $s2, 0xff00
  
  test: 
  beq $s0, $s1, end
  nop
  addi $s0, $s0, 1
  j test
  
  end: 
  jr $s2
  nop



