library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ALU is
	port(
		clk: in std_logic;
		op: in std_logic_vector(1 downto 0);
		
		operand_1: in std_logic_vector(1 downto 0);
		operand_2: in std_logic_vector(1 downto 0);
		carry_in: in std_logic_vector(1 downto 0);
		
		result: out std_logic_vector(1 downto 0)
		--carry_out: out std_logic
	);
end ALU;

architecture behavioral of ALU is
begin
	process(clk)
	begin
		if (op = "00") then
			result <= operand_1 and operand_2;
		elsif (op = "01") then
			result <= operand_1 or operand_2;
		elsif (op = "10") then
			result <= operand_1 + operand_2;
		elsif (op = "11") then
			result <= operand_1 - operand_2;
		end if;
	end process;
end behavioral;