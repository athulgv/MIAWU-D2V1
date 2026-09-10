library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL; 

entity ANDgate_1 is
port (A,B: in STD_LOGIC;
      C: out STD_LOGIC);
end ANDgate_1; 

architecture BEHAVIORAL of ANDgate_1 is
begin
  C <= A AND B;
end BEHAVIORAL;