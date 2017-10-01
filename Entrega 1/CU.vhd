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
		case OP3 is
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
			when others  =>ALUOP<="001010";  --10.SRA(OP3=100111)
		end case;
	when others=>ALUOP<="111111";--Otras instrucciones aun no definidas
end case;
	
end process;
end Behavioral;
