.constant HALT 0xff00
.constant TERM 0xff10
.constant KB 0xff20
.constant STACK_TOP 0xf800

nop
main:
  li $s0, TERM
  li $s1, KB
  li $sp, STACK_TOP
#  li $s2, 9
  li $s2, 10 
  
loop_top:
  lw $t2, 0($s1)
  beq $t2, $zero, loop_top
#  lw $t2, 0($s1)
  lw $t3, 0($s1) 
  lw $t3, 0($s1) 
  add $t2, $t2, $t3        #$t2 = sum
  nop
  blt! $t2, $s2, print      #check sum < 10?
  nop
  sub $t2, $t2, $s2        #$t2 =the digit 0
  li $t3, 1
  addi $t3, $t3, 0x30
  sb $t3, 0($s0)
print:
  addi $t2, $t2, 0x30
  sb $t2, 0($s0)
  lw $t2, 0($s1)
  j loop_top

end:
  li $s0, HALT
  jr $s0
