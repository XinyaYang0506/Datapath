import assembler
import pips

# The instruction decorator tells the assembler to create a new syntax rule for add instructions.
# The "#" spots indicate operands, which are passed in as parameters to the function below.
# The second parameter indicates the number of instructions this rule will create (1 in this case)
@assembler.instruction('add #, #, #', 1)
def add(dest, operand1, operand2):
  return pips.rformat(opcode='add', r0=dest, r1=operand1, r2=operand2)

# Encode an addi instruction
@assembler.instruction('addi #, #, #', 1)
def addi(dest, op1, immediate):
  return pips.iformat(opcode='add', r0=dest, r1=op1, imm=immediate)
  
# Encode the li pseudoinstruction using an addition to zero
@assembler.instruction('li #, #', 1)
def li(dest, immediate):
  return addi(dest, '$zero', immediate)

#Encode the subi instruction 
@assembler.instruction('subi #, #, #', 1)
def subi(dest, op1, immediate):
  return pips.iformat(opcode= 'sub', r0=dest, r1=op1, imm=immediate)

#Encode the sub instruction
@assembler.instruction('sub #, #, #', 1)
def sub(dest, op1, op2):
  return pips.rformat(opcode= 'sub', r0=dest, r1=op1, r2=op2)

#Encode the and instruction  
@assembler.instruction('and #, #, #', 1)
def and_instr(dest, op1, op2):
  return pips.rformat(opcode= 'and', r0=dest, r1=op1, r2=op2)

#Encode the andi instruction  
@assembler.instruction('andi #, #, #', 1)
def andi(dest, op1, immediate):
  return pips.iformat(opcode= 'and', r0=dest, r1=op1, imm=immediate)

#Encode the or instruction  
@assembler.instruction('or #, #, #', 1)
def or_instr(dest, op1, op2):
  return pips.rformat(opcode= 'or', r0=dest, r1=op1, r2=op2)

#Encode the ori instruction  
@assembler.instruction('ori #, #, #', 1)
def ori(dest, op1, immediate):
  return pips.iformat(opcode= 'or', r0=dest, r1=op1, imm=immediate)

#Encode the nand instruction  
@assembler.instruction('nand #, #, #', 1)
def nand(dest, op1, op2):
  return pips.rformat(opcode= 'nand', r0=dest, r1=op1, r2=op2)

#Encode the nandi instruction  
@assembler.instruction('nandi #, #, #', 1)
def nandi(dest, op1, immediate):
  return pips.iformat(opcode= 'nand', r0=dest, r1=op1, imm=immediate)

#Encode the nor instruction  
@assembler.instruction('nor #, #, #', 1)
def nor(dest, op1, op2):
  return pips.rformat(opcode= 'nor', r0=dest, r1=op1, r2=op2)

#Encode the nori instruction  
@assembler.instruction('nori #, #, #', 1)
def nori(dest, op1, immediate):
  return pips.iformat(opcode= 'nor', r0=dest, r1=op1, imm=immediate)

#Encode the xor instruction  
@assembler.instruction('xor #, #, #', 1)
def xor(dest, op1, op2):
  return pips.rformat(opcode= 'xor', r0=dest, r1=op1, r2=op2)

#Encode the xori instruction  
@assembler.instruction('xori #, #, #', 1)
def xori(dest, op1, immediate):
  return pips.iformat(opcode= 'xor', r0=dest, r1=op1, imm=immediate)

#Encode the slt instruction  
@assembler.instruction('slt #, #, #', 1)
def slt(dest, op1, op2):
  return pips.rformat(opcode= 'slt', r0=dest, r1=op1, r2=op2)

#Encode the slti instruction  
@assembler.instruction('slti #, #, #', 1)
def slti(dest, op1, immediate):
  return pips.iformat(opcode= 'slt', r0=dest, r1=op1, imm=immediate)

#Encode the sltu instruction  
@assembler.instruction('sltu #, #, #', 1)
def sltu(dest, op1, op2):
  return pips.rformat(opcode= 'sltu', r0=dest, r1=op1, r2=op2)

#Encode the sltiu instruction  
@assembler.instruction('sltiu #, #, #', 1)
def sltu(dest, op1, immediate):
  return pips.iformat(opcode= 'sltu', r0=dest, r1=op1, imm=immediate)

