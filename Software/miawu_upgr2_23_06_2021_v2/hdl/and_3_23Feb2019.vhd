----import std_logic from the IEEE library
--library ieee;
--use ieee.std_logic_1164.all;
--
----ENTITY DECLARATION: name, inputs, outputs
--entity andGate is					
   --port( A, B : in std_logic;
            --C : out std_logic);
--end andGate;
--
----FUNCTIONAL DESCRIPTION: how the AND Gate works
--architecture func of andGate is 
--begin
  --C <= A and B;		
--end func;
--------------------------------------------------------END
--------------------------------------------------------END

library IEEE;
use ieee.std_logic_1164.all;

entity andGate is 
   port( A1 : in std_logic;
         B1, B2, B3, B4, B5, B6, B7, B8 : in std_logic;
          C1, C2, C3, C4, C5, C6, C7, C8 : out std_logic);
end andGate;

architecture func of andGate is 
begin
   C1 <= A1 and B1;
C2 <= A1 and B2;
C3 <= A1 and B3;
C4 <= A1 and B4;
C5 <= A1 and B5;
C6 <= A1 and B6;
C7 <= A1 and B7;
C8 <= A1 and B8;
end func;



