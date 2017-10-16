LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Sumador32bits_tb IS
END Sumador32bits_tb;
 
ARCHITECTURE behavior OF Sumador32bits_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Sumador32bits
    PORT(
         Oper1 : IN  std_logic_vector(31 downto 0);
         Oper2 : IN  std_logic_vector(31 downto 0);
         Result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Oper1 : std_logic_vector(31 downto 0) := (others => '0');
   signal Oper2 : std_logic_vector(31 downto 0) := (others => '0');
	
	--Outputs
   signal Result : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Sumador32bits PORT MAP (
          Oper1 => Oper1,
          Oper2 => Oper2,
          Result => Result
        );

   -- Stimulus process
   stim_proc: process
   begin		
      Oper1<="11110000000000000000000000000000";
		Oper2<="00000000000000000000000000000100";
      wait for 20 ns;
		Oper1<="01110000000000000000000000000111";
		Oper2<="10000000000000000000000000000101";
		wait for 20 ns;
		Oper1<="11111111110000101100000011000111";
		Oper2<="11100000100011111111111000001111";
		wait for 20 ns;
		Oper1<="00000000000000000000000011000111";
		Oper2<="00000000111100001111000011111111";
      wait;
   end process;

END;
