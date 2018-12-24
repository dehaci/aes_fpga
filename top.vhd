----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2018/05/10 21:49:51
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
	port(
			clk : in std_logic;
			run : in std_logic;
			plaintext : in std_logic_vector(127 downto 0);
			key : in std_logic_vector(127 downto 0);
			ciphertext : out std_logic_vector(127 downto 0) := (others => '0');
			done : out std_logic := '0'
		);
end top;

architecture Behavioral of top is
	signal plaintext_real : std_logic_vector(0 to 127);
	signal key_real : std_logic_vector(0 to 127);
	component keyexpansion
		port(
			clk : in std_logic;
			original_key : in std_logic_vector(0 to 127);

			round0 : out std_logic_vector(0 to 127);
			round1 : out std_logic_vector(0 to 127);
			round2 : out std_logic_vector(0 to 127);
			round3 : out std_logic_vector(0 to 127);
			round4 : out std_logic_vector(0 to 127);
			round5 : out std_logic_vector(0 to 127);
			round6 : out std_logic_vector(0 to 127);
			round7 : out std_logic_vector(0 to 127);
			round8 : out std_logic_vector(0 to 127);
			round9 : out std_logic_vector(0 to 127);
			round10 : out std_logic_vector(0 to 127)
		);	
	end component;
	component round0
		port(
			clk : in std_logic;
			round0_in : in std_logic_vector(0 to 127);
			round0_key : in std_logic_vector(0 to 127);

			round0_out : out std_logic_vector(0 to 127)
		);
	end component;

	component round1
		port(
			clk : in std_logic;
			round1_in : in std_logic_vector(0 to 127);
			round1_key : in std_logic_vector(0 to 127);

			round1_out : out std_logic_vector(0 to 127)
		);
	end component;
	
	component round2
		port(
			clk : in std_logic;
			round2_in : in std_logic_vector(0 to 127);
			round2_key : in std_logic_vector(0 to 127);

			round2_out : out std_logic_vector(0 to 127)
		);
	end component;

	component round3
		port(
			clk : in std_logic;
			round3_in : in std_logic_vector(0 to 127);
			round3_key : in std_logic_vector(0 to 127);

			round3_out : out std_logic_vector(0 to 127)
		);
	end component;

	component round4
		port(
			clk : in std_logic;
			round4_in : in std_logic_vector(0 to 127);
			round4_key : in std_logic_vector(0 to 127);

			round4_out : out std_logic_vector(0 to 127)
		);
	end component;

	component round5
		port(
			clk : in std_logic;
			round5_in : in std_logic_vector(0 to 127);
			round5_key : in std_logic_vector(0 to 127);

			round5_out : out std_logic_vector(0 to 127)
		);
	end component;

	component round6
		port(
			clk : in std_logic;
			round6_in : in std_logic_vector(0 to 127);
			round6_key : in std_logic_vector(0 to 127);

			round6_out : out std_logic_vector(0 to 127)
		);
	end component;

	component round7
		port(
			clk : in std_logic;
			round7_in : in std_logic_vector(0 to 127);
			round7_key : in std_logic_vector(0 to 127);

			round7_out : out std_logic_vector(0 to 127)
		);
	end component;

	component round8
		port(
			clk : in std_logic;
			round8_in : in std_logic_vector(0 to 127);
			round8_key : in std_logic_vector(0 to 127);

			round8_out : out std_logic_vector(0 to 127)
		);
	end component;

	component round9
		port(
			clk : in std_logic;
			round9_in : in std_logic_vector(0 to 127);
			round9_key : in std_logic_vector(0 to 127);

			round9_out : out std_logic_vector(0 to 127)
		);
	end component;

	component round10
		port(
			clk : in std_logic;
			round10_in : in std_logic_vector(0 to 127);
			round10_key : in std_logic_vector(0 to 127);

			round10_out : out std_logic_vector(0 to 127)
		);
	end component;
	signal sig01 : std_logic_vector(0 to 127);
	signal sig12 : std_logic_vector(0 to 127);
	signal sig23 : std_logic_vector(0 to 127);
	signal sig34 : std_logic_vector(0 to 127);
	signal sig45 : std_logic_vector(0 to 127);
	signal sig56 : std_logic_vector(0 to 127);
	signal sig67 : std_logic_vector(0 to 127);
	signal sig78 : std_logic_vector(0 to 127);
	signal sig89 : std_logic_vector(0 to 127);
	signal sig910 : std_logic_vector(0 to 127);
	signal cipher_temp : std_logic_vector(0 to 127);
	signal round0_key : std_logic_vector(0 to 127);
	signal round1_key : std_logic_vector(0 to 127);
	signal round2_key : std_logic_vector(0 to 127);
	signal round3_key : std_logic_vector(0 to 127);
	signal round4_key : std_logic_vector(0 to 127);
	signal round5_key : std_logic_vector(0 to 127);
	signal round6_key : std_logic_vector(0 to 127);
	signal round7_key : std_logic_vector(0 to 127);
	signal round8_key : std_logic_vector(0 to 127);
	signal round9_key : std_logic_vector(0 to 127);
	signal round10_key : std_logic_vector(0 to 127);
	begin
		expansion : keyexpansion port map(	 clk => clk,
										  	 round0 => round0_key, round1 => round1_key,
										  	 round2 => round2_key, round3 => round3_key,
										  	 round4 => round4_key, round5 => round5_key,
										  	 round6 => round6_key, round7 => round7_key,
										  	 round8 => round8_key, round9 => round9_key,
										  	 round10 => round10_key,
										  	 original_key => key_real
										 );
		r0 : round0 port map(clk => clk, round0_in => plaintext_real, round0_key => round0_key, round0_out => sig01);
		r1 : round1 port map(clk => clk, round1_in => sig01, round1_key => round1_key, round1_out => sig12);
		r2 : round2 port map(clk => clk, round2_in => sig12, round2_key => round2_key, round2_out => sig23);
		r3 : round3 port map(clk => clk, round3_in => sig23, round3_key => round3_key, round3_out => sig34);
		r4 : round4 port map(clk => clk, round4_in => sig34, round4_key => round4_key, round4_out => sig45);
		r5 : round5 port map(clk => clk, round5_in => sig45, round5_key => round5_key, round5_out => sig56);
		r6 : round6 port map(clk => clk, round6_in => sig56, round6_key => round6_key, round6_out => sig67);
		r7 : round7 port map(clk => clk, round7_in => sig67, round7_key => round7_key, round7_out => sig78);
		r8 : round8 port map(clk => clk, round8_in => sig78, round8_key => round8_key, round8_out => sig89);
		r9 : round9 port map(clk => clk, round9_in => sig89, round9_key => round9_key, round9_out => sig910);
		r10 : round10 port map(clk => clk, round10_in => sig910, round10_key => round10_key, round10_out => cipher_temp);
		process(run)
		begin
			if run = '1' then
				plaintext_real <= plaintext(127 downto 0);
				key_real <= key(127 downto 0);
			else
			end if;
		end process;
		process(clk)
		    variable counter : integer := 0;
		    variable temp : std_logic_vector(0 to 127) := (others => '0');
		    variable run_temp : std_logic := '0';
		    begin
		        if rising_edge(clk) then
		        	if run = '1' then
		        		run_temp := '1';
		        		done <= '0';
		        	else
		            end if;

		        	if run_temp = '1' then 
			        	counter := counter + 1;
			        	if counter = 1 then
			        		temp := cipher_temp;
			        	elsif counter = 60 then
			        		if cipher_temp = temp then
			        			ciphertext <= cipher_temp(0 to 127);
			        			done <= '1';
			        			run_temp := '0';
			        		else
			        			--ciphertext <= (others => '0');
			        		end if;
			        		counter := 0;
			        	elsif counter < 60 then
			        		counter := counter + 1;
			        	end if;
			        else
			        end if;
		        end if;
		end process;
end Behavioral;
