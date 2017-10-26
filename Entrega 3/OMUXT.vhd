library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OMUXT is
    Port ( Crs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           SEUimm: in  STD_LOGIC_VECTOR (31 downto 0);
           i : in  STD_LOGIC;
           oper2 : out  STD_LOGIC_VECTOR (31 downto 0));
end OMUXT;

architecture Behavioral of OMUXT is

begin

process(Crs2,SEUimm,i)

begin

if i='0' then
	Oper2<=Crs2;
else
	Oper2<=SEUimm;

end if;
	
end process;

end Behavioral;