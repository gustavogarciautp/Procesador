library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MODULOPRINCIPAL is
    Port ( rst : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           ALURESULT : out  STD_LOGIC_VECTOR (31 downto 0));
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
		rst : IN std_logic;
		Instruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT OMUXT
	PORT(
		Crs2 : IN std_logic_vector(31 downto 0);
		SEUimm : IN std_logic_vector(31 downto 0);
		i : IN std_logic;          
		oper2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT RF
	PORT(
		rs1 : IN std_logic_vector(4 downto 0);
		rs2 : IN std_logic_vector(4 downto 0);
		rd : IN std_logic_vector(4 downto 0);
		DWR : IN std_logic_vector(31 downto 0);
		rst : IN std_logic;          
		Crs1 : OUT std_logic_vector(31 downto 0);
		Crs2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT SEU
	PORT(
		imm13 : IN std_logic_vector(12 downto 0);          
		SEUimm : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT ALU
	PORT(
		Oper1 : IN std_logic_vector(31 downto 0);
		Oper2 : IN std_logic_vector(31 downto 0);
		ALUOP : IN std_logic_vector(5 downto 0);          
		ALURESULT : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT CU
	PORT(
		OP : IN std_logic_vector(1 downto 0);
		OP3 : IN std_logic_vector(5 downto 0);          
		ALUOP : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;

signal B0:std_logic_vector(31 downto 0);--Result: conecta al sumador con el DataIn de nPC
signal B1:std_logic_vector(31 downto 0);--DataOut(nPC): conecta al nPC con el DataIn de PC
signal B2:std_logic_vector(31 downto 0);--DataOut(PC): conecta al PC con el address del IM y con el Oper2 de sumador32bits
signal B3:std_logic_vector(31 downto 0);--Instruction: conecta al IM con el CU(OP(31-30),OP3(24-19)),RF((18-14),rs2(4-0),rd(29-25)),
													--SEU(imm13(12-0)) y OMUXT(i(13))
signal B4:std_logic_vector(5 downto 0); --ALUOP: conecta a CU y con la ALU
signal B5:std_logic_vector(31 downto 0);--ALURESULT: conecta a la ALU con el rd del RF, es la salida del Modulo Principal
signal B6:std_logic_vector(31 downto 0);--Crs1: conecta al RF con Oper1 de la ALU
signal B7:std_logic_vector(31 downto 0);--Crs2: conecta al RF con OMUXT
signal B8:std_logic_vector(31 downto 0);--SEUimm: conecta a SEU con OMUXT
signal B9:std_logic_vector(31 downto 0);--Oper2: conecta a OMUXT con el Oper2 de la ALU

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
		rst => rst,
		Instruction =>B3
	);
	
	Inst_OMUXT: OMUXT PORT MAP(
		Crs2 => B7,
		SEUimm => B8,
		i => B3(13),
		oper2 => B9
	);	
	
	Inst_RF: RF PORT MAP(
		rs1 => B3(18 downto 14),
		rs2 => B3(4 downto 0),
		rd => B3(29 downto 25),
		DWR => B5,
		rst => rst,
		Crs1 => B6,
		Crs2 => B7
	);
	
	Inst_SEU: SEU PORT MAP(
		imm13 => B3(12 downto 0),
		SEUimm => B8
	);
	
	Inst_ALU: ALU PORT MAP(
		Oper1 => B6,
		Oper2 => B9,
		ALUOP => B4,
		ALURESULT => B5
	);
	
	Inst_CU: CU PORT MAP(
		OP => B3(31 downto 30),
		OP3 =>B3(24 downto 19) ,
		ALUOP => B4
	);

ALURESULT<=B5;
	
end Behavioral;
