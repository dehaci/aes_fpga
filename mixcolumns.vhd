----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2018/05/10 14:38:05
-- Design Name: 
-- Module Name: mixcolumns - Behavioral
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

entity mixcolumns is
	port(
			clk : in std_logic;
			mixcolumns_in : in std_logic_vector(0 to 127);
			mixcolumns_out : out std_logic_vector(0 to 127)
		);
end mixcolumns;

architecture Behavioral of mixcolumns is
	function m2311(column : std_logic_vector) return std_logic_vector is
		variable temp : std_logic_vector(0 to 7) := "00000000";
		variable temp11 : std_logic_vector(0 to 7) := "00000000";
		variable temp22 : std_logic_vector(0 to 7) := "00000000";
		begin
			if column(0) = '1' then
				temp11 := (column(1 to 7) & column(0)) xor "00011010";
			else
				temp11 := column(1 to 7) & column(0);
			end if;

			if column(8) = '1' then
				temp22 := (column(9 to 15) & column(8)) xor "00011010" xor column(8 to 15);
			else 
				temp22 := (column(9 to 15) & column(8)) xor column(8 to 15);
			end if;

			temp := temp11 xor temp22 xor column(16 to 23) xor column(24 to 31);
			return temp;
	end m2311;

	function m1231(column : std_logic_vector) return std_logic_vector is
		variable temp : std_logic_vector(0 to 7) := "00000000";
		variable temp11 : std_logic_vector(0 to 7) := "00000000";
		variable temp22 : std_logic_vector(0 to 7) := "00000000";	
		begin
			if column(8) = '1' then
				temp11 := (column(9 to 15) & column(8)) xor "00011010";
			else
				temp11 := column(9 to 15) & column(8);
			end if;

			if column(16) = '1' then
				temp22 := (column(17 to 23) & column(16)) xor "00011010" xor column(16 to 23);
			else 
				temp22 := (column(17 to 23) & column(16)) xor column(16 to 23);
			end if;		

			temp := temp11 xor temp22 xor column(0 to 7) xor column(24 to 31);
			return temp;
	end m1231;

	function m1123(column : std_logic_vector) return std_logic_vector is
		variable temp : std_logic_vector(0 to 7) := "00000000";
		variable temp11 : std_logic_vector(0 to 7) := "00000000";
		variable temp22 : std_logic_vector(0 to 7) := "00000000";
		begin
			if column(16) = '1' then
				temp11 := (column(17 to 23) & column(16)) xor "00011010";
			else
				temp11 := column(17 to 23) & column(16);
			end if;

			if column(24) = '1' then
				temp22 := (column(25 to 31) & column(24)) xor "00011010" xor column(24 to 31);
			else 
				temp22 := (column(25 to 31) & column(24)) xor column(24 to 31);
			end if;		

			temp := temp11 xor temp22 xor column(0 to 7) xor column(8 to 15);
			return temp;
	end m1123;

	function m3112(column : std_logic_vector) return std_logic_vector is
		variable temp : std_logic_vector(0 to 7) := "00000000";
		variable temp11 : std_logic_vector(0 to 7) := "00000000";
		variable temp22 : std_logic_vector(0 to 7) := "00000000";
		begin
			if column(24) = '1' then
				temp11 := (column(25 to 31) & column(24)) xor "00011010";
			else
				temp11 := column(25 to 31) & column(24);
			end if;

			if column(0) = '1' then
				temp22 := (column(1 to 7) & column(0)) xor "00011010" xor column(0 to 7);
			else 
				temp22 := (column(1 to 7) & column(0)) xor column(0 to 7);
			end if;		

			temp := temp11 xor temp22 xor column(8 to 15) xor column(16 to 23);
			return temp;
	end m3112;

begin
	process(clk)
		variable temp1 : std_logic_vector(0 to 31) := (others => '0');
		variable temp2 : std_logic_vector(0 to 31) := (others => '0');
		variable temp3 : std_logic_vector(0 to 31) := (others => '0');
		variable temp4 : std_logic_vector(0 to 31) := (others => '0');
		variable temp11 : std_logic_vector(0 to 31) := (others => '0');
		variable temp22 : std_logic_vector(0 to 31) := (others => '0');
		variable temp33 : std_logic_vector(0 to 31) := (others => '0');
		variable temp44 : std_logic_vector(0 to 31) := (others => '0');
		begin
			if rising_edge(clk) then
				temp11 := mixcolumns_in(0 to 31);
				temp22 := mixcolumns_in(32 to 63);
				temp33 := mixcolumns_in(64 to 95);
				temp44 := mixcolumns_in(96 to 127);
				temp1 := m2311(temp11) & m1231(temp11) & m1123(temp11) & m3112(temp11);
				temp2 := m2311(temp22) & m1231(temp22) & m1123(temp22) & m3112(temp22);
				temp3 := m2311(temp33) & m1231(temp33) & m1123(temp33) & m3112(temp33);
				temp4 := m2311(temp44) & m1231(temp44) & m1123(temp44) & m3112(temp44);
				mixcolumns_out <= temp1 & temp2 & temp3 & temp4;
			end if;
	end process;

end Behavioral;
