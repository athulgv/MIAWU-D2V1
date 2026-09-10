  

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity f9_input is
port (
    clock_1sec          : IN  std_logic;                    --  1hz clock pulse
	input               : in std_logic;                     --  input signal
    ack_in              : in std_logic;                --  ack inout
    priority            : in std_logic;
    ready1              : in std_logic;
    counter_enable      : in std_logic;
    cwp_input           : in std_logic; 
    fault_asserted      : out std_logic     --  For playing fpm music.
);
end f9_input;


architecture arc of f9_input is
    signal counterValue : std_logic_vector(6 downto 0);
    signal stop_count:std_logic;
    signal temp2:std_logic;

    signal delay_done,fault_sig,reset_flag:std_logic;
    signal counterValue1 : std_logic_vector(4 downto 0);

begin

p1 :  process(clock_1sec,ready1)


begin 


      
      if (ready1 ='0') then
                    delay_done <='0';
                    fault_sig <= '0';
                    counterValue <= "0000000";
      elsif clock_1sec'event and clock_1sec ='1' then 
        if counter_enable = '1' then
                if(ack_in ='1' and delay_done = '1' and priority ='1' ) then  
                    fault_sig <= '1';
                elsif input = '0' and fault_sig = '1' then
                    counterValue <= "0000000";
                    delay_done<= '0';
                    fault_sig <= '0';
                elsif input = '0'  then
                    counterValue <= "0000000";
                elsif fault_sig  = '1' then
                    counterValue <= "0000000";
                    delay_done<= '0';
                elsif (counterValue ="0101000") then               
                    counterValue <= counterValue;
                    delay_done<= '1';
                elsif( input ='1' and delay_done ='0') then
                    counterValue <= counterValue +1;
                end if;
        end if;
       end if;

    

            
     
 end process p1;

fault_asserted <= delay_done and not cwp_input;     --  till press ACK ,fault asst will be high.



   -- architecture body
end arc;
