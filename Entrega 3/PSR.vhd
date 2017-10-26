library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PSR is
    Port ( NZVC : in  STD_LOGIC_VECTOR (3 downto 0);
           nCWP: in STD_LOGIC;
			  CLK: in STD_LOGIC;
			  rst: in STD_LOGIC;
			  icc: out STD_LOGIC_VECTOR(3 downto 0);
			  CWP: out STD_LOGIC;
			  C : out  STD_LOGIC);
end PSR;

architecture Behavioral of PSR is

--signal PSRegister: std_logic_vector(4 downto 0):=(others=>'0');

begin

process(NZVC,nCWP,CLK,rst)

begin
if rst='1' then
	--PSRegister<=(others=>'0');
	C<='0';
	CWP<='0';
	icc<=(others=>'0');
elsif rising_edge(CLK) then
	--if not(NZVC="1111") then
		--PSRegister(4 downto 1)<=NZVC;
	--end if;
	--PSRegister(0)<=nCWP;
	--CWP<=PSRegister(0);
	CWP<=nCWP;
	--C<=PSRegister(1);
	C<=NZVC(0);
	--icc<=PSRegister(4 downto 1);
	icc<=NZVC;
end if;
end process;

end Behavioral;

