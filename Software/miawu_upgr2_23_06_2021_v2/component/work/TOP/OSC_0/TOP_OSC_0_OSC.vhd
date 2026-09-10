-- Version: 2024.1 2024.1.0.3

library ieee;
use ieee.std_logic_1164.all;
library smartfusion2;
use smartfusion2.all;

entity TOP_OSC_0_OSC is

    port( XTL                : in    std_logic;
          RCOSC_25_50MHZ_CCC : out   std_logic;
          RCOSC_25_50MHZ_O2F : out   std_logic;
          RCOSC_1MHZ_CCC     : out   std_logic;
          RCOSC_1MHZ_O2F     : out   std_logic;
          XTLOSC_CCC         : out   std_logic;
          XTLOSC_O2F         : out   std_logic
        );

end TOP_OSC_0_OSC;

architecture DEF_ARCH of TOP_OSC_0_OSC is 

  component XTLOSC_FAB
    port( A      : in    std_logic := 'U';
          CLKOUT : out   std_logic
        );
  end component;

  component XTLOSC
    generic (MODE:std_logic_vector(1 downto 0) := "11"; 
        FREQUENCY:real := 20.0);

    port( XTL    : in    std_logic := 'U';
          CLKOUT : out   std_logic
        );
  end component;

  component CLKINT
    port( A : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

    signal N_XTLOSC_CLKOUT, N_XTLOSC_CLKINT : std_logic;

begin 


    I_XTLOSC_FAB : XTLOSC_FAB
      port map(A => N_XTLOSC_CLKOUT, CLKOUT => N_XTLOSC_CLKINT);
    
    I_XTLOSC : XTLOSC
      generic map(MODE => "01", FREQUENCY => 0.032)

      port map(XTL => XTL, CLKOUT => N_XTLOSC_CLKOUT);
    
    I_XTLOSC_FAB_CLKINT : CLKINT
      port map(A => N_XTLOSC_CLKINT, Y => XTLOSC_O2F);
    

end DEF_ARCH; 
