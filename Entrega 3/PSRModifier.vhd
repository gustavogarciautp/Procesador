library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity PSRModifier is
    Port ( ALUOP : in  STD_LOGIC_VECTOR (5 downto 0);
           Oper2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Oper1 : in  STD_LOGIC_VECTOR (31 downto 0);
           ALURESULT : in  STD_LOGIC_VECTOR (31 downto 0);
           NZVC : out  STD_LOGIC_VECTOR (3 downto 0));
end PSRModifier;

architecture Behavioral of PSRModifier is

begin
process(ALUOP,Oper2,Oper1,ALURESULT)
begin
	if(ALUOP="010100" or ALUOP="001011" or ALUOP="001100" or ALUOP="001101" or ALUOP="001110" or ALUOP="001111" or ALUOP="010000" or ALUOP="010001" or ALUOP="010011" or ALUOP="010110" or ALUOP="010100")then
	--ANDcc,ANDNcc,ORcc,ORNcc,XORcc,XNORcc,ADDcc,ADDXcc,SUBcc,SUBXcc
		
		if(ALURESULT="00000000000000000000000000000000") then
			NZVC(2)<='1';
		else
			NZVC(2)<='0';
		end if;
		
		NZVC(3)<=ALURESULT(31);
			
		if(ALUOP="001011" or ALUOP="001100" or ALUOP="001101" or ALUOP="001110" or ALUOP="001111" or ALUOP="010000") then
			--ANDcc,ANDNcc,ORcc,ORNcc,XORcc,XNORcc
			NZVC(1 downto 0)<="00";
		elsif(ALUOP="010001" or ALUOP="010011") then --ADDcc, ADDXcc
			NZVC(1)<=((Oper1(31) and Oper2(31) and (not ALURESULT(31))) or ((not Oper1(31)) and (not Oper2(31)) and ALURESULT(31)));
			NZVC(0)<=(Oper1(31) and Oper2(31)) or ((not ALURESULT(31)) and (Oper1(31) or Oper2(31)));
		else--(ALUOP="010100" or ALUOP="010110") SUBcc, SUBXcc
			NZVC(1)<=(Oper1(31) and (not Oper2(31)) and (not ALURESULT(31))) or ((not Oper1(31)) and Oper2(31) and ALURESULT(31));
			NZVC(0)<=((not Oper1(31)) and Oper2(31)) or (ALURESULT(31) and ((not Oper1(31)) or Oper2(31)));
		end if;
	--else
	--	NZVC<="1111";
	end if;
	
end process;

end Behavioral;

