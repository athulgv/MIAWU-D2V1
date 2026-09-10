----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:49:27 06/04/2011 
-- Design Name: 
-- Module Name:    switchcheck - Behavioral 
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

entity switchcheck1 is
    Port (reset, input1,input2,input3,input4,input5,input6,input7,input8,input9,input10,input11,input12,input13:in std_logic;
			    RDY         : in std_logic;
                pu          : in  STD_LOGIC; -- power up switch
                sp          : in  STD_LOGIC; -- set play switch
                sd          : in  STD_LOGIC; -- power down switch
                clock       :in std_logic; -- clock
                rd_int      : in std_logic;
                path        : in std_logic;
                sdata       :out std_logic; -- data in line
                cs          :out std_logic; -- chip select line
                sclk        :out std_logic
        );
end switchcheck1;

architecture Behavioral of switchcheck1 is



component  D_FF is
    PORT(   
            D       : in std_logic;
            CLOCK   : in std_logic;
            reset   : in std_logic;
            Q       : out std_logic
        );
end component;



component counter is
   port (
      cout    :out std_logic_vector (3 downto 0); 
      enable : in std_logic; 
      clock     :in  std_logic ;                  -- Input clock
        res1 : out std_logic
     
    );
end component;




signal load,ins,inp:std_logic:='0';
signal ss:std_logic:='1';
signal t:std_logic_vector(5 downto 1):="00000";
signal q:std_logic_vector(5 downto 1):="00000";
signal q1:std_logic_vector(5 downto 1):="00000";
signal shreg:std_logic_vector(16 downto 1):="0000000000000000";




signal pq1:std_logic_vector(5 downto 1):="00000";
signal shreg1:std_logic_vector(23 downto 0):="000000000000000000000000";
signal clock1,sdata1: std_logic:='1';
signal pq1res,q1res ,pq1clk,ensclk,ensclk1,enpu: std_logic:='1';
--signal resetcounter: std_logic_vector(3 downto 0):="0000";
signal q_rdint,q_path : std_logic_vector(4 downto 0) :="00000";
signal qrdint_res ,qpath_res:std_logic:='1';
signal cs_rdint,cs_rdint1,cs_path,cs_path1,rdint_en,path_en:std_logic:='0';
signal pu_sd,cs_pu,cs_ply,cs_ply1,cs_pu1: std_logic:='0';

begin
--** activating the chip select **

load<=(t(1) or t(2) or t(3) or t(4)) or t(5) ;-- and en_ins; 

pu_sd <= pu or sd;



------------------------------------------------------------------------------------
A2:  D_FF port map (D=>'1',CLOCK=> pu_sd,reset=>q1res,Q=>cs_pu1);

A2_1:  D_FF port map (D=>cs_pu1,CLOCK=> clock1,reset=>'0',Q=>cs_pu);

-------------------------------------------------------------------------------------

A4:  D_FF port map (D=>'1',CLOCK=> sp,reset=>pq1res,Q=>cs_ply1);

A5:  D_FF port map (D=>cs_ply1,CLOCK=> clock1,reset=>'0',Q=>cs_ply);
---------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------


       
clock1 <= not clock;







process(load,q1res,pq1res,qrdint_res,qpath_res)
begin
        if q1res ='1' or pq1res ='1' or qrdint_res ='1' or qpath_res ='1'  then 
            ins<='0';
        elsif load'event and load='1' then
            ins<='1';
        end if;
end process;


process(clock,ins,q1res,pq1res,qrdint_res,qpath_res)
    begin
     if q1res = '1' or pq1res = '1' or qrdint_res ='1' or qpath_res ='1'  then 
         ss<='1';
     elsif clock'event and clock='0' then
        if ins='1' then
            ss<='0';
        end if;
    end if;
end process;


----------------------------------
-- 8 clock pulses
--------------------

process(cs_pu,q1,clock,RDY)
begin
    if q1="01010" or cs_pu ='0' then
        q1<="00000";
        enpu <= '0';
	    q1res<='0';

    elsif RDY = '1'  and cs_pu ='1'then
          enpu <='1';
            if clock'event and clock='0' then
                q1<=q1+'1';
            end if;
          
            if q1 <="00111" then
                 enpu<= '1';
            else 
                 enpu <='0';		-- enable sclk pulses for 8 
            end if;
	
            if q1 ="01001" then
                q1res<= '1';
            else
                q1res<= '0';
            end if;
    else 
         enpu <='0';
  
    end if;
end process;

-------------------------------------------------------------------

