LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY OMUXT_tb IS
END OMUXT_tb;
 
ARCHITECTURE behavior OF OMUXT_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT OMUXT
    PORT(
         Crs2 : IN  std_logic_vector(31 downto 0);
         SEUimm : IN  std_logic_vector(31 downto 0);
         i : IN  std_logic;
         oper2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Crs2 : std_logic_vector(31 downto 0) := (others => '0');
   signal SEUimm : std_logic_vector(31 downto 0) := (others => '0');
   signal i : std_logic := '0';

 	--Outputs
   signal oper2 : std_logic_vector(31 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: OMUXT PORT MAP (
          Crs2 => Crs2,
          SEUimm => SEUimm,
          i => i,
          oper2 => oper2
        );


   -- Stimulus process
   stim_proc: process
   begin		
		i<='0';
		Crs2<="01000010111001000110011101010111";
		SEUimm<="00000000000000000000000100110101";
		wait for 20 ns;
		Crs2<="00000000000010000000001000000000";
		SEUimm<="11111111111111111111001000000000";
		wait for 20 ns;
		i<='1';
		Crs2<="00001111111000000011111111100000";
		SEUimm<="00000000000000000000001111111111";
		wait for 20 ns;
		Crs2<="00000000000000000011101001010100";
		SEUimm<="00000000000000000000001111000011";
      wait;
   end process;

END;
