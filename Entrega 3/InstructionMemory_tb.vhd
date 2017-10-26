LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY InstructionMemory_tb IS
END InstructionMemory_tb;
 
ARCHITECTURE behavior OF InstructionMemory_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT InstructionMemory
    PORT(
         Address : IN  std_logic_vector(5 downto 0);
			rst: IN std_logic;
         Instruction : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Address : std_logic_vector(5 downto 0) := (others => '0');
	signal rst : std_logic:= '0';

 	--Outputs
   signal Instruction : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: InstructionMemory PORT MAP (
          Address => Address,
			 rst => rst,
          Instruction => Instruction
        );

   -- Stimulus process
   stim_proc: process
   begin		
		rst<='0';
		Address<=(others=>'0');
		wait for 20 ns;
		Address<="000001";
		wait for 40 ns;
		Address<="000010";
		wait for 40 ns;
		Address<="000011";
		wait for 40 ns;
		Address<="000100";
      wait for 40 ns;
		Address<="000101";
      wait for 40 ns;
		Address<="000110";
      wait for 40 ns;
		Address<="000111";
      wait for 40 ns;
		
		rst<='1';
		Address<="000001";
		wait for 40 ns;
		Address<="000100";
      wait;
		
   end process;

END;
