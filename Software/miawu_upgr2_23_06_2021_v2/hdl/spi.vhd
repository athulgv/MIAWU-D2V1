-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:49:13 06/04/2011 
-- Design Name: 
-- Module Name:    spi - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity spi is
    Port ( rest_enable,rstin,in_1,in_2,in_3,in_4,in_5,in_6,in_7,in_8,in_10,in12: in  STD_LOGIC;
             clock: in  STD_LOGIC;
           RDY  : in std_logic;
           INT : in std_logic;
           sclk,cs,sdata: out  STD_LOGIC);
end spi;

architecture Behavioral of spi is
-- ** address tranfer block **
component switchcheck1 is
    Port ( reset,input1,input2,input3,input4,input5,input6,input7,input8,input9,input10,input11,input12,input13 : in  STD_LOGIC;
			 		        RDY : in std_logic;
                pu : in  STD_LOGIC;
                sp : in  STD_LOGIC;
                sd : in  STD_LOGIC;
                clock:in std_logic;
               
                rd_int : in std_logic;
                path : in std_logic;
			  sdata:out std_logic;
			  cs:out std_logic;
			  sclk:out std_logic);
			 
end component;

component ANDgate_1 is
port (A,B: in STD_LOGIC;
      C: out STD_LOGIC);
end component; 
 --** reset for audio chip **


component stopcom is
    Port ( input,resetn : in  STD_LOGIC;
           clock : in  STD_LOGIC;
           output : out  STD_LOGIC);
end component;

signal ip1,ip2,ip3,ip4,ip5,ip6,ip7,ip8,ip9,ip10,ip11,ip12,ip13:std_logic:='0';
signal ip101,ip102,ip103,ip14,ip15,ip16,ip17,ip18,ip19,ip110,ip111,ip112,ip113:std_logic:='0';
signal input1,input2:std_logic:='0';
signal pui,spl,sdi,cs1,sclk1,sdata1:std_logic:='0';
signal q:std_logic_vector(9 downto 1):="000000000";
signal q1:std_logic_vector(13 downto 1):="0000000000000";
signal in7,in6,in8,in9,in10,in11,in13 :std_logic:='0'; --not using audio index making low.
signal in2,in3,in4,in5,in1 : std_logic:='0'; -- for not start rest of the audio without FPM,

signal enable :std_logic:='0';

signal qintcount :std_logic_vector(5 downto 0):="000000";

signal rstin_sig:std_logic;

signal pu_cnt :std_logic:='1';
signal rd_int,path: std_logic:='0';
begin

-- ** to immidiately power down the audio chip **

rstin_sig <= rstin;

enable1: ANDgate_1 port map(enable,in_2,in2);
enable2: ANDgate_1 port map(enable,in_3,in3);
enable3: ANDgate_1 port map(enable,in_4,in4);
enable4: ANDgate_1 port map(enable,in_5,in5);

----added
enable6: ANDgate_1 port map(enable,in_6,in6);
enable7: ANDgate_1 port map(enable,in_7,in7);
enable8: ANDgate_1 port map(enable,in_8,in8);
enable10: ANDgate_1 port map(enable,in_10,in10);
--

enable5: ANDgate_1 port map(enable,in_1,in1);


stop1: stopcom port map(ip1,rstin_sig,clock,ip101);
stop2: stopcom port map(ip2,rstin_sig,clock,ip102);
stop3: stopcom port map(ip3,rstin_sig,clock,ip103);
stop4: stopcom port map(ip4,rstin_sig,clock,ip14);
stop5: stopcom port map(ip5,rstin_sig,clock,ip15);
stop6: stopcom port map(ip6,rstin_sig,clock,ip16);
stop7: stopcom port map(ip7,rstin_sig,clock,ip17);
stop8: stopcom port map(ip8,rstin_sig,clock,ip18);
stop9: stopcom port map(ip9,rstin_sig,clock,ip19);
stop10: stopcom port map(ip10,rstin_sig,clock,ip110);
stop11: stopcom port map(ip11,rstin_sig,clock,ip111);
stop12: stopcom port map(ip12,rstin_sig,clock,ip112);
stop13: stopcom port map(ip13,rstin_sig,clock,ip113);

