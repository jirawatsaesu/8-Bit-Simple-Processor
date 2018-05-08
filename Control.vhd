library ieee;
use ieee.std_logic_1164.all;

entity Control is
  port(
    instr  : in std_logic_vector(2 downto 0);   -- instruction
    reg_wr : out std_logic;                     -- write control register
    alu_op : out std_logic_vector(1 downto 0)   -- operation code of AlU
  );
end Control;


architecture dataflow of Control is

begin
  with instr select
    reg_wr <= '1' when "000",    -- AND
              '1' when "001",    -- OR
              '1' when "010",    -- ADD
              '1' when "011",    -- SUB
              '0' when others;

  with instr select
    alu_op <= "00" when "000",   -- AND
              "01" when "001",   -- OR
              "10" when "010",   -- ADD
              "11" when "011",   -- SUB
              "10" when others;  -- ADD

end dataflow;