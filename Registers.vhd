library ieee;
use ieee.std_logic_1164.all;

entity Registers is
  port(
    clk     : in std_logic;
    wr      : in std_logic;                       -- write register control

    rs_addr : in std_logic_vector(1 downto 0);    -- source register 1 address
    rt_addr : in std_logic_vector(1 downto 0);    -- source register 2 address
    rd_addr : in std_logic_vector(1 downto 0);    -- destination register address
    wr_data : in std_logic_vector(7 downto 0);    -- write data to destination register

    rs      : out std_logic_vector(7 downto 0);   -- source register 1
    rt      : out std_logic_vector(7 downto 0)    -- source register 2
  );
end Registers;


architecture behavioral of Registers is

begin
  process(clk)
  begin
  end process;

end behavioral;