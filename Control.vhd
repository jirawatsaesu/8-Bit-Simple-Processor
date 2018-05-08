library ieee;
use ieee.std_logic_1164.all;

entity Control is
  port(
    instr  : in std_logic_vector(1 downto 0);   -- instruction
    reg_wr : out std_logic;                     -- write control register
    alu_op : out std_logic_vector(1 downto 0)   -- operation code of AlU
  );
end Control;


architecture dataflow of Control is

begin
  with instr select
    reg_wr <= '1' when "00",    -- AND
              '1' when "01",    -- OR
              '1' when "10",    -- ADD
              '1' when "11";    -- SUB

  with instr select
    alu_op <= "00" when "00",   -- AND
              "01" when "01",   -- OR
              "10" when "10",   -- ADD
              "11" when "11";   -- SUB

end dataflow;