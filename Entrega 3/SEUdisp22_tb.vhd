LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY SEUdisp22_tb IS
END SEUdisp22_tb;
 
ARCHITECTURE behavior OF SEUdisp22_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SEUdisp22
    PORT(
         disp22 : IN  std_logic_vector(21 downto 0);
         SEUdisp22 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal disp22 : std_logic_vector(21 downto 0) := (others => '0');

 	--Outputs
   signal SEUdisp22 : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SEUdisp22 PORT MAP (
          disp22 => disp22,
          SEUdisp22 => SEUdisp22
        );


   -- Stimulus process
   stim_proc: process
   begin		
       disp22<="100000000000100000011";
		 wait for 20 ns;
		 disp22<="000000000000000001010";
      wait;

      wait;
   end process;

END;
