LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY MUX_RFDEST_tb IS
END MUX_RFDEST_tb;
 
ARCHITECTURE behavior OF MUX_RFDEST_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX_RFDEST
    PORT(
         RD : IN  std_logic_vector(5 downto 0);
         RFDEST : IN  std_logic;
         nRD : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RD : std_logic_vector(5 downto 0) := (others => '0');
   signal RFDEST : std_logic := '0';

 	--Outputs
   signal nRD : std_logic_vector(5 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX_RFDEST PORT MAP (
          RD => RD,
          RFDEST => RFDEST,
          nRD => nRD
        );

   -- Stimulus process
   stim_proc: process
   begin		
		RFDEST<='1';
		RD<="010011";
		wait for 20 ns;
		RFDEST<='0';
		RD<="100010";
		
		
      wait;
   end process;

END;
