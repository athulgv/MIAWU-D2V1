--This is for FPM first time latching. This is the first signal produced after FPM 
--is pressed,this will remain high for the rest of the program,this can be reset only 
--by end of the program

library ieee;
use ieee. std_logic_1164.all;
use ieee. std_logic_arith.all;
use ieee. std_logic_unsigned.all;
 
entity fpm_switch_chk is
PORT    (   clockin : in std_logic;
            fpml   : in std_logic :='1';
            Q       : out std_logic :='0'
            
        );
end fpm_switch_chk;
 
architecture behavioral of fpm_switch_chk is

signal a1:std_logic_vector(9 downto 0):="0000000000";
signal b1:std_logic :='0';

--signal D1: std_logic:='0';
begin
process(CLOCKin,fpml)
begin
    if(CLOCKin='1' and CLOCKin'EVENT and fpml='1') then

         if( a1 = "0000001111") then
            b1 <= '1';
            a1 <= "0000000000";
        else
            a1 <= a1 +1;
        end if;
    end if;
end process;
process(fpml)
begin 

    if(fpml ='0') then 
         b1 <= '0';
         a1 <= "0000000000";
       end if;
end process;
Q<=b1;
end behavioral;