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
-- Generated on "02/01/2024 16:12:21"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          MSS2
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY MSS2_vhd_vec_tst IS
END MSS2_vhd_vec_tst;
ARCHITECTURE MSS2_arch OF MSS2_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL Clock : STD_LOGIC;
SIGNAL enCont : STD_LOGIC;
SIGNAL enReg1 : STD_LOGIC;
SIGNAL enReg2 : STD_LOGIC;
SIGNAL enReg3 : STD_LOGIC;
SIGNAL estados : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL hora : STD_LOGIC;
SIGNAL igual_a_24 : STD_LOGIC;
SIGNAL modo : STD_LOGIC;
SIGNAL Reset : STD_LOGIC;
SIGNAL resetCont : STD_LOGIC;
SIGNAL start : STD_LOGIC;
COMPONENT MSS2
	PORT (
	Clock : IN STD_LOGIC;
	enCont : OUT STD_LOGIC;
	enReg1 : OUT STD_LOGIC;
	enReg2 : OUT STD_LOGIC;
	enReg3 : OUT STD_LOGIC;
	estados : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	hora : IN STD_LOGIC;
	igual_a_24 : IN STD_LOGIC;
	modo : OUT STD_LOGIC;
	Reset : IN STD_LOGIC;
	resetCont : OUT STD_LOGIC;
	start : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : MSS2
	PORT MAP (
-- list connections between master ports and signals
	Clock => Clock,
	enCont => enCont,
	enReg1 => enReg1,
	enReg2 => enReg2,
	enReg3 => enReg3,
	estados => estados,
	hora => hora,
	igual_a_24 => igual_a_24,
	modo => modo,
	Reset => Reset,
	resetCont => resetCont,
	start => start
	);

-- Clock
t_prcs_Clock: PROCESS
BEGIN
LOOP
	Clock <= '0';
	WAIT FOR 10000 ps;
	Clock <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_Clock;

-- hora
t_prcs_hora: PROCESS
BEGIN
	FOR i IN 1 TO 33
	LOOP
		hora <= '0';
		WAIT FOR 15000 ps;
		hora <= '1';
		WAIT FOR 15000 ps;
	END LOOP;
	hora <= '0';
WAIT;
END PROCESS t_prcs_hora;

-- igual_a_24
t_prcs_igual_a_24: PROCESS
BEGIN
	igual_a_24 <= '0';
	WAIT FOR 70000 ps;
	igual_a_24 <= '1';
	WAIT FOR 40000 ps;
	igual_a_24 <= '0';
	WAIT FOR 150000 ps;
	igual_a_24 <= '1';
	WAIT FOR 70000 ps;
	igual_a_24 <= '0';
	WAIT FOR 130000 ps;
	igual_a_24 <= '1';
	WAIT FOR 70000 ps;
	igual_a_24 <= '0';
WAIT;
END PROCESS t_prcs_igual_a_24;

-- Reset
t_prcs_Reset: PROCESS
BEGIN
	Reset <= '1';
WAIT;
END PROCESS t_prcs_Reset;

-- start
t_prcs_start: PROCESS
BEGIN
	start <= '0';
	WAIT FOR 40000 ps;
	start <= '1';
	WAIT FOR 20000 ps;
	start <= '0';
	WAIT FOR 730000 ps;
	start <= '1';
	WAIT FOR 20000 ps;
	start <= '0';
WAIT;
END PROCESS t_prcs_start;
END MSS2_arch;
