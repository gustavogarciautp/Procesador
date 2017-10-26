LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY SEUdisp30_tb IS
END SEUdisp30_tb;
 
ARCHITECTURE behavior OF SEUdisp30_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SEUdisp30
    PORT(
         disp30 : IN  std_logic_vector(29 downto 0);
         SEUdisp30 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal disp30 : std_logic_vector(29 downto 0) := (others => '0');

 	--Outputs
   signal SEUdisp30 : std_logic_vector(31 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SEUdisp30 PORT MAP (
          disp30 => disp30,
          SEUdisp30 => SEUdisp30
        );

   -- Stimulus process
   stim_proc: process
   begin		
      disp30<="10000000000010000000000000011";
		wait for 20 ns;
		disp30<="00000000000000000000000001010";
      wait; 
   end process;

END;