----------------------------------------------

----------------------------------
-- 24 clock pulses for play +6 pulses
--------------------

process(pq1,clock,RDY,cs_ply)
begin
    if pq1="11011" or cs_ply ='0' then
        pq1<="00000";
        pq1res <= '0';
        pq1clk <= '0';
    elsif RDY = '1' and  cs_ply = '1'  then    
            if clock'event and clock='0' then
                pq1<=pq1+'1';
            end if;
	
	
            if pq1 <="10111" then
                 pq1clk<= '1';
            else 
                 pq1clk <='0';		-- enable sclk pulses for 24 
            end if;

            if pq1 ="11010" then
                pq1res <= '1';
            else
                pq1res <= '0';
            end if;

     end if;
  end process;



----------------------------------------------------------------------------
--------------------path

A4_5:  D_FF port map (D=>'1',CLOCK=> path,reset=> qpath_res,Q=>cs_path1);

A5_5:  D_FF port map (D=>cs_path1,CLOCK=> clock1,reset=>'0',Q=>cs_path);




----------------------------------------------------------------------------

-- 24 clock pulses for play +6 pulses
--------------------

process(q_path,clock,RDY,cs_path,path_en)
begin
    if q_path="11011" or cs_path ='0' then
        q_path<="00000";
        qpath_res <= '0';
	    path_en <= '0';
    elsif RDY = '1' and  cs_path = '1'  then    
            if clock'event and clock='0' then
                q_path<=q_path+'1';
            end if;
	
	
            if q_path <="10111" then
                path_en<= '1';
            else 
                path_en <='0';		-- enable sclk pulses for 24 
            end if;

            if q_path ="11010" then
                qpath_res <= '1';
            else
                qpath_res <= '0';
            end if;

     end if;
  end process;



-------------------------------------------
--read interrupt
------------------------------
----------------------------------------------------------------------------
--------------------path
A10_5:  D_FF port map (D=>'1',CLOCK=> rd_int,reset=>qrdint_res,Q=>cs_rdint1);

A10_6:  D_FF port map (D=>cs_rdint1,CLOCK=> clock1,reset=>'0',Q=>cs_rdint);--

---------------------------------------------------------------------------

-- 24 clock pulses for play +6 pulses
--------------------

process(q_rdint,clock,RDY,cs_rdint,rdint_en)
begin
    if q_rdint="11010" or cs_rdint ='0' then
        q_rdint<="00000";
        qrdint_res <= '0';
	    rdint_en <= '0';
    elsif RDY = '1' and  cs_rdint= '1'  then    
            if clock'event and clock='0' then
              q_rdint<=q_rdint+'1';
            end if;
	
	
            if q_rdint <="10111" then
                rdint_en<= '1';
            else 
                rdint_en <='0';		-- enable sclk pulses for 24 
            end if;

            if q_rdint ="11001" then
                qrdint_res <= '1';
            else
                qrdint_res <= '0';
            end if;

     end if;
  end process;

------------------------------------------------------------------------------------

---------------------------------

ensclk <= (pq1clk or enpu or  rdint_en or path_en);

A10_clk:  D_FF port map (D=>ensclk,CLOCK=> clock,reset=>'0',Q=>ensclk1);--

------------------------------------------------------------------------


-- to make sure only one switch is high at a time


q<=(path&rd_int&pu&sp&sd);



process(q)
begin
case q is 
      when "00001" =>
            t(5)<='0';
            t(4)<='0';
			t(3)<='0';
			t(2)<='0';
			t(1)<='1';
      when "00010" =>
            t(5)<='0';
            t(4)<='0';
			t(3)<='0';
			t(2)<='1';
			t(1)<='0';
      when "00100" =>
            t(5)<='0';
            t(4)<='0';
			t(3)<='1';
			t(2)<='0';
			t(1)<='0';
       when "01000" =>
            t(5)<='0';
            t(4)<='1';
			t(3)<='0';
			t(2)<='0';
			t(1)<='0';
      when "10000" =>
            t(5)<='1';
            t(4)<='0';
			t(3)<='0';
			t(2)<='0';
			t(1)<='0';
      when others =>
            t(5)<='0';
			t(4)<='0';
			t(3)<='0';
			t(2)<='0';
			t(1)<='0';
   end case;
end process;


inp<= input1 and input2 and input3 and input4 and input5 and input6 and input7 and input8 and input9 and input10 and input11 and input12 and input13;			

