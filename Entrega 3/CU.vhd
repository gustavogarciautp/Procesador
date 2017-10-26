library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CU is
    Port ( OP : in  STD_LOGIC_VECTOR (1 downto 0);	
	        OP2 : in STD_LOGIC_VECTOR(2 downto 0);
			  Cond: in STD_LOGIC_VECTOR (3 downto 0);
			  icc: in STD_LOGIC_VECTOR (3 downto 0);
           OP3 : in  STD_LOGIC_VECTOR (5 downto 0);
			  WE : out STD_LOGIC;
			  RFDEST : out STD_LOGIC;
			  RFSOURCE: out STD_LOGIC_VECTOR(1 downto 0);
			  WRENMEM: out STD_LOGIC;
			  --RDENMEM: out STD_LOGIC;
			  PCSOURCE: out STD_LOGIC_VECTOR(1 downto 0);
           ALUOP : out  STD_LOGIC_VECTOR (5 downto 0));
end CU;

architecture Behavioral of CU is

begin

process(OP,OP3,Cond,icc,OP2)
begin

case OP is
	when "10"=> 
		WE<='1';
		WRENMEM<='0';
		--RDENMEM<='0';
		RFDEST<='0';
		PCSOURCE<="10";
		RFSOURCE<="01";
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
			when "111000"=>--JUMP AND LINK
				ALUOP<="000110";--SUMA
				PCSOURCE<="11";
				RFSOURCE<="10";		
			when others=>  ALUOP<="111111";  --Instrucciones artimetico logicas no definidas
				WE<='0';
		end case;
	when "11"=>
		RFDEST<='0';
		PCSOURCE<="10";
		ALUOP<="000110";--SUMA
		RFSOURCE<="00";
		case OP3 is --Instrucciones para escribir y leer en memoria
			when "000100"=>--25. Store Word
				WE<='0';
				WRENMEM<='1';
				--RDENMEM<='0';
			when "000000"=>--26. Load word
				WE<='1';
				WRENMEM<='0';
				--RDENMEM<='1';
		when others=>ALUOP<="111111";
			WE<='0';
			WRENMEM<='0';
		end case;
	when "00"=> --Branch on Integer Condition Codes Instructions
		case OP2 is
			when "010"=>
				WE<='0';
				RFDEST<='0';
				WRENMEM<='0';
				--RDENMEM<='0';
				RFSOURCE<="01";
				ALUOP<="111111";
				case Cond is 
					when "1000"=>--Branch Always BA
						PCSOURCE<="01";
					when "0000"=>--Branch Never BN
						PCSOURCE<="10";
					when "1001"=>--Branch on Not Equal BNE
						if(icc(2)='0') then
							PCSOURCE<="01";
						else
							PCSOURCE<="10";
						end if;
					when "0001"=>--Branch on Equal BE
						if(icc(2)='1') then
							PCSOURCE<="01";
						else
							PCSOURCE<="10";
						end if;
					when "1010"=>--Branch on Greater BG
						if(icc(2) or(icc(3) xor icc(1)))='0' then
							PCSOURCE<="01";
						else
							PCSOURCE<="10";
						end if;
					when "0010"=>--Branch on Less or Equal BLE
						if (icc(2) or(icc(3) xor icc(1)))='1' then
							PCSOURCE<="01";
						else
							PCSOURCE<="10";
						end if;
					when "1011"=>--Branch on Greater or Equal BGE
						if (icc(3) xor icc(1))='0' then
							PCSOURCE<="01";
						else
							PCSOURCE<="10";
						end if;
					when "0011"=>--Branch on Less BL
						if(icc(3) xor icc(1))='1' then
							PCSOURCE<="01";
						else
							PCSOURCE<="10";
						end if;
					when "1100"=>--Branch on  Greater Unsigned BGU
						if(icc(0) or icc(2))='0' then
							PCSOURCE<="01";
						else
							PCSOURCE<="10";
						end if;
					when "0100"=>--Branch on Less or Equal Unsigned BLEU
						if(icc(0) or icc(2))='1' then
							PCSOURCE<="01";
						else
							PCSOURCE<="10";
						end if;
					when "1101"=>--Branch on Carry Clear(Greater than or Equal, Unsigned) BCC
						if icc(0)='0' then
							PCSOURCE<="01";
						else
							PCSOURCE<="10";
						end if;
					when "0101"=>--Branch on Carry Set(Less than Unsigned) BCS
						if icc(0)='1' then
							PCSOURCE<="01";
						else
							PCSOURCE<="10";
						end if;
					when "1110"=>--Branch on Positive BPOS
						if icc(3)='0' then
							PCSOURCE<="01";
						else
							PCSOURCE<="10";
						end if;
					when "0110"=>--Branch on Negative BNEG
						if icc(3)='1' then
							PCSOURCE<="01";
						else
							PCSOURCE<="10";
						end if;
					when "1111"=>--Branch on Overflow Clear BVC
						if icc(1)='0' then
							PCSOURCE<="01";
						else
							PCSOURCE<="10";
						end if;
					when "0111"=>--Branch on Overflow Set BVS
						if icc(1)='1' then
							PCSOURCE<="01";
						else
							PCSOURCE<="10";
						end if;
					when others=>ALUOP<="111111";
				end case;
			when others=>
				ALUOP<="111111";
				WE<='0';
				WRENMEM<='0';
				RFDEST<='0';
				PCSOURCE<="10";
				RFSOURCE<="01";
		end case;
	when "01"=>--CALL AND LINK
		RFDEST<='1';
		WE<='1';
		WRENMEM<='0';
		--RDENMEM<='0';
		PCSOURCE<="00";
		RFSOURCE<="10";
		ALUOP<="111111";
	when others=>ALUOP<="111111"; --Otras instrucciones aun no definidas
		RFDEST<='0';
		WE<='0';
		WRENMEM<='0';
		PCSOURCE<="10";
		RFSOURCE<="01";
end case;

end process;
end Behavioral;