-- ** command block **
spi0:switchcheck1 port map(rstin_sig,ip1,ip2,ip3,ip4,ip5,ip6,ip7,ip8,ip9,ip10,ip11,ip12,ip13,RDY,pui,spl,sdi,clock,rd_int,path,sdata1,cs1,sclk1);

-- ** to ensure more than one input is not active at a time **  
-- ** actually this part is not at all required 'cos these signals are coming from priority encoder **  
enable<=rest_enable;
q1<=in1 & in2 & in3 & in4 & in5 & in6 & in7 & in8 & in9 & in10 & in11 & in12 & in13;
process(q1)
begin
case q1 is
when "0000000000001"=>
	ip1<='0';
	ip2<='0';
	ip3<='0';
	ip4<='0';
	ip5<='0';
	ip6<='0';
	ip7<='0';
	ip8<='0';
	ip9<='0';
	ip10<='0';
	ip11<='0';
	ip12<='0';
	ip13<='1';
when "0000000000010"=>
	ip1<='0';
	ip2<='0';
	ip3<='0';
	ip4<='0';
	ip5<='0';
	ip6<='0';
	ip7<='0';
	ip8<='0';
	ip9<='0';
	ip10<='0';
	ip11<='0';
	ip12<='1';
	ip13<='0';
	when "0000000000100" =>
	ip1<='0';
	ip2<='0';
	ip3<='0';
	ip4<='0';
	ip5<='0';
	ip6<='0';
	ip7<='0';
	ip8<='0';
	ip9<='0';
	ip10<='0';
	ip11<='1';
	ip12<='0';
	ip13<='0';
	when "0000000001000"=>
	ip1<='0';
	ip2<='0';
	ip3<='0';
	ip4<='0';
	ip5<='0';
	ip6<='0';
	ip7<='0';
	ip8<='0';
	ip9<='0';
	ip10<='1';
	ip11<='0';
	ip12<='0';
	ip13<='0';
	when "0000000010000" =>
	ip1<='0';
	ip2<='0';
	ip3<='0';
	ip4<='0';
	ip5<='0';
	ip6<='0';
	ip7<='0';
	ip8<='0';
	ip9<='1';
	ip10<='0';
	ip11<='0';
	ip12<='0';
	ip13<='0';
	when "0000000100000"=>
	ip1<='0';
	ip2<='0';
	ip3<='0';
	ip4<='0';
	ip5<='0';
	ip6<='0';
	ip7<='0';
	ip8<='1';
	ip9<='0';
	ip10<='0';
	ip11<='0';
	ip12<='0';
	ip13<='0';
	when "0000001000000" =>
	ip1<='0';
	ip2<='0';
	ip3<='0';
	ip4<='0';
	ip5<='0';
	ip6<='0';
	ip7<='1';
	ip8<='0';
	ip9<='0';
	ip10<='0';
	ip11<='0';
	ip12<='0';
	ip13<='0';
	when "0000010000000"=>
	ip1<='0';
	ip2<='0';
	ip3<='0';
	ip4<='0';
	ip5<='0';
	ip6<='1';
	ip7<='0';
	ip8<='0';
	ip9<='0';
	ip10<='0';
	ip11<='0';
	ip12<='0';
	ip13<='0';
	when "0000100000000" =>
	ip1<='0';
	ip2<='0';
	ip3<='0';
	ip4<='0';
	ip5<='1';
	ip6<='0';
	ip7<='0';
	ip8<='0';
	ip9<='0';
	ip10<='0';
	ip11<='0';
	ip12<='0';
	ip13<='0';
	when "0001000000000"=>
	ip1<='0';
	ip2<='0';
	ip3<='0';
	ip4<='1';
	ip5<='0';
	ip6<='0';
	ip7<='0';
	ip8<='0';
	ip9<='0';
	ip10<='0';
	ip11<='0';
	ip12<='0';
	ip13<='0';
	when "0010000000000" =>
	ip1<='0';
	ip2<='0';
	ip3<='1';
	ip4<='0';
	ip5<='0';
	ip6<='0';
	ip7<='0';
	ip8<='0';
	ip9<='0';
	ip10<='0';
	ip11<='0';
	ip12<='0';
	ip13<='0';
	when "0100000000000"=>
	ip1<='0';
	ip2<='1';
	ip3<='0';
	ip4<='0';
	ip5<='0';
	ip6<='0';
	ip7<='0';
	ip8<='0';
	ip9<='0';
	ip10<='0';
	ip11<='0';
	ip12<='0';
	ip13<='0';
	when "1000000000000"=>
	ip1<='1';
	ip2<='0';
	ip3<='0';
	ip4<='0';
	ip5<='0';
	ip6<='0';
	ip7<='0';
	ip8<='0';
	ip9<='0';
	ip10<='0';
	ip11<='0';
	ip12<='0';
	ip13<='0';
	when others=>
	ip1<='0';
	ip2<='0';
	ip3<='0';
	ip4<='0';
	ip5<='0';
	ip6<='0';
	ip7<='0';
	ip8<='0';
	ip9<='0';
	ip10<='0';
	ip11<='0';
	ip12<='0';
	ip13<='0';
