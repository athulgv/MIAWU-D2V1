 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity main_file is

port (  clk_1sec,clk_2sec,clock_1k,cwp,fpm,ack, f1, f2, f3, f4, f5, f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19,f20,f21,f22   : in STD_LOGIC:='0';
        RDY                                                     : in std_logic;
        F25                                                     : in std_logic;
        INT                                                     : in std_logic;
        AGlamp,sclk,cs,sdata                                    : out  STD_LOGIC
        
                                                                        );

end main_file;



architecture behav of main_file is


component spi 
    Port (  
             rest_enable,rstin,in_1,in_2,in_3,in_4,in_5,in_6,in_7,in_8,in_10,in12  : in  STD_LOGIC;
             clock                                      : in  STD_LOGIC;
             RDY                                        : in std_logic;
             INT                                        : in std_logic;
             sclk,cs,sdata                              : out  STD_LOGIC);
end component;

component fpm_input 
port (
    clock_1sec                   : IN  std_logic;                --  1hz clock pulse
	fpm_in                       : in std_logic;                     --  input signal
    ack_in                       : in std_logic;                   --  ack inout
    ready1                       : in std_logic;
    fault_asserted               : out std_logic;      --  For playing fpm music.
    rest_enable                  : out std_logic            --  for enable the other music, after ack and  fpm priority high then enable audio.
);
end component;


component f1_input is
port (
    clock_1sec                   : IN  std_logic;                --  1hz clock pulse
	input                        : in std_logic;      
    ready1                       : in std_logic:='0';
    counter_enable               : in std_logic:='0';
    fault_asserted               : out  std_logic           --  out put signal
     
);
end component;

component f3_input is
port (
    clock_1sec          : IN  std_logic;                    --  1hz clock pulse
	input               : in std_logic;                     --  input signal
    ack_in              : in std_logic:='0';                --  ack inout
    priority            : in std_logic;
    ready1              : in std_logic:='0';
    counter_enable      : in std_logic:='0';
    cwp_input           : in std_logic; 
    fault_asserted      : out std_logic :='0'     --  For playing fpm music.
);
end component;

component f4_input is
port (
    clock_1sec          : IN  std_logic;                    --  1hz clock pulse
	input               : in std_logic;                     --  input signal
    ack_in              : in std_logic:='0';                --  ack inout
    priority            : in std_logic;
    ready1              : in std_logic:='0';
    counter_enable      : in std_logic:='0';
    cwp_input           : in std_logic; 
    fault_asserted      : out std_logic :='0'     --  For playing fpm music.
);
end component;

component f9_input is
port (
    clock_1sec          : IN  std_logic;                    --  1hz clock pulse
	input               : in std_logic;                     --  input signal
    ack_in              : in std_logic:='0';                --  ack inout
    priority            : in std_logic;
    ready1              : in std_logic:='0';
    counter_enable      : in std_logic:='0';
    cwp_input           : in std_logic; 
    fault_asserted      : out std_logic :='0'     --  For playing fpm music.
);
end component;


component fault_input
port (
    clock_1sec              : IN  std_logic;                --  1hz clock pulse
	input                   : in std_logic;                     --  input signal
    ack_in                  : in std_logic;                   --  ack inout
    priority                : in std_logic;
    ready1                  : in std_logic:='0';
    counter_enable          : in std_logic:='0';
    cwp_input               : in std_logic; 
    fault_asserted          : out std_logic     --  For playing fpm music.
 
);
end component;


component andGate
   port(         A1                                        : in std_logic;
                 B1, B2, B3, B4, B5, B6, B7, B8            : in STD_LOGIC;
                 C1, C2, C3, C4, C5, C6, C7, C8            : out STD_LOGIC);
end component;


component priority_encoder_8_3
port(
         din  : in STD_LOGIC_VECTOR(23 downto 0) :=(others => '0');
         dout : out STD_LOGIC_VECTOR(4 downto 0));
end component;


component decoder3x8
Port (      
            i : in  STD_LOGIC_VECTOR (4 downto 0);
            y : out  STD_LOGIC_VECTOR (23 downto 0));
end component;



component fpm_switch_chk is
PORT    ( 
            clockin     : in std_logic;
            fpml        : in std_logic;
            Q           : out std_logic :='0'
            
        );
end component;



--signal int_signal: std_logic;
signal temo,fpmo,f1o,f2o,f3o,f4o,f5o,f6o,f7o,f8o,f9o,f10o,f11o,f12o,f13o,f14o,f15o,f16o,f17o,f18o,f19o,f20o,f21o,f22o: STD_LOGIC:='0';
signal sig1,sig2,sig3,sig4,sig5,sig:std_logic:='0';
signal fclock:std_logic;
signal fpm_asserted1,rest_enable1:std_logic:='0';
signal f1_asserted:std_logic:='0';
signal f2_p,f2_asserted,f3_p,f3_asserted,f4_p,f4_asserted,f5_p,f5_asserted,f7_asserted,f8_asserted,f9_asserted:std_logic:='0';
signal f6_p,f6_asserted:std_logic:='0';

signal f10_asserted,f11_asserted,f12_asserted,f13_asserted,f14_asserted,f15_asserted,f16_asserted,f17_asserted:std_logic:='0';
signal f18_asserted,f19_asserted,f20_asserted,f21_asserted,f22_asserted:std_logic:='0';
--signal p1 : STD_LOGIC_VECTOR(7 downto 0);
signal and1Out, and2Out, and3Out, and4Out, and5Out, and6Out, and7Out, and8Out : std_logic :='0';
signal and1in,and2in,and3in,and4in,and5in,and6in,and7in,and8in : std_logic :='0';
signal fpm2,reset: std_logic :='0';
signal f: std_logic :='1';
signal counterQ : integer;
 

