----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/27/2021 03:47:51 PM
-- Design Name: 
-- Module Name: LogicUnit - Behavioral
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

entity LogicUnit is
    Port ( a : in STD_LOGIC_VECTOR(15 downto 0);
           b : in STD_LOGIC_VECTOR(15 downto 0);
           opcode : in STD_LOGIC_VECTOR(2 downto 0);
           logicout : out STD_LOGIC_VECTOR(15 downto 0));
end LogicUnit;

architecture Behavioral of LogicUnit is

begin

-- we write the logic code that is depending on a,b, and opcode

process(a,b,opcode) begin
if(opcode="0000") then
logicout <= A nor B;
elsif (opcode="001") then
logicout <= A nand B;
elsif (opcode="010") then
logicout <= A or B;
elsif (opcode="011") then
logicout <= A and B;
elsif (opcode="100") then
logicout <= A xor B;
elsif (opcode="101") then
logicout <= A xnor B;
elsif (opcode="110") then
logicout <= not A;
else
logicout <= not B;
end if;

end process;

end Behavioral;
