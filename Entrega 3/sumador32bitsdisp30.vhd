library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity sumador32bitsdisp30 is
    Port ( Oper1 : in  STD_LOGIC_VECTOR (29 downto 0);
           Oper2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Result : out  STD_LOGIC_VECTOR (31 downto 0));
end sumador32bitsdisp30;

architecture Behavioral of sumador32bitsdisp30 is

begin

Result<=Oper1+Oper2;

end Behavioral;