begin


fclock <= not F25 and clk_1sec;

poweronresetReset: process (clock_1k)
 begin 
            if (clock_1k'event and clock_1k ='1') then 
               
                    if counterQ > 100000 then
                        reset <= '0';
                        counterQ <= 0;
                    elsif(counterQ = 100000 )then  
                        reset <= '1';  
                        counterQ <= counterQ;
                    else
                        counterQ <= counterQ +1;
                        reset <= '0';

                 end if;
            end if;

  end process;


p1 : fpm_input port map(clk_1sec,fpm,ack,reset,fpm_asserted1,rest_enable1);

p2 : f1_input port map(clk_1sec,f1,reset,rest_enable1,f1_asserted);

p3 : fault_input port map(clk_1sec,f2,ack,f2o,reset,rest_enable1,cwp,f2_asserted);

p5 :f3_input port map(fclock,f4,ack,f4o,reset,rest_enable1,cwp,f4_asserted);

p4 :f3_input port map(fclock,f3,ack,f3o,reset,rest_enable1,cwp,f3_asserted);


p6 :fault_input port map(clk_1sec,f5,ack,f5o,reset,rest_enable1,cwp,f5_asserted);

p7 :fault_input port map(clk_1sec,f6,ack,f6o,reset,rest_enable1,cwp,f6_asserted);

p8 :fault_input port map(clk_1sec,f7,ack,f7o,reset,rest_enable1,cwp,f7_asserted);

p9 :fault_input port map(clk_1sec,f8,ack,f8o,reset,rest_enable1,cwp,f8_asserted);

p10:f9_input port map(fclock,f9,ack,f9o,reset,rest_enable1,cwp,f9_asserted);

p12 :fault_input port map(clk_1sec,f10,ack,f10o,reset,rest_enable1,cwp,f10_asserted);

p13 :fault_input port map(clk_1sec,f11,ack,f11o,reset,rest_enable1,cwp,f11_asserted);

p14 :fault_input port map(clk_1sec,f12,ack,f12o,reset,rest_enable1,cwp,f12_asserted);

p15 :fault_input port map(clk_1sec,f13,ack,f13o,reset,rest_enable1,cwp,f13_asserted);

p16 :fault_input port map(clk_1sec,f14,ack,f14o,reset,rest_enable1,cwp,f14_asserted);

p17 :fault_input port map(clk_1sec,f15,ack,f15o,reset,rest_enable1,cwp,f15_asserted);

p18 :fault_input port map(clk_1sec,f16,ack,f16o,reset,rest_enable1,cwp,f16_asserted);

p19 :fault_input port map(clk_1sec,f17,ack,f17o,reset,rest_enable1,cwp,f17_asserted);

p20 :fault_input port map(clk_1sec,f18,ack,f18o,reset,rest_enable1,cwp,f18_asserted);

p21 :fault_input port map(clk_1sec,f19,ack,f19o,reset,rest_enable1,cwp,f19_asserted);

p22 :fault_input port map(clk_1sec,f20,ack,f20o,reset,rest_enable1,cwp,f20_asserted);

p23 :fault_input port map(clk_1sec,f21,ack,f21o,reset,rest_enable1,cwp,f21_asserted);

p24 :fault_input port map(clk_1sec,f22,ack,f22o,reset,rest_enable1,cwp,f22_asserted);


spi1 :spi Port map( rest_enable1,reset,f1o,f2o,f3o,f4o,f5o,f6o,f7o,f8o,f10o,fpm_asserted1,clock_1k,RDY,INT,sclk,cs,sdata);


module_j_inst: priority_encoder_8_3

port map

    (
     din(0) => f,
     din(1) => f22_asserted,
     din(2) => f21_asserted,
     din(3) => f20_asserted,
     din(4) => f19_asserted,
     din(5) => f18_asserted,
     din(6) => f17_asserted,
     din(7) => f16_asserted,
     din(8) => f15_asserted,
     din(9) => f14_asserted,
     din(10) => f13_asserted,
     din(11) => f12_asserted,
     din(12) => f11_asserted,
     din(13) => f10_asserted,
     din(14) => f9_asserted,
     din(15) => f8_asserted,
     din(16) => f7_asserted,
     din(17) => f6_asserted,
     din(18) => f5_asserted,
     din(19) => f4_asserted,
     din(20) => f3_asserted,
     din(21) => f2_asserted,
     din(22) => f1_asserted,
     din(23) => fpm_asserted1,
    dout(0) =>sig,
    dout(1) =>sig1,
    dout(2) =>sig2,
    dout(3) =>sig3,
    dout(4) =>sig4
                    );

module_k_inst: decoder3x8 

port map(
        i(0) => sig,
        i(1) => sig1,
        i(2) => sig2,
        i(3) => sig3,
        i(4) => sig4,
        y(0)  => temo,
        y(1)  => f22o,
        y(2)  => f21o,
        y(3)  => f20o,
        y(4)  => f19o,
        y(5)  => f18o,
        y(6)  => f17o,
        y(7)  => f16o,
        y(8)  => f15o,
        y(9)  => f14o,
        y(10) => f13o,
        y(11) => f12o,
        y(12) => f11o,
        y(13) => f10o,
        y(14) => f9o,
        y(15) => f8o,
        y(16) => f7o,
        y(17) => f6o,
        y(18) => f5o,
        y(19) => f4o,
        y(20) => f3o,
        y(21) => f2o,
        y(22) => f1o,
        y(23) => fpmo);




AGlamp <= (clk_2sec and (fpmo or f1o or f2o or f3o or f4o or f5o or f6o or f7o or f8o or f9o or f10o or f11o or f12o or f13o or f14o or f15o or f16o or f17o or f18o or f19o or f20o or f21o or f22o));

end behav;