--**************************************************************************************--
-- ** ADDRESS LOCATIONS OF MESSAGES FOR PLAYING AND RECORDING**
----------------------------------------------------------------------------------------
--	|	 SL     | INPUT DESCRIPTION			|	ADDRESS LOCATIONS		||	ADDRESS LOCATIONS		|	
--  |	 NO     |							|		PLAY					 |		RECORD				|
----------------------------------------------------------------------------------------
--	|	 1	    |LOW ALTITUDE WARNING		|	1110000000000000		||	1010000000000000		|	
--	|	 2	    |FUEL LOW PRESSURE LP1/LP2  |	1110000001010000		||	1010000001010000		|
--	|	 3      |TRANS				    	|	1110000010100000		||	1010000010100000		|
--	|	 4		|INTER						|	1110000011110000		||	1010000011110000		|
--	|	 5		|TRL VALVE CLOSED			|	1110000101000000		||	1010000101000000		|
--	|    6		|AIR PRESSURE FAILURE		|	1110000110010000		||	1010000110010000		|
--	|    7		|RL1 IS NOT FULLY OPEN		|	1110000111100000		||	1010000111100000		|
--  |    8		|RL2 IS NOT FULLY OPEN 		|	1110001000110000		||	1010001000110000		|
--  |    9		|RV1 IS NOT FULLY OPEN		|	1110001010000000		||	1010001010000000		|
--  |   10		|RV2 IS NOT FULLY OPEN		|	1110001011010000		||	1010001011010000		|
--  |   11		|CENTRAL GROUP EMPTY		|	1110001101110000		||	1010001101110000		|
--	|	12		|BIT OK						|	1110001100100000		||	1010001100100000		|
--	|	13		|BIT FAULT					|	1110001110011000		||	1010001110011000		|
--	|	14		|POWER UP 					|  0010000000000000		|| 							|
--	|	15		|POWER DOWN						|	0001000000000000		||								|
----------------------------------------------------------------------------------------
--**************************************************************************************--
			
process(clock,q1,inp,shreg,pu,sp,sd,input1,input2,input3,input4,input5,input6,input7,input8,input9,input10,input11,input12,input13)
begin
if clock'event and clock='0' then
-- ** LOW ALTITUDE WARNING **
-- ** LOW ALTITUDE WARNING **
        if input1='1' then
         if q1="00000" and pq1="00000" and q_path ="00000" and q_rdint ="00000" then

                if pu='1'  then 
                    shreg1 <= "000100000000000000000000";  ---10 power up 
                  elsif sp='1' then
                    shreg1 <= "101001100000000000000100";  ------A6 00 04 play voice prompt at index 04
                  elsif sd='1' then
                    shreg1 <= "001010100000000000000000";--2A  -STOP
  
                  elsif path='1' then
                  
                    shreg1 <= "101100000000000000000010";--B00002  -PATH
                  elsif rd_int ='1' then
                  
                   shreg1 <= "010001100000000000000000";--46 -read_int
                 else shreg1<= shreg1 ;--shreg;
                end if;
            end if;
         end if;



-- ** front group less then 500 K G **
       if input2='1' then
            if q1="00000" and pq1="00000" and q_path ="00000" and q_rdint ="00000" then

                if pu='1'  then
                    shreg1 <= "000100000000000000000000";  ---10 power up
                 elsif sp='1' then
                     shreg1 <= "101001100000000000000101";  ------A6 00 04 play voice prompt at index 05
                 elsif sd='1' then
                    shreg1 <= "001010100000000000000000";--2A  -STOP
                 elsif path='1' then
                    shreg1 <= "101100000000000000000010";--B00002 --PATH
                 elsif rd_int ='1' then
                    shreg1 <= "010001100000000000000000";--46 -RD_INT
                 else shreg1<= shreg1 ;--shreg;
                end if;
            end if;
         end if;


-- ** Star board**
 if input3='1' then
            if q1="00000" and pq1="00000" and q_path ="00000" and q_rdint ="00000" then
                if pu='1'  then
                   shreg1 <= "000100000000000000000000";  ---10 power up
                 elsif sp='1' then
                   shreg1 <= "101001100000000000000110";  ------A6 00 04 play voice prompt at index 06
                 elsif sd='1' then
                   shreg1 <= "001010100000000000000000";--2A  -STOP
                 elsif path='1' then
                    shreg1 <= "101100000000000000000010";--B00002  PATH
                 elsif rd_int ='1' then
                    shreg1 <= "010001100000000000000000";--46 -RD_INT
                 else shreg1<= shreg1 ;--shreg;
                end if;
            end if;
         end if;
