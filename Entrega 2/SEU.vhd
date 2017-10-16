library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SEU is
    Port ( imm13 : in  STD_LOGIC_VECTOR (12 downto 0);
           SEUimm : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU;

architecture Behavioral of SEU is

begin

process(imm13)

begin

if imm13(12)='1' then
	SEUimm<="1111111111111111111"&imm13;
else
	SEUimm<="0000000000000000000"&imm13;
	
end if;

end process;

end Behavioral;