library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CU is
    Port ( OP : in  STD_LOGIC_VECTOR (1 downto 0);
           OP3 : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUOP : out  STD_LOGIC_VECTOR (5 downto 0));
end CU;

architecture Behavioral of CU is

begin

process(OP,OP3)
begin

case OP is
	when "10"=> 
		case OP3 is --Instrucciones aritmetico logicas
			when "000001"=>ALUOP<="000000";  --0. AND
			when "000101"=>ALUOP<="000001";  --1. ANDN
			when "000010"=>ALUOP<="000010";  --2. OR
			when "000110"=>ALUOP<="000011";  --3. ORN
			when "000011"=>ALUOP<="000100";  --4. XOR
			when "000111"=>ALUOP<="000101";  --5. XNOR
			when "000000"=>ALUOP<="000110";  --6. ADD
			when "000100"=>ALUOP<="000111";  --7. SUB
			when "100101"=>ALUOP<="001000";  --8. SLL
			when "100110"=>ALUOP<="001001";  --9. SRL
			when "100111"=>ALUOP<="001010";  --10. SRA
			when "010001"=>ALUOP<="001011";  --11. ANDcc
			when "010101"=>ALUOP<="001100";  --12. ANDNcc
			when "010010"=>ALUOP<="001101";  --13. ORcc
			when "010110"=>ALUOP<="001110";  --14. ORNcc
			when "010011"=>ALUOP<="001111";  --15. XORcc
			when "010111"=>ALUOP<="010000";  --16. XNORcc
			when "010000"=>ALUOP<="010001";  --17. ADDcc
			when "001000"=>ALUOP<="010010";  --18. ADDX
			when "011000"=>ALUOP<="010011";  --19. ADDXcc
			when "010100"=>ALUOP<="010100";  --20. SUBcc
			when "001100"=>ALUOP<="010101";  --21. SUBX
			when "011100"=>ALUOP<="010110";  --22. SUBXcc
			when "111100"=>ALUOP<="010111";  --23. SAVE
			when "111101"=>ALUOP<="011000";  --24. RESTORE
			when others=>  ALUOP<="111111";  --Instrucciones artimetico logicas no definidas
		end case;
	when others=>ALUOP<="111111"; --Otras instrucciones aun no definidas
end case;

end process;
end Behavioral;