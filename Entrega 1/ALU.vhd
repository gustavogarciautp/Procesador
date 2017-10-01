library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ALU is
    Port ( Oper1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Oper2 : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUOP : in  STD_LOGIC_VECTOR (5 downto 0);
           ALURESULT : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is

begin

process(Oper1,Oper2,ALUOP)
begin

case ALUOP is
	when "000000"=> 
		ALURESULT<=Oper1 and Oper2;
	when "000001"=>
		ALURESULT<=Oper1 and not Oper2;
	when "000010"=>
		ALURESULT<=Oper1 or Oper2;
	when "000011"=> 
		ALURESULT<=Oper1 or not Oper2;
	when "000100"=>
		ALURESULT<=Oper1 xor Oper2;
	when "000101"=>
		ALURESULT<=Oper1 xnor Oper2;
	when "000110"=> 
		ALURESULT<=Oper1+Oper2;
	when "000111"=>
		ALURESULT<=Oper1-Oper2;
	when "001000"=> --SLL
		ALURESULT<=std_logic_vector(unsigned(Oper1) sll conv_integer(oper2(4 downto 0)));
	when "001001"=> --SRL
		ALURESULT<=std_logic_vector(unsigned(Oper1) srl conv_integer(oper2(4 downto 0)));
	when "001010"=> --SRA
		ALURESULT<=To_StdLogicVector(to_bitvector(Oper1) sra conv_integer(oper2(4 downto 0)));
	when others=>--"111111" Instrucciones no definidas
		ALURESULT<=(others=>'0');
end case;

end process;


end Behavioral;

