library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_RFSOURCE is
    Port ( RFSOURCE : in  STD_LOGIC_VECTOR (1 downto 0);
           DATATOMEM : in  STD_LOGIC_VECTOR (31 downto 0);
           ALURESULT : in  STD_LOGIC_VECTOR (31 downto 0);
           PC : in  STD_LOGIC_VECTOR (31 downto 0);
           DATATOREG : out  STD_LOGIC_VECTOR (31 downto 0));
end MUX_RFSOURCE;

architecture Behavioral of MUX_RFSOURCE is

begin
process(RFSOURCE,DATATOMEM,ALURESULT)
begin
case RFSOURCE is
	when "00"=>DATATOREG<=DATATOMEM;
	when "01"=>DATATOREG<=ALURESULT;
	when "10"=>DATATOREG<=PC;
	when others=>DATATOREG<=(others=>'0');
end case;
end process;


end Behavioral;

