LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY MUX_RFSOURCE_tb IS
END MUX_RFSOURCE_tb;
 
ARCHITECTURE behavior OF MUX_RFSOURCE_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX_RFSOURCE
    PORT(
         RFSOURCE : IN  std_logic_vector(1 downto 0);
         DATATOMEM : IN  std_logic_vector(31 downto 0);
         ALURESULT : IN  std_logic_vector(31 downto 0);
         PC : IN  std_logic_vector(31 downto 0);
         DATATOREG : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RFSOURCE : std_logic_vector(1 downto 0) := (others => '0');
   signal DATATOMEM : std_logic_vector(31 downto 0) := (others => '0');
   signal ALURESULT : std_logic_vector(31 downto 0) := (others => '0');
   signal PC : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal DATATOREG : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX_RFSOURCE PORT MAP (
          RFSOURCE => RFSOURCE,
          DATATOMEM => DATATOMEM,
          ALURESULT => ALURESULT,
          PC => PC,
          DATATOREG => DATATOREG
        );

   -- Stimulus process
   stim_proc: process
   begin		
		RFSOURCE<="00";
		DATATOMEM<="00000000000000000011010000111111";
		ALURESULT<="00000000000000000000000000010111";
		PC<="00000000000000000000000000000011";
		wait for 20 ns;
		RFSOURCE<="01";
		DATATOMEM<="00000000000000000010000000100001";
		ALURESULT<="00000000000000000000000100010000";
		PC<="00000000000000000000000000000111";
		wait for 20 ns;
		RFSOURCE<="10";
		DATATOMEM<="00000000000000000000001100000000";
		ALURESULT<="00000000000000000000000111110000";
		PC<="00000000000000000000000000001011";
		wait for 20 ns;
		RFSOURCE<="11";
		DATATOMEM<="00000000000000000000000000101000";
		ALURESULT<="00000000000000000000000000000101";
		PC<="00000000000000000000000000001111";
		

      wait;
   end process;

END;
