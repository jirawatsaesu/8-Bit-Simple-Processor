library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity PC is
  port(
    clk        : in std_logic;
    instr_addr : out std_logic_vector(1 downto 0)   -- instruction address
  );
end PC;


architecture behavioral of PC is

  signal num : std_logic_vector(1 downto 0) := "00";

begin
  process(clk)
  begin
    if rising_edge(clk) then
      if (num = "11") then
        num <= num;
      else
        num <= num + "01";
      end if;
    end if;
  end process;

  instr_addr <= num;

end behavioral;