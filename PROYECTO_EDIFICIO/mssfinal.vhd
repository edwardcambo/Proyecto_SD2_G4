library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mssfinal is
    Port(Reset, Clock: in STD_LOGIC;
			hora, start: in STD_LOGIC;
			igual_a_24: in STD_LOGIC;
			modo, enCont, resetCont: out STD_LOGIC;
			enReg1, enReg2, enReg3: out STD_LOGIC;
			estados: out std_logic_vector(3 downto 0));
end mssfinal;

architecture Behavioral of mssfinal is
    type Estado is (Ta,Taa, Tb, Tc1,Tc2, Td1, Td2,Te, Tf,Tg);
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
						y <= Taa;
					else 
						y <=Ta;
					end if;
				when Taa=>
					if start= '1' then
				     y<= Taa;
					 else 
						y<=Tb; 
					 end if;
				when Tb => 
					if hora = '1' then
						y <= Tc1;
					else 
						y <= Tb;
					end if;
				when Tc1=>y<=Tc2;	
				when Tc2 => 
					if igual_a_24 = '1' then
						y <= Tb;
					else 
						y <= Td1;
					end if;
				when Td1 => y<=Td2;	
				when Td2 => y <= Te;
				when Te=> 
					if hora = '1' then
							y <= Tf;
						else 
							y <= Te;
						end if;
				when Tf=>y<=Tg;
				when Tg=> 
					if igual_a_24 = '1' then
						y <= Te;
					else 
						y <= Ta;
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
       when Ta =>
				estados <="0000";
			when Taa =>
				estados <="0001";
			when Tb =>
				estados <="0010";
        when Tc1 =>
            modo <= '1';
				estados <="0011";
        when Tc2 =>
           
            enCont <= '1';
				estados <="0100";	
			when Td1=>
				estados <="0101";
			When Td2 =>
				resetCont <= '1';
				estados <="0110";
			when Te =>
				estados <="0111";
        when Tf =>
            enReg1 <= '1';
            enReg2 <= '1';
            enReg3 <= '1';
				estados <="1000";
        when Tg =>
            enCont <= '1';
				estados <="1001";

        when others =>
				estados <="1010";	
	 end case;
end process;
end Behavioral;