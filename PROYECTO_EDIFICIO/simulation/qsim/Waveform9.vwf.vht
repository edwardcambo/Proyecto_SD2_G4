-- Copyright (C) 2019  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "02/01/2024 11:33:52"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Comparador_16Bits
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Comparador_16Bits_vhd_vec_tst IS
END Comparador_16Bits_vhd_vec_tst;
ARCHITECTURE Comparador_16Bits_arch OF Comparador_16Bits_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL data_a : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL data_b : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL result : STD_LOGIC;
COMPONENT Comparador_16Bits
	PORT (
	data_a : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	data_b : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	result : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Comparador_16Bits
	PORT MAP (
-- list connections between master ports and signals
	data_a => data_a,
	data_b => data_b,
	result => result
	);
END Comparador_16Bits_arch;
