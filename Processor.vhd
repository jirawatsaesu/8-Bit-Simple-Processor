-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II 64-Bit"
-- VERSION		"Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"
-- CREATED		"Wed May 09 06:25:42 2018"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Processor IS 
	PORT
	(
		clk :  IN  STD_LOGIC;
		write_en :  OUT  STD_LOGIC;
		alu_src :  OUT  STD_LOGIC;
		reg_dst :  OUT  STD_LOGIC;
		alu_op :  OUT  STD_LOGIC_VECTOR(1 DOWNTO 0);
		current_instruction :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0);
		next_instruction :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0);
		op_code :  OUT  STD_LOGIC_VECTOR(1 DOWNTO 0);
		rd_address :  OUT  STD_LOGIC_VECTOR(1 DOWNTO 0);
		rd_value :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		rs_address :  OUT  STD_LOGIC_VECTOR(1 DOWNTO 0);
		rs_value :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		rt_address :  OUT  STD_LOGIC_VECTOR(1 DOWNTO 0);
		rt_value :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END Processor;

ARCHITECTURE bdf_type OF Processor IS 

COMPONENT alu
	PORT(op : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 rs : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 rt : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 rd : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT control
	PORT(instr : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 reg_wr : OUT STD_LOGIC;
		 alu_src : OUT STD_LOGIC;
		 reg_dst : OUT STD_LOGIC;
		 alu_op : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

COMPONENT instruction
	PORT(instr_addr : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 op : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 rd_addr : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 rs_addr : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 rt_addr : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mux0
	PORT(sel : IN STD_LOGIC;
		 a : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 b : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 y : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mux1
	PORT(sel : IN STD_LOGIC;
		 a : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 b : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 y : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT pc
	PORT(clk : IN STD_LOGIC;
		 current_instr : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 next_instr : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;

COMPONENT registers
	PORT(clk : IN STD_LOGIC;
		 wr : IN STD_LOGIC;
		 rd_addr : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 rs_addr : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 rt_addr : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 wr_data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 rs : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 rt : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT sign_extend
	PORT(data_in : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 data_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_21 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_22 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN 
write_en <= SYNTHESIZED_WIRE_12;
alu_src <= SYNTHESIZED_WIRE_8;
reg_dst <= SYNTHESIZED_WIRE_5;
alu_op <= SYNTHESIZED_WIRE_0;
current_instruction <= SYNTHESIZED_WIRE_20;
next_instruction <= SYNTHESIZED_WIRE_20;
op_code <= SYNTHESIZED_WIRE_3;
rd_address <= SYNTHESIZED_WIRE_22;
rd_value <= SYNTHESIZED_WIRE_16;
rs_address <= SYNTHESIZED_WIRE_21;
rs_value <= SYNTHESIZED_WIRE_1;
rt_address <= SYNTHESIZED_WIRE_21;
rt_value <= SYNTHESIZED_WIRE_9;



b2v_arithmetic_logic_unit : alu
PORT MAP(op => SYNTHESIZED_WIRE_0,
		 rs => SYNTHESIZED_WIRE_1,
		 rt => SYNTHESIZED_WIRE_2,
		 rd => SYNTHESIZED_WIRE_16);


b2v_control_unit : control
PORT MAP(instr => SYNTHESIZED_WIRE_3,
		 reg_wr => SYNTHESIZED_WIRE_12,
		 alu_src => SYNTHESIZED_WIRE_8,
		 reg_dst => SYNTHESIZED_WIRE_5,
		 alu_op => SYNTHESIZED_WIRE_0);


b2v_instruction_memory : instruction
PORT MAP(instr_addr => SYNTHESIZED_WIRE_20,
		 op => SYNTHESIZED_WIRE_3,
		 rd_addr => SYNTHESIZED_WIRE_22,
		 rs_addr => SYNTHESIZED_WIRE_14,
		 rt_addr => SYNTHESIZED_WIRE_21);


b2v_mux0 : mux0
PORT MAP(sel => SYNTHESIZED_WIRE_5,
		 a => SYNTHESIZED_WIRE_21,
		 b => SYNTHESIZED_WIRE_22,
		 y => SYNTHESIZED_WIRE_13);


b2v_mux1 : mux1
PORT MAP(sel => SYNTHESIZED_WIRE_8,
		 a => SYNTHESIZED_WIRE_9,
		 b => SYNTHESIZED_WIRE_10,
		 y => SYNTHESIZED_WIRE_2);


b2v_program_counter : pc
PORT MAP(clk => clk,
		 current_instr => SYNTHESIZED_WIRE_20,
		 next_instr => SYNTHESIZED_WIRE_20);


b2v_registers_file : registers
PORT MAP(clk => clk,
		 wr => SYNTHESIZED_WIRE_12,
		 rd_addr => SYNTHESIZED_WIRE_13,
		 rs_addr => SYNTHESIZED_WIRE_14,
		 rt_addr => SYNTHESIZED_WIRE_21,
		 wr_data => SYNTHESIZED_WIRE_16,
		 rs => SYNTHESIZED_WIRE_1,
		 rt => SYNTHESIZED_WIRE_9);


b2v_sign_extend : sign_extend
PORT MAP(data_in => SYNTHESIZED_WIRE_22,
		 data_out => SYNTHESIZED_WIRE_10);


END bdf_type;