#Encode the nop instruction
@assembler.instruction('nop', 1)
def nop():
  return pips.iformat(opcode= 'add', r0='$zero', r1='$zero', imm=0)

#Encode the j instruction
@assembler.instruction('j #', 1)
def j(immediate):
  return pips.iformat(opcode= 'j', r0='$zero', r1='$zero', imm=immediate)

#Encode the jr instruction
@assembler.instruction('jr #', 1)
def jr(op1):
  return pips.rformat(opcode= 'j', r0='$zero', r1='$zero', r2=op1)

#Encode the jal instruction
@assembler.instruction('jal #', 1)
def jal(immediate):
  return pips.iformat(opcode= 'j', r0='$ra', r1='$zero', imm=immediate, link=True)

#Encode the beq instruction
@assembler.instruction('beq #, #, #', 1)
def beq(op1, op2, dest):
  return pips.iformat(opcode= 'beq', r0=op1, r1=op2, imm=dest)

#Encode the bne instruction
@assembler.instruction('bne #, #, #', 1)
def bne(op1, op2, dest):
  return pips.iformat(opcode= 'bne', r0=op1, r1=op2, imm=dest)

#Encode the lb instruction
@assembler.instruction('lb #, #(#)', 1)
def lb(dest, immediate, op1):
  return pips.iformat(opcode= 'lb', r0=dest, r1=op1, imm=immediate)

#Encode the lw instruction
@assembler.instruction('lw #, #(#)', 1)
def lw(dest, immediate, op1):
  return pips.iformat(opcode= 'lw', r0=dest, r1=op1, imm=immediate)

#Encode the sb instruction
@assembler.instruction('sb #, #(#)', 1)
def sb(dest, immediate, op1):
  return pips.iformat(opcode= 'sb', r0=dest, r1=op1, imm=immediate)

#Encode the sw instruction
@assembler.instruction('sw #, #(#)', 1)
def sw(dest, immediate, op1):
  return pips.iformat(opcode= 'sw', r0=dest, r1=op1, imm=immediate)

#Encode the sll instruction
@assembler.instruction('sll #, #, #', 1)
def sll(dest, op1, immediate):
  return pips.rformat(opcode='add', r0=dest, r1='$zero', r2=op1, shift_type=pips.SHIFT_LEFT, shift_amt=immediate)

#Encode the srl instruction
@assembler.instruction('srl #, #, #', 1)
def srl(dest, op1, immediate):
  return pips.rformat(opcode='add', r0=dest, r1='$zero', r2=op1, shift_type=pips.SHIFT_RIGHT_LOGICAL, shift_amt=immediate)

#Encode the sra instruction
@assembler.instruction('sra #, #, #', 1)
def sra(dest, op1, immediate):
  return pips.rformat(opcode='add', r0=dest, r1='$zero', r2=op1, shift_type=pips.SHIFT_RIGHT_ARITHMETIC, shift_amt=immediate)

#Encode the not instruction
@assembler.instruction('not #, #', 1)
def not_instr(dest, src):
  return xori(dest, src, 0xffff)

#Encode the push instruction
@assembler.instruction('push #', 2) # <- notice the 2 here. This tells the assembler that we will emit two instructions for this rule
def push_instr(reg):
  return addi('$sp', '$sp', '-2') + sw(reg, 0, '$sp')

#Encode the pop instruction
@assembler.instruction('pop #', 2) # <- notice the 2 here. This tells the assembler that we will emit two instructions for this rule
def pop_instr(reg):
  return lw(reg, 0,'$sp') + addi('$sp', '$sp', '2')

#Encode the blt instruction
@assembler.instruction('blt #, #, #', 2) # <- notice the 2 here. This tells the assembler that we will emit two instructions for this rule
def blt!(op1, op2, immediate):
  return slt('$t0', op1, op2) + bne('$t0', '$zero', immediate)

#Encode the bge instruction
@assembler.instruction('bge #, #, #', 2) # <- notice the 2 here. This tells the assembler that we will emit two instructions for this rule
def blt!(op1, op2, immediate):
  return slt('$t0', op2, op1) + bne('$t0', '$zero', immediate)



