library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity nPC is
    Port ( rst : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           DataIn : in  STD_LOGIC_VECTOR (31 downto 0);
           DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end nPC;

architecture Behavioral of nPC is

begin
process(CLK,DataIn,rst)
begin

if rst='1' then
	DataOut<=(others=>'0');
elsif rising_edge(CLK) then
	DataOut<=DataIn;
end if;

end process;

end Behavioral;

