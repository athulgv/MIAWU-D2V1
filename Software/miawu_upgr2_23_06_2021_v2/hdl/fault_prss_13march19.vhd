
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity fpm_input is
port (
    clock_1sec           : IN  std_logic;                    --  1hz clock pulse
	fpm_in               : in std_logic;                     --  input signal
    ack_in               : in std_logic:='0';                --  ack inout
    ready1               : in std_logic:='0';     	         -- It will be zero for 5sec after that it will be 1
    fault_asserted       : out std_logic :='0';              --  For playing fpm music.
    rest_enable          :out std_logic:='0'                 --  for enable the other music, after ack and  fpm priority high then enable audio.
);
end fpm_input;


architecture arc of fpm_input is
    signal counterValue : std_logic_vector(4 downto 0):="00000";
    signal temp1:std_logic:='0';
    signal temp2:std_logic:='0';
    signal rest_enable_sig,message_on:std_logic;

begin

p1 :  process(clock_1sec,ready1)


begin 
       
       
       
            
        if (ready1 ='0') then   --It will be zero for 5sec after that it will be 1. its initialization.
                        temp1 <='0';
                        counterValue <= "00000";
                        rest_enable_sig <='0';
                        message_on <= '0';
        elsif(clock_1sec'event and clock_1sec ='1') then
                    
                    if rest_enable_sig = '1' then
                        temp1 <='0';
                        rest_enable_sig <='1';
                        counterValue <= "00000";
                        message_on <= '0';
                    elsif ack_in = '1' and message_on ='1' then
                        rest_enable_sig <='1';
                        temp1 <= '0'; 
                        counterValue <= "00000";
                    elsif message_on = '1' then
                        temp1 <= '1'; 
                    elsif  (counterValue ="00001") then         
                        counterValue <= counterValue;
                        message_on <= '1';
                    elsif   (fpm_in ='1' and rest_enable_sig = '0') then
                        counterValue <= counterValue +1;                 
                        temp1 <= '0';
                    end if;          
        end if;


end process p1;




        
rest_enable <= rest_enable_sig;

fault_asserted <=  temp1;    




end arc;
                                                                                    