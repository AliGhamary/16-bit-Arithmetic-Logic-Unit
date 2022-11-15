----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/23/2021 03:30:40 PM
-- Design Name: 
-- Module Name: ArithmeticUnit - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ArithmeticUnit is
    Port ( A : in STD_LOGIC_VECTOR(15 downto 0);
           B : in STD_LOGIC_VECTOR(15 downto 0);
           op_sel : in STD_LOGIC_VECTOR(1 downto 0);
           arith_out : out STD_LOGIC_VECTOR(15 downto 0);
           cout : out STD_LOGIC);
end ArithmeticUnit;

architecture Behavioral of ArithmeticUnit is
signal temp:std_logic_vector(16 downto 0);
--signal temp2: integer;
begin 

arith_out<=std_logic_vector(to_unsigned((to_integer(unsigned(A(7 downto 0)))*to_integer(unsigned(B(7 downto 0)))),16))
               when(op_sel="00") else --A*B
           A+B when(op_sel="01") else -- A+B
           A-B when(op_sel="10") else --A-B
           A+1 when(op_sel="11");--Increment A
           
cout<='1' when ((A+B<A or A+B<B) and op_sel="01") else --Check if carry for addition 
    '1' when ((A+1<A) and op_sel="11") else --check carry for increment
    '0';

end Behavioral;