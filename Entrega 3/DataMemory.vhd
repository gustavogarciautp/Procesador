library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity DataMemory is
    Port ( Crd : in  STD_LOGIC_VECTOR (31 downto 0);
           Address : in  STD_LOGIC_VECTOR (31 downto 0);
           WRENMEM : in  STD_LOGIC;
           --RDENMEM : in  STD_LOGIC;
           DATATOMEM : out  STD_LOGIC_VECTOR (31 downto 0));
end DataMemory;

architecture Behavioral of DataMemory is

type ram_type is array (31 downto 0) of std_logic_vector (31 downto 0);
signal DM: ram_type:=(others => "00000000000000000000000000000000");

begin
process (Crd,Address,DM)--RDENMEM,DM)
begin
if WRENMEM='1' then
	DM(conv_integer(Address(4 downto 0)))<=Crd;
	DATATOMEM<=Crd;--(others=>'0');
--elsif RDENMEM='1' then
--	DATATOMEM<=DM(conv_integer(Address));
else
	DATATOMEM<=DM(conv_integer(Address(4 downto 0)));
end if;
end process;

end Behavioral;

