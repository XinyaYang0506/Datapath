nop
li $t1, 0x0010

#bgt! $t1, $zero, boop  -- If uncommented, will test the bgt 
#nop

#blt! $t1, $zero, boop	-- If uncommented, will test the blt 
#nop

#bge! $t1, $t1, boop 	-- If uncommented, will test the bge 
#nop

ble! $zero, $t1, boop   # 	Will test the ble 
nop

li $t3, 3

pop: 
li $t2, 25 

boop: 
li $t2, 2

li $t3, 3

not $t3, $t3 

push $t3				# put $t3 on the stack

pop $t1					# pop the latest item from the stack to $t1
