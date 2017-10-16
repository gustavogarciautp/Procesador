LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY principal_tb IS
END principal_tb;
 
ARCHITECTURE behavior OF principal_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MODULOPRINCIPAL
    PORT(
         rst : IN  std_logic;
         CLK : IN  std_logic;
         ALURESULT : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal ALURESULT : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MODULOPRINCIPAL PORT MAP (
          rst => rst,
          CLK => CLK,
          ALURESULT => ALURESULT
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for 20 ns;
		CLK <= '1';
		wait for 20 ns;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		rst<='1';
		wait for 10 ns;
		rst<='0';
		--wait for 50 ms;
		--rst<='1';

      wait;
   end process;

END;
