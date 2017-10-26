LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY DataMemory_tb IS
END DataMemory_tb;
 
ARCHITECTURE behavior OF DataMemory_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DataMemory
    PORT(
         Crd : IN  std_logic_vector(31 downto 0);
         Address : IN  std_logic_vector(31 downto 0);
         WRENMEM : IN  std_logic;
         DATATOMEM : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Crd : std_logic_vector(31 downto 0) := (others => '0');
   signal Address : std_logic_vector(31 downto 0) := (others => '0');
   signal WRENMEM : std_logic := '0';

 	--Outputs
   signal DATATOMEM : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DataMemory PORT MAP (
          Crd => Crd,
          Address => Address,
          WRENMEM => WRENMEM,
          DATATOMEM => DATATOMEM
        );

   -- Stimulus process
   stim_proc: process
   begin		
		Crd<="00000000000000000000001000001011";
		Address<="00000000000000000000000000001110";
		wait for 20 ns;
		Crd<="00000000000000000000001000101011";
		Address<="00000000000000000000000000001111";
		WRENMEM<='1';
		wait for 20 ns;
		Crd<="00000000000000000000000000001011";
		Address<="00000000000000000000000000001111";
		WRENMEM<='0';
		wait for 20 ns;
		Crd<="00000000000000000001001000001011";
		Address<="00000000000000000000000000001111";
		WRENMEM<='1';
		wait for 20 ns;
		Crd<="00000000000000000000000000001011";
		Address<="00000000000000000000000000010000";
		wait for 20 ns;
		Crd<="00000000000000000000000000000011";
		Address<="00000000000000000000000000010000";
		WRENMEM<='0';
      wait;
   end process;

END;