end case;
end process;


-- ** reset for audio **
input2<=ip101 or ip102 or ip103 or ip14 or ip15 or ip16 or ip17 or ip18 or ip19 or ip110 or ip111 or ip112 or ip113;
-- ** input for audio  **
input1<=ip1 or ip2 or ip3 or ip4 or ip5 or ip6 or ip7 or ip8 or ip9 or ip10 or ip11 or ip12 or ip13;

-- ** activating the signals (power up(pui) ,powerdown(sdi),plackback(spl) and a delay of minimum 100msec is given in between them **
process(clock,rstin,input1,input2,q,qintcount,INT)
begin
--immediate reset for audio
    
  if input2='1' or rstin = '0' then --and  q1="00000" and pq1="00000" and q_path ="00000" and q_rdint ="00000" then
                
        q<="000000000";
        sdi<='1';
        pui<='0';
        spl<='0';
        qintcount <="000000";
        rd_int <= '0';
        path <='0';
        pu_cnt <='1';

  elsif clock'event and clock='1' then
         if q/="111111111" and input1='1' and qintcount ="000000" then
            q<=q+'1';
   
        end if;
-- 0 to 16 sec power down switch will become active. after zero.
 if q>="000001010" and q<"000011001" then
            sdi<='1';
        else
            sdi<='0';
        end if;

-- after delay >100 ms  power up switch will become active stays high for 16 clock cycle
--then becomes zero

        if q>="001111101" and q<"010001100" then
            pui<='1';
        else 
            pui<='0';
        end if;


-- after delay >100 ms play switch will become active stays high for 16 clock cycle
--then becomes zero


----------------------------------------------------
----=====================-------------------------------------------------
        if INT ='0' and input1='1'  and q >"011101111" then -- "010010011" then --"011111111" then --en1 ='1' then --;--pu_cnt ='0' then
                    qintcount<=qintcount+'1';
                if  qintcount = "100111" then    --afte pu
                    qintcount <="000000";
                end if; 
                if qintcount >="000100" and qintcount <="011100"  then

                    rd_int<='1';
               
                else 
                    rd_int <='0';
           
                end if;
        elsif INT ='1' then
            qintcount <="000000";                                                                                  
        end if;

---================
---================

----
---- set playbachk path after 1 st PUI
 
            if q>="011001111" and q < "011100111" and pu_cnt ='1' then --and INT ='1'then
                    path<='1';
            elsif q>="100010000" and q <= "100101000"  and INT ='1'then-- mar7
      
                    spl<='1';
            elsif q >"100101111" and INT ='0' and input1 ='1' then
                 q<="100001110" ;   
                pu_cnt<='0';

            else
                    path<='0';
                    spl<='0';
            end if;

end if;



end process;
sdata<=sdata1 ;-- ** mosi **
cs<=cs1;-- ** ss chip select **
sclk<=sclk1;-- ** sclk **

end Behavioral;

