----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2018/05/10 22:44:06
-- Design Name: 
-- Module Name: round6 - Behavioral
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

entity round6 is
	port(
			clk : in std_logic;
			round6_in : in std_logic_vector(0 to 127);
			round6_key : in std_logic_vector(0 to 127);

			round6_out : out std_logic_vector(0 to 127)
		);
end round6;

architecture Behavioral of round6 is
	component subbytes
		port(
				clk : in std_logic;
				subbytes_in : in std_logic_vector(0 to 127);
	
				subbytes_out : out std_logic_vector(0 to 127)
			);
	end component;
	component shiftrows
		port(
				clk : in std_logic;
				shiftrows_in : in std_logic_vector(0 to 127);
	
				shiftrows_out : out std_logic_vector(0 to 127)
			);
	end component;
	component mixcolumns
		port(
				clk : in std_logic;
				mixcolumns_in : in std_logic_vector(0 to 127);

				mixcolumns_out : out std_logic_vector(0 to 127)
			);
	end component;
	component addroundkey
		port(
				clk : in std_logic;
				addroundkey_in : in std_logic_vector(0 to 127);
				roundkey_in : in std_logic_vector(0 to 127);
		
				addroundkey_out : out std_logic_vector(0 to 127)
		);
	end component;
	signal sub_to_shift : std_logic_vector(0 to 127);
	signal shift_to_mix : std_logic_vector(0 to 127);
	signal mix_to_add : std_logic_vector(0 to 127);
begin
	sub : subbytes port map(clk => clk, subbytes_in => round6_in, subbytes_out => sub_to_shift);
	shift : shiftrows port map(clk => clk, shiftrows_in => sub_to_shift, shiftrows_out => shift_to_mix);
	mix : mixcolumns port map(clk => clk, mixcolumns_in => shift_to_mix, mixcolumns_out => mix_to_add);
	add : addroundkey port map(clk => clk, addroundkey_in => mix_to_add, roundkey_in => round6_key, addroundkey_out => round6_out);
end Behavioral;
