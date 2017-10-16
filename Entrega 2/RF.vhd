library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity RF is
    Port ( rs1 : in  STD_LOGIC_VECTOR (5 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (5 downto 0);
           rd : in  STD_LOGIC_VECTOR (5 downto 0);
           DWR : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
           Crs1 : out  STD_LOGIC_VECTOR (31 downto 0):=(others=>'0');
           Crs2 : out  STD_LOGIC_VECTOR (31 downto 0):=(others=>'0'));
end RF;

architecture Behavioral of RF is

type ram_type is array (63 downto 0) of std_logic_vector (31 downto 0);
signal RAM: ram_type:=(others => "00000000000000000000000000000000");

--registro g0 siempre es cero

begin
process (rs1,rs2,rd,DWR,rst,RAM)
begin
if rst='0' then
	if rd >"00000" then
		RAM(conv_integer(rd)) <= DWR;
	end if;
	Crs1<=RAM(conv_integer(rs1));
	Crs2<=RAM(conv_integer(rs2));
else
	RAM<=(others=>"00000000000000000000000000000000");
	Crs1<=(others=>'0');
	Crs2<=(others=>'0');
end if;
end process;

end Behavioral;