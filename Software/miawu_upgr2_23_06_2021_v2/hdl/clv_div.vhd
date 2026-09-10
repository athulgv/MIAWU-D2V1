
--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: <Filename>
-- File history:
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--
-- Description: 
--
-- <Description here>
--
-- Targeted device: <Family> <Die> <Package>
-- Author: <Name>
--
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clkdiv is
port(
    clkin : in std_logic;
    clkout1: out std_logic;
    clkout3: out std_logic;
    clkout2: out std_logic
);
end clkdiv;


architecture c1 of clkdiv is

signal q10:std_logic_vector(9 downto 0):="0000000000";
signal a1 ,b1,a2,b2,a3,b3: std_logic:='0';
signal q9:std_logic_vector(14 downto 0):="000000000000000";
signal q11:std_logic_vector(14 downto 0):="000000000000000";


begin

process(clkin)
 begin
 
  if clkin'event and clkin = '1' then
--------------------------------------------- 
--divide by 8k clk  --32Khz extenal crystal--  
-- 4Hz 125ms ---
---------------------------------------------
        if( q9 =  "111110100000") then  
            a1<= not b1;
            q9 <= "000000000000000";
        else
            q9<= q9 +1;
        end if;
-------------------------------------------
--------------------------------------------- 
--1066 Hz--
--divide by 32 clk  32Khz extenal crystal   
---------------------------------------------

        if( q10 = "0000001111") then
            a2<= not b2;
            q10 <= "0000000000";
        else
            q10<= q10 +1;
        end if;
---------------------------------------------------------- 

-----1 hz---
  if( q11 =  "011111010000000") then  
            a3<= not b3;
            q11 <= "000000000000000";
        else
            q11<= q11 +1;
        end if;


 end if;
    b1 <= a1;
    b2 <= a2;   
    b3 <= a3;
    clkout1 <= a1;
    clkout2 <= a2;
    clkout3 <= a3;
end process;
 end  c1; 




