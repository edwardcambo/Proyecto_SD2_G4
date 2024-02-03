library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MSS3 is
    Port(Reset, Clock: in STD_LOGIC;
			hora, start: in STD_LOGIC;
			igual_a_24: in STD_LOGIC;
			modo, enCont, resetCont: out STD_LOGIC;
			enReg1, enReg2, enReg3: out STD_LOGIC);
end MSS3;

architecture Behavioral of MSS3 is
    type Estado is (Ta,Taa, Tb, Tc, Td,Te, Tf,Tg);
    signal y: estado;
    	
begin
process (Reset, Clock)
	begin 
		if Reset = '0' then 
			y <= Ta;
		elsif rising_edge(clock) then
			case y is
				when Ta => 
					if start = '1' then
						y <= Tb;
					else 
						y <=Ta;
					end if;
				when Taa=>
					if start= '1' then
				     y<= Taa;
					 else y<=tb; 
					 end if;
				when Tb => 
					if hora = '1' then
						y <= Tc;
					else 
						y <= Tb;
					end if;
				when Tc => 
					if igual_a_24 = '1' then
						y <= Td;
					else 
						y <= Tb;
					end if;
				when Td => y <= Te;
				when Te=> 
					if hora = '1' then
							y <= Tf;
						else 
							y <= Tb;
						end if;
				when Tf=>y<=Tg;
				when Tg=> 
					if igual_a_24 = '1' then
						y <= Ta;
					else 
						y <= Te;
					end if;
				
				
			end case;
		end if;
	end process;
	
	process (y)
	begin

   modo <= '0';
   enCont <= '0';
   resetCont <= '0';
   enReg1 <= '0';
   enReg2 <= '0';
   enReg3 <= '0';

    case y is
        when Tc =>
            modo <= '1';
            enCont <= '1';
        when Td =>
				resetCont <= '1';
        when Tf =>
				enReg1 <= '1';
            enReg2 <= '1';
            enReg3 <= '1';
			when Tg=>
            enCont <= '1';
        when others =>
    end case;
end process;
end Behavioral;