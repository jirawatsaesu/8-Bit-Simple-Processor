library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ALU is
  port(
    op  : in std_logic_vector(1 downto 0);   -- operation code

    rs  : in std_logic_vector(7 downto 0);   -- source register 1
    rt  : in std_logic_vector(7 downto 0);   -- source register 2

    rd  : out std_logic_vector(7 downto 0)   -- destination register
  );
end ALU;


architecture behavioral of ALU is

begin
  process(op, rs, rt)
  begin
    if (op = "00") then      -- AND Gate
      rd <= rs and rt;
    elsif (op = "01") then   -- OR Gate
      rd <= rs or rt;
    elsif (op = "10") then   -- ADD
      rd <= rs + rt;
    elsif (op = "11") then   -- SUB
      rd <= rs - rt;
    end if;
  end process;

end behavioral;