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
		wait for 100 ns;
		i<='1';
      wait;
   end process;

END;
