----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:49:30 06/04/2011 
-- Design Name: 
-- Module Name:    stopcom - Behavioral 
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

entity stopcom is
    Port ( input,resetn : in  STD_LOGIC;
           clock : in  STD_LOGIC;
           output : out  STD_LOGIC);
end stopcom;
--FOR IMMIDIETLY stop the  AUDIO
architecture Behavioral of stopcom is
signal input_F1,input_F2:std_logic:='0';


begin
-- ** detecting the negative event of input **
process(resetn,clock)
begin




		if resetn='0' then
				input_F1<='0';
				input_F2<='0';
		elsif clock'event and clock='0' then

				input_F1 <= input;
				input_F2 <= input_F1;
		end if;


end process;

output<=not input_F1 and input_F2;

end Behavioral;

