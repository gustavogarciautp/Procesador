library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC is
    Port ( rst : in  STD_LOGIC;
           dataIn : in  STD_LOGIC_VECTOR (31 downto 0);
           CLK : in  STD_LOGIC;
           DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end PC;


architecture Behavioral of PC is


begin
process(CLK,dataIn,rst)
begin
if rst='1' then
	DataOut<=(others=>'0');
elsif rising_edge(CLK) then
	DataOut<=dataIn;
	
	end if;
end process;



end Behavioral;

