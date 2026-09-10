--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: FD.vhd
-- File history:
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--
-- Description: 
--
-- <Description here>
--
-- Targeted device: <Family::IGLOO2> <Die::M2GL005> <Package::144 TQ>
-- Author: <Name>
--
--------------------------------------------------------------------------------

library ieee;
use ieee. std_logic_1164.all;
use ieee. std_logic_arith.all;
use ieee. std_logic_unsigned.all;
 
entity D_FF is
PORT    (   D       : in std_logic;
            reset   : in std_logic;
            CLOCK   : in std_logic;
            Q       : out std_logic
            
        );
end D_FF;
 
architecture behavioral of D_FF is


--signal D1: std_logic:='0';
begin
process(CLOCK,reset)
begin
    if reset = '1' then
        q <= '0';
    elsif(CLOCK='1' and CLOCK'EVENT) then
        Q<=D;
    end if;
end process;
end behavioral;


library ieee;
use ieee. std_logic_1164.all;
use ieee. std_logic_arith.all;
use ieee. std_logic_unsigned.all;
 
entity FF_R is
PORT(   D,CLOCK,reset: in std_logic;
        Q: out std_logic);
end FF_R;
 
architecture behavioral of FF_R is
begin
process(CLOCK,reset)
begin
  if reset ='1' then
    Q<='0';
  elsif(CLOCK='1' and CLOCK'EVENT) then
    Q<=D;
    end if;
end process;
end behavioral;

--------------------------------------------------------------------------------------
--- count 8 clock pulses
-----
library ieee;
      use ieee.std_logic_1164.all;
      use ieee.std_logic_unsigned.all;
  
  entity counter is
   port (
      cout    :out std_logic_vector (3 downto 0); 
      enable : in std_logic; 
      clock     :in  std_logic ;                  -- Input clock
        res1 : out std_logic
     
    );
 end entity;
  
  architecture rtl of counter is
      signal count :std_logic_vector (3 downto 0):="0000";
      signal count_8 : std_logic_vector (3 downto 0):="0000";
        signal res_b : std_logic:='0';
      begin
      process (clock,enable,count_8) begin
   
            if enable ='0' or count_8 ="1000" then
            
                count_8 <= "0000";
                res_b <= '0';
            elsif enable ='1' then
                     if clock 'event and clock ='1' then
                        count_8 <= count_8 + 1;
                       
                    end if;
                     if count_8 ="0111" then
                            res_b <= '1';
                        end if;
            end if;
     end process;
     cout <= count;
     res1 <=res_b;
  end architecture;








---------------------------------------------------------------------------------------
--count 12 pulses
-------------------------------------------
library ieee;
      use ieee.std_logic_1164.all;
      use ieee.std_logic_unsigned.all;
  
  entity counter_12 is
   port (
      cout    :out std_logic_vector (3 downto 0); 
      enable : in std_logic; 
      clock     :in  std_logic ;                  -- Input clock
        res1 : out std_logic
     
    );
 end entity;
  
  architecture rtl of counter_12 is
      signal count :std_logic_vector (3 downto 0):="0000";
      signal count_8 : std_logic_vector (3 downto 0):="0000";
        signal res_b : std_logic:='0';
      begin
      process (clock,enable,count_8) begin
   
            if enable ='0' or count_8 ="1100" then
            
                count_8 <= "0000";
                res_b <= '0';
            elsif enable ='1' then
                     if clock 'event and clock ='1' then
                        count_8 <= count_8 + 1;
                       
                    end if;
                     if count_8 ="1011" then
                            res_b <= '1';
                        end if;
            end if;
     end process;
     cout <= count;
     res1 <=res_b;
  end architecture;
--------------------------------------------------------------------------------------------
library ieee;
      use ieee.std_logic_1164.all;
      use ieee.std_logic_unsigned.all;
  
  entity counter32 is
   port (
      cout    :out std_logic_vector (4 downto 0); 
      enable : in std_logic; 
        clock     :in  std_logic ;                  -- Input clock
        res1 : out std_logic
     
    );
 end entity;
  
  architecture rtl of counter32 is
      signal count :std_logic_vector (4 downto 0):="00000";
      signal count_8 : std_logic_vector (4 downto 0):="00000";
        signal res_b : std_logic:='0';
      begin
      process (clock,enable,count_8) begin
   
            if enable ='0' or count_8 ="11111" then
            
                count_8 <= "00000";
                res_b <= '0';
            elsif enable ='1' then
                     if clock 'event and clock ='1' then
                        count_8 <= count_8 + 1;
                       
                    end if;
                     if count_8 ="11110" then
                            res_b <= '1';
                        end if;
            end if;
     end process;
     cout <= count;
     res1 <=res_b;
  end architecture;




library ieee;
      use ieee.std_logic_1164.all;
      use ieee.std_logic_unsigned.all;
  
  entity counter256 is
   port (
      --cout    :out std_logic_vector (7 downto 0); 
      enable : in std_logic; 
        clock     :in  std_logic ;                  -- Input clock
   scount_256: out std_logic
  --  scount_2561: inout std_logic
     
    );
 end entity;
  
  architecture rtl of counter256 is
      signal count_256 :std_logic_vector (6 downto 0):="0000000";
    signal scount_2561 : std_logic:='0';

begin



process (enable,clock)--Basic clock to FPGA is 20 MHz (0.2usec)
	        begin
		       if enable='0' then 
		          count_256 <= "0000000";
			       scount_2561 <= '0';
		       elsif  clock'event and clock = '1' then
		   	     if count_256 = "1000001" then        --"11000001" then--
			          count_256 <= "0000000";
				       scount_2561 <= '1';
			        elsif scount_2561 ='0' then 
			          count_256 <= count_256 +1;
			       end if;
	        end if;
   scount_256 <=scount_2561;
        end process;

end architecture;

	