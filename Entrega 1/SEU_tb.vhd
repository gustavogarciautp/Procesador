LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY SEU_tb IS
END SEU_tb;
 
ARCHITECTURE behavior OF SEU_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SEU
    PORT(
         imm13 : IN  std_logic_vector(12 downto 0);
         SEUimm : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal imm13 : std_logic_vector(12 downto 0) := (others => '0');

 	--Outputs
   signal SEUimm : std_logic_vector(31 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SEU PORT MAP (
          imm13 => imm13,
          SEUimm => SEUimm
        );

   -- Stimulus process
   stim_proc: process
   begin		
		imm13<="0100101001110";
		wait for 20 ns;
		imm13<="1011000101011";
		wait for 20 ns;
		imm13<="0000000000001";
		wait for 20 ns;
		imm13<="1000000000000";

      wait;
   end process;

END;
