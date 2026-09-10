library IEEE;
use IEEE.STD_LOGIC_1164.all;      
use ieee.numeric_std.all;

entity priority_encoder_8_3 is
     port(
         din : in STD_LOGIC_VECTOR(23 downto 0) :=(others => '0');
         dout : out STD_LOGIC_VECTOR(4 downto 0)
         );
end priority_encoder_8_3;


architecture priority_enc_arc of priority_encoder_8_3 is
begin

    pri_enc : process (din) is
    begin


        if (din(23)='1') then  --highest priority
            dout <= "00000";
        elsif (din(22)='1') then
            dout <= "00001";
        elsif (din(21)='1') then
            dout <= "00010";
        elsif (din(20)='1') then
            dout <= "00011";
        elsif (din(19)='1') then
            dout <= "00100";
        elsif (din(18)='1') then
            dout<= "00101";
        elsif (din(17)='1') then
            dout <= "00110";
        elsif (din(16)='1') then
            dout <= "00111";    
        elsif (din(15)='1') then  
            dout <= "01000";
        elsif (din(14)='1') then
            dout <= "01001";
        elsif (din(13)='1') then
            dout <= "01010";
        elsif (din(12)='1') then
            dout <= "01011";
        elsif (din(11)='1') then
            dout <= "01100";
        elsif (din(10)='1') then
            dout<= "01101";
        elsif (din(9)='1') then
            dout <= "01110";
        elsif (din(8)='1') then
            dout <= "01111";    
        elsif (din(7)='1') then 
            dout <= "10000";
        elsif (din(6)='1') then
            dout <= "10001";
        elsif (din(5)='1') then
            dout <= "10010";
        elsif (din(4)='1') then
            dout <= "10011";
        elsif (din(3)='1') then
            dout <= "10100";
        elsif (din(2)='1') then
            dout<= "10101";
        elsif (din(1)='1') then
            dout <= "10110";
        elsif (din(0)='1') then
            dout <= "10111";    --lowest priority,connected to tem high internal signal.
        end if;
    end process pri_enc;

 
    

end priority_enc_arc;