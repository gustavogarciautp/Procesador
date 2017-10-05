library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PSR is
    Port ( NZVC : in  STD_LOGIC_VECTOR (3 downto 0);
           nCWP: in STD_LOGIC;
			  CWP: out STD_LOGIC_VECTOR (4 downto 0);
			  C : out  STD_LOGIC);
end PSR;

architecture Behavioral of PSR is

signal PSRegister: std_logic_vector(31 downto 0):=(others=>'0');

begin

process(NZVC,nCWP)

begin
PSRegister(23 downto 20)<=NZVC;
PSRegister(4 downto 0)<="0000"&nCWP;
CWP<=PSRegister(4 downto 0);
C<=PSRegister(20);

end process;

end Behavioral;

