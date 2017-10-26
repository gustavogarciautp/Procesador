LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY PSRModifier_tb IS
END PSRModifier_tb;
 
ARCHITECTURE behavior OF PSRModifier_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSRModifier
    PORT(
         ALUOP : IN  std_logic_vector(5 downto 0);
         Oper2 : IN  std_logic_vector(31 downto 0);
         Oper1 : IN  std_logic_vector(31 downto 0);
         ALURESULT : IN  std_logic_vector(31 downto 0);
         NZVC : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ALUOP : std_logic_vector(5 downto 0) := (others => '0');
   signal Oper2 : std_logic_vector(31 downto 0) := (others => '0');
   signal Oper1 : std_logic_vector(31 downto 0) := (others => '0');
   signal ALURESULT : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal NZVC : std_logic_vector(3 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSRModifier PORT MAP (
          ALUOP => ALUOP,
          Oper2 => Oper2,
          Oper1 => Oper1,
          ALURESULT => ALURESULT,
          NZVC => NZVC
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
	Oper1<="00000000000000000000000000001111";
	Oper2<="00000000000000000000000000010000";
	ALUOP<="001011";  --ANDcc
	ALURESULT<="00000000000000000000000000000000";
	wait for 20 ns;
	Oper1<="00000000001111111000000000011111";
	Oper2<="00000000000000000000000000000000";
	ALUOP<="001100";  --ANDNcc
	ALURESULT<="00000000000111111100000000001111";
	wait for 20 ns;
	Oper1<="11100000000000000000000000000000";
	Oper2<="00111111111111111111111111100000";
	ALUOP<="001101";  --ORcc
	ALURESULT<="11111111111111111111111111100000";
	wait for 20 ns;
	Oper1<="00000000000000011111100000000000";
	Oper2<="00000000000000000000000011111111";
	ALUOP<="001110";  --ORNcc
	ALURESULT<="11111111111111111111111100000000";
	wait for 20 ns;
	Oper1<="10000000000000000000000000001111";
	Oper2<="00000000000000000000000000010000";
	ALUOP<="001111";  --XORcc
	ALURESULT<="10000000000000000000000000011111";
	wait for 20 ns;
	Oper1<="00000111111111100000000000000000";
	Oper2<="11111000000000011111111111111111";
	ALUOP<="010000";  --XNORcc
	ALURESULT<="00000000000000000000000000000000";
	wait for 20 ns;
	Oper1<="10000000000000000000000000001111";
	Oper2<="10000000000000000000000000010000";
	ALUOP<="010001";  --ADDcc
	ALURESULT<="00000000000000000000000000011111";
	wait for 20 ns;
	Oper1<="11000000000000000000000000001111";
	Oper2<="11000000000000000000000000010000";
	ALUOP<="010011";  --ADDXcc
	ALURESULT<="10000000000000000000000000011111";
	wait for 20 ns;
	Oper1<="10000000000000000000000000001111";
	Oper2<="01111000000000000000000000000000";
	ALUOP<="010100";  --SUBcc
	ALURESULT<="00001000000000000000000000001111";
	wait for 20 ns;
	Oper1<="00000000000000000000000000001111";
	Oper2<="10000000000000000000000000010000";
	ALUOP<="010110";  --SUBXcc
	ALURESULT<="01111111111111111111111111111111";
	wait for 20 ns;
   wait;
   end process;

END;
