library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity regfile is
port(   din : in std_logic_vector(31 downto 0);
	reset : in std_logic;
	clk : in std_logic;
	write : in std_logic;
	read_a : in std_logic_vector(4 downto 0);
	read_b : in std_logic_vector(4 downto 0);
	write_address : in std_logic_vector(4 downto 0);
	out_a : out std_logic_vector(31 downto 0);
	out_b : out std_logic_vector(31 downto 0) );
end regfile ;

architecture Behavioral of regfile is 

	-- register array (32 registers x 32 bits each)	
	type reg_file_type is array(0 to 31) of std_logic_vector(31 downto 0);

	signal array_reg : reg_file_type;

begin

	process(clk, reset, write)
	begin 
		if reset = '1' then
			for i in array_reg'range loop
				array_reg(i) <= (others =>'0');
			end loop;
		elsif rising_edge(clk) and (write = '1') then 
			array_reg(to_integer(unsigned(write_address))) <= din;
		end if;
	end process;

	--read port 
	out_a <= array_reg(to_integer(unsigned(read_a)));
	out_b <= array_reg(to_integer(unsigned(read_b)));



end Behavioral;
