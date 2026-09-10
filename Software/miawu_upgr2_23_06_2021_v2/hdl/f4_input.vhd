
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity f4_input is
port (
    clock_1sec          : IN  std_logic;                    --  1hz clock pulse
	input               : in std_logic;                     --  input signal
    ack_in              : in std_logic:='0';                --  ack inout
    priority            : in std_logic;
    ready1              : in std_logic:='0';
    counter_enable      : in std_logic:='0';
    cwp_input           : in std_logic; 
    fault_asserted      : out std_logic :='0'     --  For playing fpm music.
);
end f4_input;


architecture arc of f4_input is
    signal counterValue : std_logic_vector(6 downto 0):="0000000";
    signal temp1:std_logic:='0';
    signal temp2:std_logic:='0';

    signal cont_tem:std_logic:='0';
    signal counterValue1 : std_logic_vector(4 downto 0):="00000";

begin

p1 :  process(clock_1sec,input,counterValue,ack_in,cont_tem,ready1,counter_enable)


begin 


      
    if (ready1 ='0' or counter_enable ='0') then
                    temp1 <='0';
                    temp2 <='0';
                    
    elsif clock_1sec'event and clock_1sec ='1' then 
       
               if input = '0' and temp1 = '0' then
                   counterValue <= "0000000";
                   temp2 <= '0';
             
              elsif (counterValue ="1111000" and temp2 ='0') then                  -- not true first,when counterValue ="00100" then this condition will loop
                   counterValue <= counterValue;
                   temp1<= '1';                                     --when tem high output high.
                   temp2 <= '1';

              elsif(ack_in ='1' and cont_tem = '1' and temp2 = '1') then     -- if not adding counterValue = "100" code wont work.
                    temp1 <='0';

              elsif( input ='1' and temp2 ='0') then
                  counterValue <= counterValue +1;
              end if;
       end if;
            
     
 end process p1;





        
fault_asserted <= temp1 and not cwp_input;     --  till press ACK ,fault asst will be high.


p2 : process(clock_1sec,priority,counterValue1)


begin 
            if clock_1sec'event and clock_1sec ='1' then  
                    if priority = '0' then
                        counterValue1 <= "00000";
                        cont_tem <= '0';
    
                    elsif (counterValue1 ="00010") then                  -- not true first,when counterValue ="00100" then this condition will loop
                            counterValue1 <= counterValue1;
                            cont_tem<= '1'; 
            
                    else
                            counterValue1 <= counterValue1 +1;
                            cont_tem <= '0';
                    end if;

            end if;



end process p2;



   -- architecture body
end arc;
