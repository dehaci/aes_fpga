----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2018/05/05 21:59:18
-- Design Name: 
-- Module Name: shiftrows - Behavioral
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

entity shiftrows is
	port(
			clk : in std_logic;
			shiftrows_in : in std_logic_vector(0 to 127);

			shiftrows_out : out std_logic_vector(0 to 127)
		);
end shiftrows;

architecture Behavioral of shiftrows is

begin
	process(clk)
		variable temp : std_logic_vector(0 to 127) := (others => '0');
		begin
			if rising_edge(clk) then
				temp(0 to 7) := shiftrows_in(0 to 7);
				temp(8 to 15) := shiftrows_in(40 to 47);
				temp(16 to 23) := shiftrows_in(80 to 87);
				temp(24 to 31) := shiftrows_in(120 to 127);
				temp(32 to 39) := shiftrows_in(32 to 39);
				temp(40 to 47) := shiftrows_in(72 to 79);
				temp(48 to 55) := shiftrows_in(112 to 119);
				temp(56 to 63) := shiftrows_in(24 to 31);
				temp(64 to 71) := shiftrows_in(64 to 71);
				temp(72 to 79) := shiftrows_in(104 to 111);
				temp(80 to 87) := shiftrows_in(16 to 23);
				temp(88 to 95) := shiftrows_in(56 to 63);
				temp(96 to 103) := shiftrows_in(96 to 103);
				temp(104 to 111) := shiftrows_in(8 to 15);
				temp(112 to 119) := shiftrows_in(48 to 55);
				temp(120 to 127) := shiftrows_in(88 to 95);
				shiftrows_out <= temp;
			end if;
	end process;


end Behavioral;
