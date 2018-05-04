library ieee;
use ieee.std_logic_1164.all;

entity Registers is
	port(
	clk: in std_logic;
	--reg_write: in std_logic; -- Control read/write

	read_register_1: in std_logic_vector(1 downto 0);
	read_register_2: in std_logic_vector(1 downto 0);
	write_register: in std_logic_vector(1 downto 0);
	--write_data : in std_logic_vector(1 downto 0);
	
	read_data_1: out std_logic_vector(1 downto 0);
	read_data_2: out std_logic_vector(1 downto 0)
	);
end Registers;

architecture behavioral of Registers is
begin
	process(clk)
	begin
		read_data_1 <= read_register_1;
		read_data_2 <= read_register_2;
	end process;
end behavioral;