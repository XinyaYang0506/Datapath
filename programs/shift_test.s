nop
li $t0, 24
li $t1, 24
li $t2, 24
sll $t0, $t0, 1 #should be 48
srl $t1, $t1, 2 #shoulde be 6
sra $t2, $t2, 1 #shoulde be 12
li $t3, 0xff56 #some negtive number
sra $t3, $t3, 1 #still be negative 
 
 
 
 
 
 
 
 
 
 
 
 
