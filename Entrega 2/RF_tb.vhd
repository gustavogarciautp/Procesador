LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY RF_tb IS
END RF_tb;
 
ARCHITECTURE behavior OF RF_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RF
    PORT(
         rs1 : IN  std_logic_vector(5 downto 0);
         rs2 : IN  std_logic_vector(5 downto 0);
         rd : IN  std_logic_vector(5 downto 0);
         DWR : IN  std_logic_vector(31 downto 0);
         rst : IN  std_logic;
         Crs1 : OUT  std_logic_vector(31 downto 0);
         Crs2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rs1 : std_logic_vector(5 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(5 downto 0) := (others => '0');
   signal rd : std_logic_vector(5 downto 0) := (others => '0');
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
		rst<='1';
		wait for 20 ns;
		rst<='0';		
		rs1<=(others=>'0');
		rs2<="000101";
		rd<="000001";
		DWR<="00000000000000000000000000000101";
		wait for 40 ns;
		
		rs1<=(others=>'0');
		rs2<="111000";
		rd<="010000";
		DWR<="11111111111111111111111111111000";
		wait for 40 ns;
		
		rs1<=(others=>'0');
		rs2<="000100";
		rd<="010001";
		DWR<="00000000000000000000000000000100";
		wait for 40 ns;
		
		rs1<="000001";
		rs2<="000010";
		rd<="011000";
		DWR<="00000000000000000000000000010100";
		wait for 40 ns;
		
		rs1<="010001";
		rs2<="000001";
		rd<="011001";
		DWR<="00000000000000000000000000000010";
		wait for 40 ns;
		
		rs1<=(others=>'0');
		rs2<=(others=>'0');
		rd<=(others=>'0');
		DWR<="00000000000000000000000000000000";
		wait for 40 ns;
		
		rs1<="000001";
		rs2<="000011";
		rd<="100000";
		DWR<="00000000000000000000000000001000";
		wait for 40 ns;
		
		rs1<=(others=>'0');
		rs2<=(others=>'0');
		rd<=(others=>'0');
		DWR<="00000000000000000000000000000000";
		wait for 40 ns;
		
		rs1<=(others=>'0');
		rs2<="000100";
		rd<=(others=>'0');
		DWR<="11111111111111111111111111111100";
		wait for 40 ns;
		
		rs1<=(others=>'0');
		rs2<="000001";
		rd<="000010";
		DWR<="00000000000000000000000000000101";
		wait for 40 ns;
		
		rs1<=(others=>'0');
		rs2<="010000";
		rd<="001000";
		DWR<="11111111111111111111111111111000";
		wait for 40 ns;
		
		rst<='1';
		rs1<="000001";
		rs2<="000010";
		rd<="001101";
		DWR<="00000000000000000000000000001100";
		wait;
   end process;

END;
