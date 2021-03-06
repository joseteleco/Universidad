--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:18:24 10/19/2010
-- Design Name:   
-- Module Name:   C:/Universidad/2/ElectronicaDigital/practica3/practica3/prueba25.vhd
-- Project Name:  practica3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: entidad
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY prueba25 IS
END prueba25;
 
ARCHITECTURE behavior OF prueba25 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT entidad
    PORT(
         mclk : IN  std_logic;
         btn : IN  std_logic_vector(3 downto 0);
         swt : IN  std_logic_vector(7 downto 0);
         led : OUT  std_logic_vector(7 downto 0);
         an : OUT  std_logic_vector(3 downto 0);
         ssg : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal mclk : std_logic := '0';
   signal btn : std_logic_vector(3 downto 0) := (others => '0');
   signal swt : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal led : std_logic_vector(7 downto 0);
   signal an : std_logic_vector(3 downto 0);
   signal ssg : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant mclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entidad PORT MAP (
          mclk => mclk,
          btn => btn,
          swt => swt,
          led => led,
          an => an,
          ssg => ssg
        );

   -- Clock process definitions
   mclk_process :process
   begin
		mclk <= '0';
		wait for mclk_period/2;
		mclk <= '1';
		wait for mclk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for mclk_period*10;

      -- insert stimulus here 
		btn <= X0;
		wait for mclk_period*2;
		btn <= X1;
		wait for mclk_period*2;
		btn <= X2;
		wait for mclk_period*2;
		btn <= X3;
		wait for mclk_period*2;
		btn <= X4;
		wait for mclk_period*2;
		btn <= X5;
		wait for mclk_period*2;
		btn <= X6;
		wait for mclk_period*2;
		btn <= X7;
		wait for mclk_period*2;
		btn <= X8;
		wait for mclk_period*2;
		btn <= X9;
		wait for mclk_period*2;
		btn <= XA;
		wait for mclk_period*2;
		btn <= XB;
		wait for mclk_period*2;
		btn <= XC;
		wait for mclk_period*2;
		btn <= XD;
		wait for mclk_period*2;
		btn <= XE;
		wait for mclk_period*2;
		btn <= XF;
		
		
      wait;
   end process;

END;
