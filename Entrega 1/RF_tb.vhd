LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY RF_tb IS
END RF_tb;
 
ARCHITECTURE behavior OF RF_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RF
    PORT(
         rs1 : IN  std_logic_vector(4 downto 0);
         rs2 : IN  std_logic_vector(4 downto 0);
         rd : IN  std_logic_vector(4 downto 0);
         DWR : IN  std_logic_vector(31 downto 0);
         rst : IN  std_logic;
         Crs1 : OUT  std_logic_vector(31 downto 0);
         Crs2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal rd : std_logic_vector(4 downto 0) := (others => '0');
   signal DWR : std_logic_vector(31 downto 0) := (others => '0');
   signal rst : std_logic := '0';

 	--Outputs
   signal Crs1 : std_logic_vector(31 downto 0);
   signal Crs2 : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RF PORT MAP (
          rs1 => rs1,
          rs2 => rs2,
          rd => rd,
          DWR => DWR,
          rst => rst,
          Crs1 => Crs1,
          Crs2 => Crs2
        );

   -- Stimulus process
   stim_proc: process
   begin		
		rst<='0';
		
		rs1<=(others=>'0');
		rs2<="10000";
		rd<="01000";
		DWR<="00000000000000000000101011111111";
		wait for 100 ns;
		
		rs1<=(others=>'0');
		rs2<="10001";
		rd<="10001";
		DWR<="11111111111111111111111011111111";
		wait for 100 ns;
		
		rs1<="10000";
		rs2<="10001";
		rd<="01000";
		DWR<="00000000000001000101111011111111";
		wait for 100 ns;
		
		rs1<="10000";
		rs2<="10001";
		rd<="00000";
		DWR<="00001111100000000000111110001111";
		wait for 100 ns;
		
		rst<='1';
		rs1<="10000";
		rs2<="10001";
		rd<="01000";
		DWR<="00000000000000000000111110001111";
		wait for 100 ns;
				
      wait;
   end process;

END;
