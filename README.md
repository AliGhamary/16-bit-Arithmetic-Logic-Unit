# 16-bit-Arithmetic-Logic-Unit

This is a 16-bit Arithmetic Logic Unit (ALU) created using VHDL code.

The ALU consists of indivually designed components that include:
1) Controller Unit
2) AND Unit
3) Arithmetic Unit
4) Logic Unit
5) Shifter Unit
6) Two MUX Units

A (16-bit), B (16-bit), an Opcode (3-bit), and Mode (1-bit) are the inputs.

ALUOut (16-bit) and Cout (1-bit) are the outputs of the design. 

A and B hold the values of the operands. Mode and Opcode together indicate the type of the operation performed by ALU.

The controller is responsible for generating the required control signals for all
functional blocks in the design. 

The following table summarizes the overall behavior of the ALU:

| Mode | OpCode | Operation |
| ------------- | ------------- | -------------|
| 0  | 000  | A nor B |
| 0  | 001  | A nand B |
| 0 | 010|A or B|
| 0|0111|A and B|
| 0|100|A xor B|
| 0|101|A xnor B|
| 0|110| NOT A|
| 0|111|NOT B|
| 1 |000| A * B|
| 1 |001|A + B|
| 1 |010| A - B|
| 1 | 011 | Increment A|
| 1 |100 | Shift Left (A,B)|
| 1 |101 | Shift Right (A,B)|
| 1 |110 | Rotate Left (A,B)|
| 1 |111 | Rotate Right (A,B)|


The ALU uses the Testbench file created to test each operation thoroughly.
