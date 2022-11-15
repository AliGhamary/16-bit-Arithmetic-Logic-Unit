----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/23/2021 10:03:08 AM
-- Design Name: 
-- Module Name: Final_Project - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Final_Project is
    Port ( A : in STD_LOGIC_VECTOR(15 downto 0);
           B : in STD_LOGIC_VECTOR(15 downto 0);
           mode : in STD_LOGIC;
           opcode : in STD_LOGIC_VECTOR(2 downto 0);
           ALU_out : out STD_LOGIC_VECTOR(15 downto 0);
           cout : out STD_LOGIC);
end Final_Project;

architecture Behavioral of Final_Project is
--Add our Controller to the ALU
component controller is
    Port ( mode : in STD_LOGIC;
           copcode : in STD_LOGIC_VECTOR (2 downto 0);
           sel : out STD_LOGIC_VECTOR (1 downto 0);
           sel1 : out STD_LOGIC;
           sel2 : out STD_LOGIC;
           selout : out STD_LOGIC;
           direction : out STD_LOGIC;
           stype : out STD_LOGIC;
           copcodeout : out STD_LOGIC_VECTOR (2 downto 0));
end component;
--Add the Arithmetic Unit
component ArithmeticUnit is
    Port ( A : in STD_LOGIC_VECTOR(15 downto 0);
           B : in STD_LOGIC_VECTOR(15 downto 0);
           op_sel : in STD_LOGIC_VECTOR(1 downto 0);
           arith_out : out STD_LOGIC_VECTOR(15 downto 0);
           cout : out STD_LOGIC);
end component;
--Add our Shifter Unit
component ShifterUnit is
    Port ( A : in STD_LOGIC_VECTOR(15 downto 0);
           B : in STD_LOGIC_VECTOR(15 downto 0);
           direction : in STD_LOGIC;
           op_type : in STD_LOGIC;
           shiftout : out STD_LOGIC_VECTOR(15 downto 0));
end component;
--Add our Logic Unit
component LogicUnit is
    Port ( a : in STD_LOGIC_VECTOR(15 downto 0);
           b : in STD_LOGIC_VECTOR(15 downto 0);
           opcode : in STD_LOGIC_VECTOR(2 downto 0);
           logicout : out STD_LOGIC_VECTOR(15 downto 0));
end component;
--Add our MUX which will be used twice in this circuit
component MUX is
    Port ( a : in STD_LOGIC_VECTOR(15 downto 0);
           b : in STD_LOGIC_VECTOR(15 downto 0);
           sel : in STD_LOGIC;
           y : out STD_LOGIC_VECTOR(15 downto 0));
end component;
--Add our AND unit which outputs the carry
component ANDUnit is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           z : out STD_LOGIC);
end component;

--Declare signals within our design
signal sel: STD_LOGIC_VECTOR(1 downto 0);
signal sel1,sel2,selout,direction,stype: STD_LOGIC;
signal copcodeout : STD_LOGIC_VECTOR (2 downto 0);
signal arith_out,shiftout,logicout : STD_LOGIC_VECTOR(15 downto 0);
signal Arithcout: STD_LOGIC;
signal y : STD_LOGIC_VECTOR(15 downto 0);

begin
--We map our ALU circuit to the different components as provided in the figure
control: controller port map(mode,opcode,sel,sel1,sel2,selout,direction,stype,copcodeout);
arith: ArithmeticUnit port map(A,B,sel, arith_out,Arithcout);
shift: ShifterUnit port map(A,B,direction,stype,shiftout);
logic: LogicUnit port map(A,B,copcodeout,logicout);
MUX1: MUX port map(Arith_out,shiftout,sel1,y); --0 chooses arithmetic 1 choses shift
MUX2: MUX port map(logicout,y,sel2,ALU_out);--0 choses logic 1 choses MUX1 output. Output our ALU out
carry: ANDUnit port map(Arithcout,selout,cout); -- output carry


end Behavioral;
