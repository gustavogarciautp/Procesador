LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY ALU_tb IS
END ALU_tb;
 
ARCHITECTURE behavior OF ALU_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         Oper1 : IN  std_logic_vector(31 downto 0);
         Oper2 : IN  std_logic_vector(31 downto 0);
         ALUOP : IN  std_logic_vector(5 downto 0);
			C: IN std_logic;
         ALURESULT : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Oper1 : std_logic_vector(31 downto 0) := (others => '0');
   signal Oper2 : std_logic_vector(31 downto 0) := (others => '0');
   signal ALUOP : std_logic_vector(5 downto 0) := (others => '0');
	signal C : std_logic:='0';

 	--Outputs
   signal ALURESULT : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          Oper1 => Oper1,
          Oper2 => Oper2,
          ALUOP => ALUOP,
			 C => C,
          ALURESULT => ALURESULT
        );




   -- Stimulus process
   stim_proc: process
   begin	
		C<='1';
		------------------SUB-------------------------------
		ALUOP<="000111";
		-- 5 - 28
		Oper1<="00000000000000000000000000000101"; -- +5
		Oper2<="00000000000000000000000000011100"; -- +28
		wait for 20 ns;
		
		-- 32 - 20
		Oper1<="00000000000000000000000000100000";-- +32
		Oper2<="00000000000000000000000000010100";-- +20
		wait for 20 ns;		

		-- -45 - (+33)
		Oper1<="11111111111111111111111111010011";-- -45
		Oper2<="00000000000000000000000000100001";-- +33
		wait for 20 ns;
		
		-- -45 - (+63)
		Oper1<="11111111111111111111111111010011";-- -45
		Oper2<="00000000000000000000000000111111";-- +63
		wait for 20 ns;

		-- -45 - (-33)
		Oper1<="11111111111111111111111111010011";-- -45
		Oper2<="11111111111111111111111111011111";-- -33
		wait for 20 ns;
		
		-- -45 - (-63)
		Oper1<="11111111111111111111111111010011";-- -45
		Oper2<="11111111111111111111111111000001";-- -63
		wait for 20 ns;
		
		-- 45 - (-63)
		Oper1<="00000000000000000000000000101101";-- 45
		Oper2<="11111111111111111111111111000001";-- -63
		wait for 20 ns;
		
		-- 45 - (-33)
		Oper1<="00000000000000000000000000101101";-- 45
		Oper2<="11111111111111111111111111011111";-- -33
		wait for 20 ns;
		
		----------------SUMA----------------
		ALUOP<="000110";-- 75 + 25
		Oper1<="00000000000000000000000001001011";-- 75
		Oper2<="00000000000000000000000000011001";-- 25
		wait for 20 ns;
		
		-- 75 + (-25)
		Oper1<="00000000000000000000000001001011";-- 75
		Oper2<="11111111111111111111111111100111";-- -25
		wait for 20 ns;
		
		-- 75 + (-100)
		Oper1<="00000000000000000000000001001011";-- 75
		Oper2<="11111111111111111111111110011100";-- -100
		wait for 20 ns;
		
		-- -75 + 25
		Oper1<="11111111111111111111111110110101";-- -75
		Oper2<="00000000000000000000000000011001";-- 25
		wait for 20 ns;
		
		-- -75 + 100
		Oper1<="11111111111111111111111110110101";-- -75
		Oper2<="00000000000000000000000001100100";-- +100
		wait for 20 ns;
		
		-- -75 + (-25)
		Oper1<="11111111111111111111111110110101";-- -75
		Oper2<="11111111111111111111111111100111";-- -25
		wait for 20 ns;
		
		-- -75 + (-100)
		Oper1<="11111111111111111111111110110101";-- -75
		Oper2<="11111111111111111111111110011100";-- -100
		wait for 20 ns;
		
		-------------------OR--------------------
		
		ALUOP<="000010";
		Oper1<="11111111111111111100011110110101";
		Oper2<="00000011101010001001010000001100";
		wait for 20 ns;
		
		-----------------orn---------------------
		
		ALUOP<="000011";
		wait for 20 ns;
		
		-----------------xor-------------------
		
		ALUOP<="000100";
		wait for 20 ns;
		
		-----------------xnor-------------------
		
		ALUOP<="000101";
		wait for 20 ns;
		
		-----------------and-------------------
		ALUOP<="000000";
		wait for 20 ns;
		
		-----------------andn-------------------
		ALUOP<="000001";
		wait for 20 ns;
		
		------------------------Instrucciones aritmetico logicas no definidas-----------------------
		
		-----------------SLL------------------
		ALUOP<="001000";
		Oper1<="00000000000000011110001110011011";
		Oper2<="00000000000000000000000000000011";
		wait for 20 ns;
		
		-----------------SRL-------------------
		ALUOP<="001001";
		Oper1<="11111000000000011110001110011011";
		Oper2<="00000000000000000000000000000011";
		wait for 20 ns;
		
		-----------------SRA----------------------
		
		ALUOP<="001010";
		Oper1<="11111000000000011110001110011011";
		Oper2<="00000000000000000000000000000011";
		wait for 20 ns;
		
		-----------------ANDcc---------------------
		ALUOP<="001011";
		Oper1<="00000111111000000010010000000111";
		Oper2<="00000111111111000000000000000011";
		wait for 20 ns;
		-----------------ANDNcc--------------------
		ALUOP<="001100";
		Oper1<="00000000111111111000000010100000";
		Oper2<="00001111111100000000000000000011";
		wait for 20 ns;
		-----------------ORcc----------------------
		ALUOP<="001101";
		Oper1<="00000001111111111100000000000000";
		Oper2<="11111000000000111111110000000000";
		wait for 20 ns;
		-----------------ORNcc---------------------
		ALUOP<="001110";
		Oper1<="00000011111111100000011111000000";
		Oper2<="00000000001111111111111100000000";
		wait for 20 ns;
		-----------------XORcc---------------------
		ALUOP<="001111";
		Oper1<="00001000100000000111111111100000";
		Oper2<="00000001111110000110000011000000";
		wait for 20 ns;
		-----------------XNORcc--------------------
		ALUOP<="010000";
		Oper1<="00000001111111111100000000000111";
		Oper2<="11110000001111100000110001000000";
		wait for 20 ns;
		-----------------ADDcc---------------------	
		ALUOP<="010001";
		Oper1<="00000000000000000000000001101000";
		Oper2<="00000000000000000000000000000101";
		wait for 20 ns;
		-----------------ADDX----------------------
		ALUOP<="010010";
		Oper1<="00000000000000100101010000000000";
		Oper2<="00000000000000000000000100000011";
		wait for 20 ns;
		-----------------ADDXcc--------------------
		ALUOP<="010011";
		Oper1<="00000000000000000000000000101010";
		Oper2<="00000000000000000000000000001101";
		wait for 20 ns;
		-----------------SUBcc---------------------
		ALUOP<="010100";
		Oper1<="00000000000000000000000100000000";
		Oper2<="00000000000000000000000000010000";
		wait for 20 ns;
		-----------------SUBX----------------------
		ALUOP<="010101";
		Oper1<="00000000000000000000000000001111";
		Oper2<="00000000000000000000000000001011";
		wait for 20 ns;
		-----------------SUBXcc--------------------
		ALUOP<="010110";
		Oper1<="00000000000000000000000100011011";
		Oper2<="00000000000000000000000000000011";
		wait for 20 ns;
		-----------------SAVE----------------------
		ALUOP<="010111";
		Oper1<="00000000000000000000000000011011";
		Oper2<="00000000000000000000000000001100";
		wait for 20 ns;
		-----------------RESTORE-------------------
		ALUOP<="011000";
		Oper1<="00000000000000000000000000010000";
		Oper2<="00000000000000000000000000000111";
		wait for 20 ns;

		---------------Instrucciones no definidas--------------------------
		ALUOP<="111111";
		Oper1<="00000000000000011110001110011011";
		Oper2<="00000000000000000000000011111111";

      wait;
   end process;

END;
