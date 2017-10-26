LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY PC_tb IS
END PC_tb;
 
ARCHITECTURE behavior OF PC_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PC
    PORT(
         rst : IN  std_logic;
         dataIn : IN  std_logic_vector(31 downto 0);
         CLK : IN  std_logic;
         DataOut : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal dataIn : std_logic_vector(31 downto 0) := (others => '0');
   signal CLK : std_logic := '0';

 	--Outputs
   signal DataOut : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PC PORT MAP (
          rst => rst,
          dataIn => dataIn,
          CLK => CLK,
          DataOut => DataOut
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for 20 ns;
		CLK <= '1';
		wait for 20 ns;
   end process;
 

   stim_proc: process
   begin		
      rst<='1';
		wait for 20 ns;
		rst<='0';
      dataIn<="00100010001000100010001000100010";
		wait for 40 ns;
		dataIn<="00000000000000000000000000000011";
      wait for 80 ns;
		rst<='1';
		dataIn<="00100010001000100010001000100010";
		wait for 40 ns;
		dataIn<="00000000000000000000000000000011";
      wait for 80 ns;
		rst<='0';
		dataIn<="11100010001000100010001111100010";
		wait for 40 ns;
		dataIn<="00000000000000111111100001111111";
		wait for 40 ns;
		dataIn<="01010010100101001100100100010010";
		wait for 40 ns;
		dataIn<="01011110100001011110100001101000";
		wait for 20 ns;
		dataIn<="00000000000000000000000000111010";
		wait;
   end process;

END;
