library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity next_address is
port(rt,rs: in std_logic_vector(31 downto 0);
	pc: in std_logic_vector(31 downto 0);
	target_address	:in std_logic_vector(25 downto 0);
	branch_type	:in std_logic_vector(1 downto 0);
	pc_sel		:in std_logic_vector(1 downto 0);
	next_pc		:out std_logic_vector(31 downto 0));
end next_address;

architecture behav of next_address is
signal one: std_logic_vector(0 downto 0);
begin
one<="1";

process(rs,rt,branch_type,pc_sel,target_address)
variable temp_one,temp,beq,bne, bltz,PC_temp_out: std_logic_vector(31 downto 0);
begin
	temp_one:=std_logic_vector(resize(unsigned(one),32));
	temp:=std_logic_vector(resize(signed(target_address(15 downto 0)),32));

	if (rs=rt) then
		beq:=std_logic_vector(signed(temp_one)+signed(temp));
	else
		beq:=temp_one;
	end if;

	if (rs/=rt) then
		bne:=std_logic_vector(signed(temp_one)+signed(temp));
	else
		bne:=temp_one;
	end if;

	if (signed(rs)<0) then
		bltz:=std_logic_vector(signed(temp_one)+signed(temp));
	else
		bltz:=temp_one;
	end if;


	if (branch_type="00") then
		PC_temp_out:=std_logic_vector(resize(unsigned(one),32));
	elsif (branch_type="01") then
		PC_temp_out:=beq;
	elsif	(branch_type="10") then
		PC_temp_out:=bne;
	elsif	(branch_type="11") then
		PC_temp_out:=bltz;

	end if;

	if (pc_sel="00") then
		next_pc<=std_logic_vector(signed(pc)+signed(PC_temp_out));
	elsif (pc_sel="01") then
		next_pc<="000000"&target_address;
	elsif (pc_sel="10") then
		next_pc<=rs;
	elsif (pc_sel="11") then
		next_pc<=pc;
end if;
end process;

end behav;
