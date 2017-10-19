library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ALU is
    Port ( Oper1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Oper2 : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUOP : in  STD_LOGIC_VECTOR (5 downto 0);
			  C: in STD_LOGIC;
           ALURESULT : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is

begin

process(Oper1,Oper2,ALUOP,C)
begin

case ALUOP is
	when "000000"=>
		ALURESULT<=Oper1 and Oper2;--AND
	when "000001"=>
		ALURESULT<=Oper1 and not Oper2;--ANDN
	when "000010"=>
		ALURESULT<=Oper1 or Oper2;--OR
	when "000011"=> 
		ALURESULT<=Oper1 or not Oper2;--ORN
	when "000100"=>
		ALURESULT<=Oper1 xor Oper2;--XOR
	when "000101"=>
		ALURESULT<=Oper1 xnor Oper2;--XNOR
	when "000110"=> 
		ALURESULT<=Oper1+Oper2;--ADD
	when "000111"=>
		ALURESULT<=Oper1-Oper2;--SUB
	when "001000"=> --SLL
		ALURESULT<=std_logic_vector(unsigned(Oper1) sll conv_integer(oper2(4 downto 0)));
	when "001001"=> --SRL
		ALURESULT<=std_logic_vector(unsigned(Oper1) srl conv_integer(oper2(4 downto 0)));
	when "001010"=> --SRA
		ALURESULT<=To_StdLogicVector(to_bitvector(Oper1) sra conv_integer(oper2(4 downto 0)));		
	when "001011"=>
		ALURESULT<=Oper1 and Oper2;--ANDcc
	when "001100"=>
		ALURESULT<=Oper1 and not Oper2;--ANDNcc
	when "001101"=>
		ALURESULT<=Oper1 or Oper2;--ORcc
	when "001110"=> 
		ALURESULT<=Oper1 or not Oper2;--ORNcc
	when "001111"=>
		ALURESULT<=Oper1 xor Oper2;--XORcc
	when "010000"=>
		ALURESULT<=Oper1 xnor Oper2;--XNORcc
	when "010001"=> 
		ALURESULT<=Oper1+Oper2;--ADDcc		
	when "010010"=> --ADDX
		ALURESULT<=Oper1+Oper2+C;
	when "010011"=> --ADDXcc
		ALURESULT<=Oper1+Oper2+C;	
	when "010100"=>
		ALURESULT<=Oper1-Oper2;--SUBcc
	when "010101"=> --SUBX
		ALURESULT<=Oper1-Oper2-C;
	when "010110"=> --SUBXcc
		ALURESULT<=Oper1-Oper2-C;
	when "010111"=> --SAVE
		ALURESULT<=Oper1+Oper2;
	when "011000"=> --RESTORE
		ALURESULT<=Oper1+Oper2;
	when others=>--"111111" Instrucciones no definidas
		ALURESULT<=(others=>'0');
end case;
end process;


end Behavioral;

