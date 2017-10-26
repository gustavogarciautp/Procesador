library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_RFDEST is
    Port ( RD : in  STD_LOGIC_VECTOR (5 downto 0);
           RFDEST : in  STD_LOGIC;
           nRD : out  STD_LOGIC_VECTOR (5 downto 0));
end MUX_RFDEST;

architecture Behavioral of MUX_RFDEST is

begin
process(RD,RFDEST)
begin
if RFDEST='1' then
	nRD<="001111";
else
	nRD<=RD;
end if;
end process;

end Behavioral;