-- ** POrt drop Board **
        if input4='1' then
            if q1="00000" and pq1="00000" and q_path ="00000" and q_rdint ="00000" then
              if pu='1'  then
                    shreg1 <= "000100000000000000000000";  ---10 power up
                elsif sp='1' then
                  shreg1 <= "101001100000000000000111";  ------A6 00 04 play voice prompt at index 07
                elsif sd='1' then
                   shreg1 <= "001010100000000000000000";--2A  -STOP
                elsif path='1' then
                    shreg1 <= "101100000000000000000010";--B00002 PATH
                elsif rd_int ='1' then
                 shreg1 <= "010001100000000000000000";--46 -RD_INT
                else shreg1<= shreg1 ;--shreg1;
               end if;
            end if;
         end if;

-- ** Central Group **
            if input5='1' then
                if q1="00000" and pq1="00000" and q_path ="00000" and q_rdint ="00000" then
                   if pu='1'  then
                        shreg1 <= "000100000000000000000000";  ---10 power up
                     elsif sp='1' then
                        shreg1 <= "101001100000000000001000";  ------A6 00 04 play voice prompt at index 08
                      elsif sd='1' then
                          shreg1 <= "001010100000000000000000";--2A  -STOP
                      elsif path='1' then
                          shreg1 <= "101100000000000000000010";--B00002  PATH
                      elsif rd_int ='1' then
                        shreg1 <= "010001100000000000000000";--46 -RD_INT
                      else shreg1<= shreg1 ;--shreg;
                    end if;
            end if;
          end if;



                -- ** Fuel low pressure **
                if input6='1' then
                    if q1="00000" and pq1="00000" and q_path ="00000" and q_rdint ="00000" then
                        if pu='1'  then
                            shreg1 <= "000100000000000000000000";  ---10 power up
                          elsif sp='1' then
                            shreg1 <= "101001100000000000001010";  ------A6 00 04 play voice prompt at index 0A
                          elsif sd='1' then
                             shreg1 <= "001010100000000000000000";--2A  -STOP
                          elsif path='1' then
                            shreg1 <= "101100000000000000000010";--B00002 PATH
                          elsif rd_int ='1' then
                            shreg1 <= "010001100000000000000000";--46 RD_INT
                          else shreg1<= shreg1 ;--shreg;
                        end if;
                  end if;
               end if;

            -- ** Inter **
            if input7='1' then
                 if q1="00000" and pq1="00000" and q_path ="00000" and q_rdint ="00000" then
                      if pu='1'  then
                          shreg1 <= "000100000000000000000000";  ---10 power up
                        elsif sp='1' then
                             shreg1 <= "101001100000000000001011";  ------A6 00 04 play voice prompt at index 0B
                        elsif sd='1' then
                              shreg1 <= "001010100000000000000000";--2A  -STOP
                        elsif path='1' then
                            shreg1 <= "101100000000000000000010";--B00002 -PATH
                        elsif rd_int ='1' then
                            shreg1 <= "010001100000000000000000";--46 RD_INT
                        else shreg1<= shreg1 ;--shreg;
                     end if;
                 end if;
           end if;


            -- ** Trans **
            if input8='1' then
                if q1="00000" and pq1="00000" and q_path ="00000" and q_rdint ="00000" then
                       if pu='1'  then
                            shreg1 <= "000100000000000000000000";  ---10 power up
                        elsif sp='1' then
                            shreg1 <= "101001100000000000001100";  ------A6 00 04 play voice prompt at index 0C
                        elsif sd='1' then
                            shreg1 <= "001010100000000000000000";--2A  -STOP
                        elsif path='1' then
                            shreg1 <= "101100000000000000000010";--B00002 -PATH
                        elsif rd_int ='1' then
                            shreg1 <= "010001100000000000000000";--46 RD_INT
                        else shreg1<= shreg1 ;--shreg;
                       end if;
               end if;
          end if;

            -- ** NOT USED**
            if input9='1' then
                    if q1="00000" and pq1="00000" and q_path ="00000" and q_rdint ="00000" then
                       if pu='1'  then
                            shreg1 <= "000100000000000000000000";  ---10 power up 
                         elsif sp='1' then
                            shreg1 <= "101001100000000000001101";  ------A6 00 04 play voice prompt at index 
                         elsif sd='1' then
                             shreg1 <= "001010100000000000000000";--2A  -STOP
                         elsif path='1' then
                             shreg1 <= "101100000000000000000010";--B00002 PATH
                        elsif rd_int ='1' then
                            shreg1 <= "010001100000000000000000";--46 RD_INT
                        else shreg1<= shreg1 ;--shreg;
                      end if;
                  end if;
            end if;


            -- ** TGT OVERSHOOT **
            if input10='1' then
                   if q1="00000" and pq1="00000" and q_path ="00000" and q_rdint ="00000" then
                       if pu='1'  then
                            shreg1 <= "000100000000000000000000";  ---10 power up
                        elsif sp='1' then
                            shreg1 <= "101001100000000000001101";  ------A6 00 04 play voice prompt at index 0D
                        elsif sd='1' then
                            shreg1 <= "001010100000000000000000";--2A  -STOP
                        elsif path='1' then
                             shreg1 <= "101100000000000000000010";--B00002 PATH
                        elsif rd_int ='1' then
                            shreg1 <= "010001100000000000000000";--46 RD_INT
                        else shreg1<= shreg1 ;--shreg;
                      end if;
                  end if;
            end if;

            -- ** central group empty **
            if input11='1' then
                   if q1="00000" and pq1="00000" and q_path ="00000" and q_rdint ="00000" then
                       if pu='1'  then
                            shreg1 <= "000100000000000000000000";  ---10 power up 
                        elsif sp='1' then
                             shreg1 <= "101001100000000000001100";  ------A6 00 04 play voice prompt at index 0E
                        elsif sd='1' then
                             shreg1 <= "001010100000000000000000";--2A  -STOP
                        elsif path='1' then
                             shreg1 <= "101100000000000000000010";--B00002 PATH
                        elsif rd_int ='1' then
                            shreg1 <= "010001100000000000000000";--46 RD_INT
                        else shreg1<= shreg1 ;--shreg;
                      end if;
                  end if;
            end if;



            -- ** bit ok ** audio warning system.
            if input12='1' then
                if q1="00000" and pq1="00000" and q_path ="00000" and q_rdint ="00000" then
                      if pu='1'  then
                            shreg1 <= "000100000000000000000000";  ---10 power up
                        elsif sp='1' then
                              shreg1 <= "101001100000000000001001";  ------A6 00 04 play voice prompt at index 09; 
                        elsif sd='1' then
                              shreg1 <= "001010100000000000000000";--2A  -STOP
                        elsif path='1' then
                             shreg1 <= "101100000000000000000010";--B00002 PATH
                        elsif rd_int ='1' then
                            shreg1 <= "010001100000000000000000";--46 RD_INT
                        else shreg1<= shreg1 ;--shreg;
                      end if;
                  end if;
            end if;


            -- ** bit fault **
            if input13='1' then
              if q1="00000" and pq1="00000" and q_path ="00000" and q_rdint ="00000" then
                   if pu='1'  then
                        shreg1 <= "000100000000000000000000";  ---10 power up
                     elsif sp='1' then
                        shreg1 <= "101001100000000000001101";  ------A6 00 04 play voice prompt at index 10
                     elsif sd='1' then
                          shreg1 <= "001010100000000000000000";--2A  -STOP
                     elsif path='1' then
                          shreg1 <= "101100000000000000000010";--B00002 PATH
                     elsif rd_int ='1' then
                          shreg1 <= "010001100000000000000000";--46 RD_INT
                     else shreg1<= shreg1 ;--shreg;
                 end if;
            end if;
         end if;

            --** power down command if no inputs are there **
            if inp='0' then
                     if q1="00000" and pq1="00000" and q_path ="00000" and q_rdint ="00000" then
                        if sd='1' then
                         shreg1 <= "001010100000000000000000";--2A  -STOP
                        end if;
                    end if;
                   end if;


----------------------------------------------
--
--------------------------------------------------




-- ** shift register **
    if (ss='0' and RDY ='1' )  then --or enpu3 ='1' then --  and ensclk1 = '1'
             shreg1<=  shreg1(22 downto 0) & shreg1(23);
    end if;
end if;
   
------------------------------------------------------------------
 
-------------------------------------------------------------------
        if (ss='0'  and RDY = '1'and ensclk1 ='1') then --  or enpu3 ='1' then
            sclk<=    clock;--**1KHz clock**
        else 
            sclk <= '1';
            sdata1 <= '1';
        end if;
    sdata1<=shreg1(23); --**mosi**
     
          
 
end process;
D2:  D_FF port map (D=>sdata1,CLOCK=> clock1,reset=>'0',Q=>sdata);



cs<=ss;--**ss(chip selct)**

end Behavioral;

