LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY PSR_tb IS
END PSR_tb;
 
ARCHITECTURE behavior OF PSR_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSR
    PORT(
         NZVC : IN  std_logic_vector(3 downto 0);
         nCWP : IN  std_logic;
         CLK : IN  std_logic;
         rst : IN  std_logic;
         CWP : OUT  std_logic;
         C : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal NZVC : std_logic_vector(3 downto 0) := (others => '0');
   signal nCWP : std_logic := '0';
   signal CLK : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal CWP : std_logic;
   signal C : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSR PORT MAP (
          NZVC => NZVC,
          nCWP => nCWP,
          CLK => CLK,
          rst => rst,
          CWP => CWP,
          C => C
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
		wait for 20 ns;
		rst<='0';
		NZVC<="1000";
		wait for 40 ns;
		NZVC<="0100";
		wait for 40 ns;
		NZVC<="1001";
		nCWP<='1';
		wait for 40 ns;
		NZVC<="0000";
		wait for 40 ns;
		NZVC<="0011";
		wait for 40 ns;
		nCWP<='0';
		wait for 40 ns;
		NZVC<="1111";
		wait for 40 ns;
		rst<='1';
      wait;
   end process;

END;
