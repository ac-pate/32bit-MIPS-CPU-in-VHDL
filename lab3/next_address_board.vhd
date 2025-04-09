library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std;

entity next_address_board is
port (rt_in, rs_in		:in std_logic_vector(1 downto 0);
	pc_in			:in std_logic_vector(2 downto 0);
	target_address_in	:in std_logic_vector(2 downto 0);
	branch_type		:in std_logic_vector(1 downto 0);
	pc_sel			:in std_logic_vector(1 downto 0);
	next_pc_out		:out std_logic_vector(2 downto 0));
end next_address_board;

architecture behavior of next_address_board is
signal rt,rs,pc: std_logic_vector(31 downto 0);
signal target_address: std_logic_vector (25 downto 0);
signal next_pc:std_logic_vector(31 downto 0);

begin

add_port_map:entity work.next_address
	port map(
	rt=>rt,
	rs=>rs,
	branch_type=>branch_type,
	pc_sel=>pc_sel,
	pc=>pc,
	target_address=>target_address,
	next_pc=>next_pc);

rs(31 downto 2)<=(others=>'0');
rs(1 downto 0)<=rs_in(1)&rs_in(0);

rt(31 downto 2)<=(others=>'0');
rt(1 downto 0)<=rt_in(1)&rt_in(0);

pc(31 downto 3)<=(others=>'0');
pc(2 downto 0)<=pc_in(2)&pc_in(1)&pc_in(0);

target_address(25 downto 3)<=(others=>'0');
target_address(2 downto 0)<=target_address_in(2) & target_address_in(1) & target_address_in(0);


next_pc_out(2 downto 0)<=next_pc(2)&next_pc(1)&next_pc(0);

end behavior;
