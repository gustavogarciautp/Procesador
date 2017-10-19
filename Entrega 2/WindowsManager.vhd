library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
entity WindowsManager is
    Port ( rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           CWP : in  STD_LOGIC:='0';
           nRs1 : out  STD_LOGIC_VECTOR (5 downto 0);
           nRs2 : out  STD_LOGIC_VECTOR (5 downto 0);
           nRd : out  STD_LOGIC_VECTOR (5 downto 0);
			  nCWP : out  STD_LOGIC:='0');
end WindowsManager;

architecture Behavioral of WindowsManager is

begin
process(rs1,rs2,rd,op,op3,CWP)
begin

if(CWP='0') then
	nRs1<='0'&rs1;
	nRs2<='0'&rs2;
	nRd<='0'&rd;
else
------------------rs1------------------
	if(rs1>=24 and rs1<=31) then
		nRs1<=rs1-"010000";
	elsif((rs1>=16 and rs1<=23) or (rs1>=8 and rs1<=15)) then
		nRs1<=rs1+"010000";
	else
		nRs1<='0'&rs1;
	end if;
-----------------rs2----------------------
	if(rs2>=24 and rs2<=31) then
		nRs2<=rs2-"010000";
	elsif((rs2>=16 and rs2<=23) or (rs2>=8 and rs2<=15)) then
		nRs2<=rs2+"010000";
	else
		nRs2<='0'&rs2;
	end if;
-----------------rd-------------------------	
	if(rd>=24 and rd<=31) then
		nRd<=rd-"010000";
	elsif((rd>=16 and rd<=23)or(rd>=8 and rd<=15)) then
		nRd<=rd+"010000";
	else
		nRd<='0'&rd;
	end if;
end if;
	
if((op="10") and (op3="111100" or  op3="111101")) then --SAVE or Restore
	nCWP<=not(CWP);
	if (CWP='1') then
		nRd<='0'&rd;
	else
		if(rd>=24 and rd<=31) then
			nRd<=rd-"010000";
		elsif((rd>=16 and rd<=23) or (rd>=8 and rd<=15)) then
			nRd<=rd+"010000";
		else
			nRd<='0'&rd;
		end if;
	end if;
else
	nCWP<=CWP;
end if;

end process;

end Behavioral;

