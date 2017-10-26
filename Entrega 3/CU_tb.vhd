LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY CU_tb IS
END CU_tb;
 
ARCHITECTURE behavior OF CU_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CU
    PORT(
         OP : IN  std_logic_vector(1 downto 0);
         OP2 : IN  std_logic_vector(2 downto 0);
         Cond : IN  std_logic_vector(3 downto 0);
         icc : IN  std_logic_vector(3 downto 0);
         OP3 : IN  std_logic_vector(5 downto 0);
         WE : OUT  std_logic;
         RFDEST : OUT  std_logic;
         RFSOURCE : OUT  std_logic_vector(1 downto 0);
         WRENMEM : OUT  std_logic;
         PCSOURCE : OUT  std_logic_vector(1 downto 0);
         ALUOP : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal OP : std_logic_vector(1 downto 0) := (others => '0');
   signal OP2 : std_logic_vector(2 downto 0) := (others => '0');
   signal Cond : std_logic_vector(3 downto 0) := (others => '0');
   signal icc : std_logic_vector(3 downto 0) := (others => '0');
   signal OP3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal WE : std_logic;
   signal RFDEST : std_logic;
   signal RFSOURCE : std_logic_vector(1 downto 0);
   signal WRENMEM : std_logic;
   signal PCSOURCE : std_logic_vector(1 downto 0);
   signal ALUOP : std_logic_vector(5 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CU PORT MAP (
          OP => OP,
          OP2 => OP2,
          Cond => Cond,
          icc => icc,
          OP3 => OP3,
          WE => WE,
          RFDEST => RFDEST,
          RFSOURCE => RFSOURCE,
          WRENMEM => WRENMEM,
          PCSOURCE => PCSOURCE,
          ALUOP => ALUOP
        );


   -- Stimulus process
   stim_proc: process
   begin		
      ---------------Instrucciones Aritmetico Logicas---------------
		OP<="10";
		OP2<="000"; --No interesa este valor en este tipo de instrucciones de formato 3
		Cond<="0000";--No interesa este valor en este tipo de instrucciones de formato 3
		OP3<="000001";--0. AND
		wait for 20 ns;
		OP3<="000101";--1. ANDN
		wait for 20 ns;
		OP3<="000010";--2. OR
		wait for 20 ns;
		OP3<="000110";--3. ORN
		wait for 20 ns;
		OP3<="000011";--4. XOR
		wait for 20 ns;
		OP3<="000111";--5. XNOR
		wait for 20 ns;
		OP3<="000000";--6. ADD
		wait for 20 ns;
		OP3<="000100";--7. SUB
		wait for 20 ns;
		OP3<="100101";--8. SLL
		wait for 20 ns;
		OP3<="100110";--9. SRL
		wait for 20 ns;
		OP3<="100111";--10.SRA
		wait for 20 ns;
		OP3<="010001";--11. ANDcc
		wait for 20 ns;
		OP3<="010101";--12. ANDNcc
		wait for 20 ns;
		OP3<="010010";--13. ORcc
		wait for 20 ns;
		OP3<="010110";--14. ORNcc
		wait for 20 ns;
		OP3<="010011";--15. XORcc
		wait for 20 ns;
		OP3<="010111";--16. XNORcc
		wait for 20 ns;
		OP3<="010000";--17. ADDcc
		wait for 20 ns;
		OP3<="001000";--18. ADDX
		wait for 20 ns;
		OP3<="011000";--19. ADDXcc
		wait for 20 ns;
		OP3<="010100";--20. SUBcc
		wait for 20 ns;
		OP3<="001100";--21. SUBX
		wait for 20 ns;
		OP3<="011100";--22. SUBXcc
		wait for 20 ns;
		OP3<="111100";--23. SAVE
		wait for 20 ns;
		OP3<="111101";--24. RESTORE
		wait for 20 ns;
		OP3<="111000";--25-JUMP AND LINK
		wait for 20 ns;
		
		--Escribir y leer en Memoria
		OP<="11";
		OP3<="000100";--Store Word
		wait for 20 ns;
		OP3<="000000";--Load Word
		wait;
		
		--Branch
		OP<="00";
		OP3<="000000";--En instrucciones de formato 2 no se utiliza OP3
		OP2<="010";
		Cond<="1000";
		wait for 20 ns;
		Cond<="0000";
		wait for 20 ns;
		Cond<="1001";
		wait for 20 ns;
		Cond<="0001";
		wait for 20 ns;
		Cond<="1010";
		wait for 20 ns;
		Cond<="0010";
		wait for 20 ns;
		Cond<="1011";
		wait for 20 ns;
		Cond<="0011";
		wait for 20 ns;
		Cond<="1100";
		wait for 20 ns;
		Cond<="0100";
		wait for 20 ns;
		Cond<="1101";
		wait for 20 ns;
		Cond<="0101";
		wait for 20 ns;
		Cond<="1110";
		wait for 20 ns;
		Cond<="0110";
		wait for 20 ns;
		Cond<="1111";
		wait for 20 ns;
		Cond<="0111";
		wait for 20 ns;
		
		-------CALL AND LINK-----
		OP<="01";
		wait;
		
		
   end process;

END;
