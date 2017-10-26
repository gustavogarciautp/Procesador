LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY MUX_PCSOURCE_tb IS
END MUX_PCSOURCE_tb;
 
ARCHITECTURE behavior OF MUX_PCSOURCE_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX_PCSOURCE
    PORT(
         PCdisp30 : IN  std_logic_vector(31 downto 0);
         PCSEUdisp22 : IN  std_logic_vector(31 downto 0);
         ALURESULT : IN  std_logic_vector(31 downto 0);
         PC : IN  std_logic_vector(31 downto 0);
         PCSOURCE : IN  std_logic_vector(1 downto 0);
         nPC : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal PCdisp30 : std_logic_vector(31 downto 0) := (others => '0');
   signal PCSEUdisp22 : std_logic_vector(31 downto 0) := (others => '0');
   signal ALURESULT : std_logic_vector(31 downto 0) := (others => '0');
   signal PC : std_logic_vector(31 downto 0) := (others => '0');
   signal PCSOURCE : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal nPC : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX_PCSOURCE PORT MAP (
          PCdisp30 => PCdisp30,
          PCSEUdisp22 => PCSEUdisp22,
          ALURESULT => ALURESULT,
          PC => PC,
          PCSOURCE => PCSOURCE,
          nPC => nPC
        );


   -- Stimulus process
   stim_proc: process
   begin		
		PCdisp30<="11111111111111111111111111111001";
		PCSEUdisp22<="00000000000000000000000000000110";
		ALURESULT<="00000000000000000000000000001010";
		PC<="00000000000000000000000000001000";
		wait for 20 ns;
		PCSOURCE<="01";
		wait for 20 ns;
		PCSOURCE<="10";
		wait for 20 ns;
		PCSOURCE<="11";

      wait;
   end process;

END;
