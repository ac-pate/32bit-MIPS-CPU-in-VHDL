library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity regfile is
port(   din : in std_logic_vector(3 downto 0);
	reset : in std_logic;
	clk : in std_logic;
	write : in std_logic;
	read_a : in std_logic_vector(3 downto 0);
	read_b : in std_logic_vector(3 downto 0);
	write_address : in std_logic_vector(3 downto 0);
	out_a : out std_logic_vector(3 downto 0);
	out_b : out std_logic_vector(3 downto 0) );
end regfile ;

architecture Behavioral of regfile is 

	-- register array (32 registers x 32 bits each)	
	type reg_file_type is array(0 to 31) of std_logic_vector(31 downto 0);

	signal array_reg : reg_file_type;
	signal d : std_logic_vector(31 downto 0);


begin
	-- assign port inputs to internal signals x and y
	d(3 downto 0) <= din(3) & din(2) & din(1) & din(0);
	d(31 downto 4) <= (others => '0');

	process(clk, reset, write)
	begin 
		if reset = '1' then
			for i in array_reg'range loop
				array_reg(i) <= (others =>'0');
			end loop;
		elsif rising_edge(clk) and (write = '1') then 
			array_reg(to_integer(unsigned(write_address))) <= d;
		end if;
	end process;

	-- asynchronous read

	process(read_a, read_b, array_reg)
	variable temp : std_logic_vector(31 downto 0);
	begin	
		temp := array_reg(to_integer(unsigned(read_a)));
		out_a <= temp(3) & temp(2) & temp(1) & temp(0);

		temp := array_reg(to_integer(unsigned(read_b)));
		out_b <= temp(3) & temp(2) & temp(1) & temp(0);
	end process;


end Behavioral;
