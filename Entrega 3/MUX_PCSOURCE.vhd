library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_PCSOURCE is
    Port ( PCdisp30 : in  STD_LOGIC_VECTOR (31 downto 0);
           PCSEUdisp22 : in  STD_LOGIC_VECTOR (31 downto 0);
           ALURESULT : in  STD_LOGIC_VECTOR (31 downto 0);
           PC : in STD_LOGIC_VECTOR(31 downto 0);
			  PCSOURCE : in  STD_LOGIC_VECTOR (1 downto 0);
           nPC : out  STD_LOGIC_VECTOR (31 downto 0));
end MUX_PCSOURCE;

architecture Behavioral of MUX_PCSOURCE is

begin

process(PC,PCdisp30,PCSEUdisp22,ALURESULT,PCSOURCE)

begin

case PCSOURCE is
	when "00"=>nPC<=PCdisp30;
	when "01"=>nPC<=PCSEUdisp22;
	when "10"=>nPC<=PC;
	when others=>nPC<=ALURESULT;--11
end case;
end process;


end Behavioral;

