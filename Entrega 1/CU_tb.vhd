LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY CU_tb IS
END CU_tb;
 
ARCHITECTURE behavior OF CU_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CU
    PORT(
         OP : IN  std_logic_vector(1 downto 0);
         OP3 : IN  std_logic_vector(5 downto 0);
         ALUOP : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal OP : std_logic_vector(1 downto 0) := (others => '0');
   signal OP3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal ALUOP : std_logic_vector(5 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CU PORT MAP (
          OP => OP,
          OP3 => OP3,
          ALUOP => ALUOP
        );


   -- Stimulus process
   stim_proc: process
   begin		
	
		---------------Instrucciones Aritmetico Logicas---------------
		OP<="10";

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
		
		---------------Instrucciones artimetico logicas anun no definidas-------------------
		OP3<="100101";--8. SLL
		wait for 20 ns;
		OP3<="100110";--9. SRL
		wait for 20 ns;
		OP3<="100111";--10.SRA
		wait for 20 ns;
		
		-----------------Otras Instrucciones(aun no definidas)-----------------------
		OP<="00";
		OP3<="010101";
		
      wait;
   end process;

END;
