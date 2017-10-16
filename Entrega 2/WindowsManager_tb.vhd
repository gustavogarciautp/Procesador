LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY WindowsManager_tb IS
END WindowsManager_tb;
 
ARCHITECTURE behavior OF WindowsManager_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT WindowsManager
    PORT(
         rs1 : IN  std_logic_vector(4 downto 0);
         rs2 : IN  std_logic_vector(4 downto 0);
         rd : IN  std_logic_vector(4 downto 0);
         op : IN  std_logic_vector(1 downto 0);
         op3 : IN  std_logic_vector(5 downto 0);
         CWP : IN  std_logic;
         nRs1 : OUT  std_logic_vector(5 downto 0);
         nRs2 : OUT  std_logic_vector(5 downto 0);
         nRd : OUT  std_logic_vector(5 downto 0);
         nCWP : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal rd : std_logic_vector(4 downto 0) := (others => '0');
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');
   signal CWP : std_logic := '0';

 	--Outputs
   signal nRs1 : std_logic_vector(5 downto 0);
   signal nRs2 : std_logic_vector(5 downto 0);
   signal nRd : std_logic_vector(5 downto 0);
   signal nCWP : std_logic;
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: WindowsManager PORT MAP (
          rs1 => rs1,
          rs2 => rs2,
          rd => rd,
          op => op,
          op3 => op3,
          CWP => CWP,
          nRs1 => nRs1,
          nRs2 => nRs2,
          nRd => nRd,
          nCWP => nCWP
        );

   -- Stimulus process
   stim_proc: process
   begin		
		rs1<="01000";
		rs2<="10000";
		rd<="11000";
		op<="10";
		op3<="000000";
		CWP<='0';
		wait for 20 ns;
		CWP<='1';
		wait for 20 ns;
		op3<="111100";

      wait;
   end process;

END;
