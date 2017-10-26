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
		rs1 : IN std_logic_vector(5 downto 0);
		rs2 : IN std_logic_vector(5 downto 0);
		rd : IN std_logic_vector(5 downto 0);
		DWR : IN std_logic_vector(31 downto 0);
		rst : IN std_logic;
		WE : IN std_logic;          
		Crs1 : OUT std_logic_vector(31 downto 0);
		Crs2 : OUT std_logic_vector(31 downto 0);
		Crd : OUT std_logic_vector(31 downto 0)
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
	   C : IN std_logic;
		ALURESULT : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT CU
	PORT(
		OP : IN std_logic_vector(1 downto 0);
		OP2 : IN std_logic_vector(2 downto 0);
		Cond : IN std_logic_vector(3 downto 0);
		icc : IN std_logic_vector(3 downto 0);
		OP3 : IN std_logic_vector(5 downto 0);          
		WE : OUT std_logic;
		RFDEST : OUT std_logic;
		RFSOURCE : OUT std_logic_vector(1 downto 0);
		WRENMEM : OUT std_logic;
		--RDENMEM : OUT std_logic;
		PCSOURCE : OUT std_logic_vector(1 downto 0);
		ALUOP : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;

	COMPONENT PSRModifier
	PORT(
		ALUOP : IN std_logic_vector(5 downto 0);
		Oper2 : IN std_logic_vector(31 downto 0);
		Oper1 : IN std_logic_vector(31 downto 0);
		ALURESULT : IN std_logic_vector(31 downto 0);          
		NZVC : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	COMPONENT PSR
	PORT(
		NZVC : IN std_logic_vector(3 downto 0);
		nCWP : IN std_logic;
		CLK : IN std_logic;
		rst : IN std_logic;          
		icc : OUT std_logic_vector(3 downto 0);
		CWP : OUT std_logic;
		C : OUT std_logic
		);
	END COMPONENT;

	COMPONENT WindowsManager
	PORT(
		rs1 : IN std_logic_vector(4 downto 0);
		rs2 : IN std_logic_vector(4 downto 0);
		rd : IN std_logic_vector(4 downto 0);
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);
		CWP : IN std_logic;          
		nRs1 : OUT std_logic_vector(5 downto 0);
		nRs2 : OUT std_logic_vector(5 downto 0);
		nRd : OUT std_logic_vector(5 downto 0);
		nCWP : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT DataMemory
	PORT(
		Crd : IN std_logic_vector(31 downto 0);
		Address : IN std_logic_vector(31 downto 0);
		WRENMEM : IN std_logic;
		--RDENMEM : IN std_logic;          
		DATATOMEM : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT MUX_PCSOURCE
	PORT(
		PCdisp30 : IN std_logic_vector(31 downto 0);
		PCSEUdisp22 : IN std_logic_vector(31 downto 0);
		ALURESULT : IN std_logic_vector(31 downto 0);
		PC : IN std_logic_vector(31 downto 0);
		PCSOURCE : IN std_logic_vector(1 downto 0);          
		nPC : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT MUX_RFDEST
	PORT(
		RD : IN std_logic_vector(5 downto 0);
		RFDEST : IN std_logic;          
		nRD : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;

	COMPONENT MUX_RFSOURCE
	PORT(
		RFSOURCE : IN std_logic_vector(1 downto 0);
		DATATOMEM : IN std_logic_vector(31 downto 0);
		ALURESULT : IN std_logic_vector(31 downto 0);
		PC : IN std_logic_vector(31 downto 0);          
		DATATOREG : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT SEUdisp22
	PORT(
		disp22 : IN std_logic_vector(21 downto 0);          
		SEUdisp22 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT SEUdisp30
	PORT(
		disp30 : IN std_logic_vector(29 downto 0);          
		SEUdisp30 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

signal B0:std_logic_vector(31 downto 0);--Result: conecta al sumador32bits con el PC(entrada) de MUXPCSOURCE
signal B1:std_logic_vector(31 downto 0);--DataOut(nPC): conecta al nPC con el DataIn de PC
signal B2:std_logic_vector(31 downto 0);--DataOut(PC): conecta al PC con el address del IM, con el Oper1 de sumador32bitsdisp22 y con el Oper2 de sumador32bitsdisp30
signal B3:std_logic_vector(31 downto 0);--Instruction: conecta al IM con el CU(OP(31-30),OP3(24-19),Cond(28-25)),WindowManager(rs1(18-14),rs2(4-0),rd(29-25)),
													--SEU(12-0),OMUXT(13), SEUdisp22(21-0) y sumador32bitsdisp30(29-0)
signal B4:std_logic_vector(5 downto 0); --ALUOP: conecta a CU y a la ALU
signal B5:std_logic_vector(31 downto 0);--ALURESULT: conecta a la ALU con el Address del DataMemory, con el ALURESULT de MUXRFSOURCE y con el ALURESULT de MUXPCSOURCE, es la salida del Modulo Principal
signal B6:std_logic_vector(31 downto 0);--Crs1: conecta al RF con Oper1 de la ALU
signal B7:std_logic_vector(31 downto 0);--Crs2: conecta al RF con OMUXT
signal B8:std_logic_vector(31 downto 0);--SEUimm: conecta a SEU con OMUXT
signal B9:std_logic_vector(31 downto 0);--Oper2: conecta a OMUXT con el Oper2 de la ALU
signal B10: std_logic; --Carry: conecta al PSR y a la ALU
signal B11: std_logic_vector(3 downto 0);--NZVC: conecta al PSRModifier con el PSR
signal B12: std_logic_vector(17 downto 0);--InstructionWM: conecta al Windows Manager con el RegisterFile(rs1(17-12),rs2(11-6)) y  MUXRFDEST(RD(5-0))
signal B13: std_logic;--CWP: conecta al PSR con el WindowsManager
signal B14: std_logic;--nCWP: conecta al WindowsManager con el PSR
signal B15: std_logic_vector(5 downto 0);--rd(nRD): conecta al MUXRFDEST con el rd del Register File
signal B16: std_logic_vector(31 downto 0);--SEUdisp22(entrada): conecta al SEUdisp22(Modulo) con el Oper2 de sumador32bitsdisp22
signal B17: std_logic_vector(31 downto 0);--Result: conecta al sumador32bitsdisp30 con el PCdisp30 de MUXPCSOURCE
signal B18: std_logic_vector(31 downto 0);--Result: conecta al sumador32bitsdisp22 con el PCSEUdisp22 del MUXPCSOURCE
signal B19: std_logic;--RFDEST: conecta a la UC con el RFDEST DE MUXRFDEST
signal B20: std_logic_vector(1 downto 0);--RFSOURCE: conecta a la UC con el RFSOURCE de MUXRFSOURCE
signal B21: std_logic;--WRENMEM conecta a la UC con el WRENMEM del DataMemory; 
signal B22: std_logic_vector(31 downto 0);----SEUdisp30(entrada): conecta al SEUdisp30(Modulo) con el Oper2 de sumador32bitsdisp30
signal B23: std_logic;--WE: conecta a la UC con el WE del Register File
signal B24: std_logic_vector(31 downto 0);--Crd: conecta al Register File con el Crd del DataMemory
signal B25: std_logic_vector(31 downto 0);--DATATOMEM: conecta al DataMemory con el DATATOMEM del MUXRFSOURCE
signal B26: std_logic_vector(31 downto 0);--DATATOREG: conecta al MUXRFSOURCE con el DWR del Register File
signal B27: std_logic_vector(3 downto 0); --icc: Conecta al PSR con el icc de la UC
signal B28: std_logic_vector(1 downto 0);--PCSOURCE: conecta a la UC con el PCSOURCE DE MUXPCSOURCE
signal B29: std_logic_vector(31 downto 0);--nPC(Salida): Conecta al MUXPCSOURCE con el nPC(Modulo)

begin

	Inst_PC: PC PORT MAP(
		rst => rst,
		dataIn => B1,
		CLK => CLK,
		DataOut => B2
	);
	
	Inst_Sumador32bitsdisp30: Sumador32bits PORT MAP(
		Oper1 => B22,
		Oper2 => B2,
		Result => B17
	);
	
	Inst_Sumador32bitsdisp22: Sumador32bits PORT MAP(
		Oper1 => B2,
		Oper2 => B16,
		Result => B18
	);
	
	Inst_Sumador32bits: Sumador32bits PORT MAP(
		Oper1 => "00000000000000000000000000000001",
		Oper2 => B1,
		Result => B0
	);
	
	Inst_nPC: PC PORT MAP(
		rst => rst,
		CLK => CLK,
		DataIn => B29,
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
		rs1 => B12(17 downto 12),
		rs2 => B12(11 downto 6),
		rd => B15,
		DWR => B26,
		rst => rst,
		WE => B23,
		Crs1 => B6,
		Crs2 => B7,
		Crd => B24
	);
	
	Inst_SEU: SEU PORT MAP(
		imm13 => B3(12 downto 0),
		SEUimm => B8
	);
	
	Inst_SEUdisp22: SEUdisp22 PORT MAP(
		disp22 => B3(21 downto 0),
		SEUdisp22 => B16
	);
	
	Inst_SEUdisp30: SEUdisp30 PORT MAP(
		disp30 => B3(29 downto 0),
		SEUdisp30 => B22
	);
	
	Inst_ALU: ALU PORT MAP(
		Oper1 => B6,
		Oper2 => B9,
		ALUOP => B4,
		C => B10,
		ALURESULT => B5
	);
	
	Inst_CU: CU PORT MAP(
		OP => B3(31 downto 30),
		OP2 => B3(24 downto 22),
		Cond => B3(28 downto 25),
		icc => B27,
		OP3 => B3(24 downto 19) ,
		WE => B23,
		RFDEST => B19,
		RFSOURCE => B20,
		WRENMEM => B21,
		--RDENMEM => B22,
		PCSOURCE => B28,
		ALUOP => B4
	);
	
	Inst_PSRModifier: PSRModifier PORT MAP(
		ALUOP => B4,
		Oper2 => B9,
		Oper1 => B6,
		ALURESULT => B5,
		NZVC => B11
	);
	
	Inst_PSR: PSR PORT MAP(
		NZVC => B11,
		nCWP => B14,
		CLK => CLK,
		rst => rst,
		icc => B27,
		CWP => B13,
		C => B10
	);
	
	Inst_WindowsManager: WindowsManager PORT MAP(
		rs1 => B3(18 downto 14),
		rs2 => B3(4 downto 0),
		rd => B3(29 downto 25),
		op => B3(31 downto 30),
		op3 =>B3(24 downto 19) ,
		CWP => B13,
		nRs1 => B12(17 downto 12),
		nRs2 => B12(11 downto 6),
		nRd => B12(5 downto 0),
		nCWP => B14
	);
	
	Inst_DataMemory: DataMemory PORT MAP(
		Crd => B24,
		Address => B5,
		WRENMEM => B21,
		--RDENMEM => B22,
		DATATOMEM => B25
	);
	
	Inst_MUX_PCSOURCE: MUX_PCSOURCE PORT MAP(
		PCdisp30 => B17,
		PCSEUdisp22 => B18,
		ALURESULT => B5,
		PC => B0,
		PCSOURCE => B28,
		nPC => B29
	);
	
	Inst_MUX_RFDEST: MUX_RFDEST PORT MAP(
		RD => B12(5 downto 0),
		RFDEST => B19,
		nRD => B15
	);
	
	Inst_MUX_RFSOURCE: MUX_RFSOURCE PORT MAP(
		RFSOURCE => B20,
		DATATOMEM => B25,
		ALURESULT => B5,
		PC => B2,
		DATATOREG => B26
	);

ALURESULT<=B5;
	
end Behavioral;

