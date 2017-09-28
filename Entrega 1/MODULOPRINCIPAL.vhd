library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MODULOPRINCIPAL is
    Port ( rst : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Instruction : out  STD_LOGIC_VECTOR (31 downto 0));
end MODULOPRINCIPAL;

architecture Behavioral of MODULOPRINCIPAL is

	COMPONENT PC
	PORT(
		rst : IN std_logic;
		dataIn : IN std_logic_vector(31 downto 0);
		CLK : IN std_logic;          
		DataOut : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Sumador32bits
	PORT(
		Oper1 : IN std_logic_vector(31 downto 0);
		Oper2 : IN std_logic_vector(31 downto 0);          
		Result : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT InstructionMemory
	PORT(
		Address : IN std_logic_vector(5 downto 0);          
		Instruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

signal B0:std_logic_vector(31 downto 0);
signal B1:std_logic_vector(31 downto 0);
signal B2:std_logic_vector(31 downto 0);

begin

	Inst_PC: PC PORT MAP(
		rst => rst,
		dataIn => B1,
		CLK => CLK,
		DataOut => B2
	);
	
	Inst_Sumador32bits: Sumador32bits PORT MAP(
		Oper1 => "00000000000000000000000000000001",
		Oper2 => B2,
		Result => B0
	);
	
	Inst_nPC: PC PORT MAP(
		rst => rst,
		CLK => CLK,
		DataIn => B0,
		DataOut => B1
	);
	
	Inst_InstructionMemory: InstructionMemory PORT MAP(
		Address => B2(5 downto 0),
		Instruction =>Instruction
	);
	
end Behavioral;

