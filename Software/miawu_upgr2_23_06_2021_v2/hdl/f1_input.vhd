 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity f1_input is
port (
    clock_1sec          : IN  std_logic;              --  8hz clock pulse
	input               : in std_logic;
    ready1              : in std_logic:='0';
    counter_enable      : in std_logic:='0';
    fault_asserted      : out  std_logic              --  out put signal

);
end f1_input;


architecture arc of f1_input is
    signal temp1:std_logic;

begin

p1 :  process(clock_1sec,ready1)


begin 


                
        if ready1='0' then
                        temp1 <='0';
        elsif(clock_1sec'event and clock_1sec ='1') then
            if counter_enable ='1' then
                if (input = '0' ) then
                        temp1 <= '0';                                   
                else            
                        temp1<=  '1';
                end if;
            end if;
       end if;


        end process p1;



        
fault_asserted <= temp1;     




end arc;
