LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY InstructionMemory_tb IS
END InstructionMemory_tb;
 
ARCHITECTURE behavior OF InstructionMemory_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT InstructionMemory
    PORT(
         Address : IN  std_logic_vector(5 downto 0);
         Instruction : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Address : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal Instruction : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: InstructionMemory PORT MAP (
          Address => Address,
          Instruction => Instruction
        );

   -- Clock process definitions
   --<clock>_process :process
   --begin
	--	<clock> <= '0';
	--	wait for <clock>_period/2;
	--	<clock> <= '1';
	--	wait for <clock>_period/2;
   --end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		Address<=(others=>'0');
		wait for 20 ns;
		Address<="000001";
		wait for 20 ns;
		Address<="000010";
		wait for 20 ns;
		Address<="000011";
		wait for 20 ns;
		Address<="000100";
      wait;
   end process;

END;
