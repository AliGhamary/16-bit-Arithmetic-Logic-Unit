----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/27/2021 05:08:44 PM
-- Design Name: 
-- Module Name: Final_Project_tb - Behavioral
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

entity Final_Project_tb is
--  Port ( );
end Final_Project_tb;

architecture Behavioral of Final_Project_tb is

component Final_Project is
    Port ( A : in STD_LOGIC_VECTOR(15 downto 0);
           B : in STD_LOGIC_VECTOR(15 downto 0);
           mode : in STD_LOGIC;
           opcode : in STD_LOGIC_VECTOR(2 downto 0);
           ALU_out : out STD_LOGIC_VECTOR(15 downto 0);
           cout : out STD_LOGIC);
end component;
--Initialize signals
signal A :STD_LOGIC_VECTOR(15 downto 0);
signal B : STD_LOGIC_VECTOR(15 downto 0);
signal mode : STD_LOGIC;
signal opcode :  STD_LOGIC_VECTOR(2 downto 0);
signal ALU_out : STD_LOGIC_VECTOR(15 downto 0);
signal cout :  STD_LOGIC;           

begin

utt: Final_Project port map(A=>A,B=>B,mode=>mode,opcode=>opcode,ALU_out=>ALU_out,cout=>cout);
 
 
 process begin 
 A <= X"ffff"; -- Initialize A and B
 B <= X"0004"; -- 
 
    -- Test cases with carry in set to zero
 Mode <= '0';

-- Logical Operations

    -- A nor B
    opcode <= "000";
    wait for 100ns;
    -- A nand B
    opcode <= "001";
    wait for 100ns;
    --A or B
    opcode <= "010";
    wait for 100ns;
    --A and B
    opcode <= "011";
    wait for 100ns;
    --A xor B
    opcode <= "100";
    wait for 100ns;
    --A xnor B
    opcode <= "101";
    wait for 100ns;
    --Not A
    opcode <= "110";
    wait for 100ns;
    --Not B
    opcode <= "111";
    wait for 100ns;

--Arithmetic and Shift operations

Mode <='1';
    --Arithmetic
    -- A * B
    opcode <= "000";
    wait for 100ns;
    -- A + B
    opcode <= "001";
    wait for 100ns;
    --A - B
    opcode <= "010";
    wait for 100ns;
    --Increment A
    opcode <= "011";
    wait for 100ns;
    
    --Shift    
    --Shift Left(A,B)
    opcode <= "100";
    wait for 100ns;
    --Shift Right(A,B)
    opcode <= "101";
    wait for 100ns;
    --Rotate Left(A,B)
    opcode <= "110";
    wait for 100ns;
    --Rotate Right(A,B)
    opcode <= "111";
    wait for 100ns;
wait;
end process;
end Behavioral;
