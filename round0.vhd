----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2018/05/10 22:43:01
-- Design Name: 
-- Module Name: round0 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity round0 is
	port(
			clk : in std_logic;
			round0_in : in std_logic_vector(0 to 127);
			round0_key : in std_logic_vector(0 to 127);

			round0_out : out std_logic_vector(0 to 127)
		);
end round0;

architecture Behavioral of round0 is
	component addroundkey
		port(
			clk : in std_logic;
			addroundkey_in : in std_logic_vector(0 to 127);
			roundkey_in : in std_logic_vector(0 to 127);
	
			addroundkey_out : out std_logic_vector(0 to 127)
	);
	end component;
	begin
		m0 : addroundkey port map(clk => clk, addroundkey_in => round0_in, roundkey_in => round0_key, addroundkey_out => round0_out);
end Behavioral;
