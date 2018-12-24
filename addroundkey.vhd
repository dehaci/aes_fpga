----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2018/05/10 14:38:21
-- Design Name: 
-- Module Name: addroundkey - Behavioral
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

entity addroundkey is
	port(
			clk : in std_logic;
			addroundkey_in : in std_logic_vector(0 to 127);
			roundkey_in : in std_logic_vector(0 to 127);
	
			addroundkey_out : out std_logic_vector(0 to 127)
	);
end addroundkey;

architecture Behavioral of addroundkey is

begin
	process(clk)
		begin
			if rising_edge(clk) then
				addroundkey_out <= addroundkey_in xor roundkey_in;
			end if;
	end process;


end Behavioral;
