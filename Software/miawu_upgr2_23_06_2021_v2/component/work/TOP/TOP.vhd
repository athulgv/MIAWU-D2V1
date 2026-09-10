----------------------------------------------------------------------
-- Created by SmartDesign Thu Sep 10 15:16:19 2026
-- Version: 2024.1 2024.1.0.3
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library smartfusion2;
use smartfusion2.all;
----------------------------------------------------------------------
-- TOP entity declaration
----------------------------------------------------------------------
entity TOP is
    -- Port list
    port(
        -- Inputs
        F25    : in  std_logic;
        INT    : in  std_logic;
        RDY    : in  std_logic;
        XTL    : in  std_logic;
        ack    : in  std_logic;
        cwp    : in  std_logic;
        f1     : in  std_logic;
        f10    : in  std_logic;
        f11    : in  std_logic;
        f12    : in  std_logic;
        f13    : in  std_logic;
        f14    : in  std_logic;
        f15    : in  std_logic;
        f16    : in  std_logic;
        f17    : in  std_logic;
        f18    : in  std_logic;
        f19    : in  std_logic;
        f2     : in  std_logic;
        f20    : in  std_logic;
        f21    : in  std_logic;
        f22    : in  std_logic;
        f3     : in  std_logic;
        f4     : in  std_logic;
        f5     : in  std_logic;
        f6     : in  std_logic;
        f7     : in  std_logic;
        f8     : in  std_logic;
        f9     : in  std_logic;
        fpm    : in  std_logic;
        -- Outputs
        AGlamp : out std_logic;
        cs     : out std_logic;
        sclk   : out std_logic;
        sdata  : out std_logic
        );
end TOP;
----------------------------------------------------------------------
-- TOP architecture body
----------------------------------------------------------------------
architecture RTL of TOP is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- clkdiv
component clkdiv
    -- Port list
    port(
        -- Inputs
        clkin   : in  std_logic;
        -- Outputs
        clkout1 : out std_logic;
        clkout2 : out std_logic;
        clkout3 : out std_logic
        );
end component;
-- main_file
component main_file
    -- Port list
    port(
        -- Inputs
        F25      : in  std_logic;
        INT      : in  std_logic;
        RDY      : in  std_logic;
        ack      : in  std_logic;
        clk_1sec : in  std_logic;
        clk_2sec : in  std_logic;
        clock_1k : in  std_logic;
        cwp      : in  std_logic;
        f1       : in  std_logic;
        f10      : in  std_logic;
        f11      : in  std_logic;
        f12      : in  std_logic;
        f13      : in  std_logic;
        f14      : in  std_logic;
        f15      : in  std_logic;
        f16      : in  std_logic;
        f17      : in  std_logic;
        f18      : in  std_logic;
        f19      : in  std_logic;
        f2       : in  std_logic;
        f20      : in  std_logic;
        f21      : in  std_logic;
        f22      : in  std_logic;
        f3       : in  std_logic;
        f4       : in  std_logic;
        f5       : in  std_logic;
        f6       : in  std_logic;
        f7       : in  std_logic;
        f8       : in  std_logic;
        f9       : in  std_logic;
        fpm      : in  std_logic;
        -- Outputs
        AGlamp   : out std_logic;
        cs       : out std_logic;
        sclk     : out std_logic;
        sdata    : out std_logic
        );
end component;
-- TOP_OSC_0_OSC   -   Actel:SgCore:OSC:2.0.101
component TOP_OSC_0_OSC
    -- Port list
    port(
        -- Inputs
        XTL                : in  std_logic;
        -- Outputs
        RCOSC_1MHZ_CCC     : out std_logic;
        RCOSC_1MHZ_O2F     : out std_logic;
        RCOSC_25_50MHZ_CCC : out std_logic;
        RCOSC_25_50MHZ_O2F : out std_logic;
        XTLOSC_CCC         : out std_logic;
        XTLOSC_O2F         : out std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal AGlamp_0            : std_logic;
signal clkdiv_0_clkout1    : std_logic;
signal clkdiv_0_clkout2    : std_logic;
signal clkdiv_0_clkout3    : std_logic;
signal cs_net_0            : std_logic;
signal OSC_0_XTLOSC_O2F    : std_logic;
signal sclk_net_0          : std_logic;
signal sdata_net_0         : std_logic;
signal sdata_net_1         : std_logic;
signal cs_net_1            : std_logic;
signal sclk_net_1          : std_logic;
signal AGlamp_0_net_0      : std_logic;
----------------------------------------------------------------------
-- Inverted Signals
----------------------------------------------------------------------
signal fpm_IN_POST_INV0_0  : std_logic;
signal f1_IN_POST_INV1_0   : std_logic;
signal f2_IN_POST_INV2_0   : std_logic;
signal f3_IN_POST_INV3_0   : std_logic;
signal f4_IN_POST_INV4_0   : std_logic;
signal f5_IN_POST_INV5_0   : std_logic;
signal f6_IN_POST_INV6_0   : std_logic;
signal f7_IN_POST_INV7_0   : std_logic;
signal f8_IN_POST_INV8_0   : std_logic;
signal f9_IN_POST_INV9_0   : std_logic;
signal f10_IN_POST_INV10_0 : std_logic;
signal f11_IN_POST_INV11_0 : std_logic;
signal f12_IN_POST_INV12_0 : std_logic;
signal f13_IN_POST_INV13_0 : std_logic;
signal f14_IN_POST_INV14_0 : std_logic;
signal f15_IN_POST_INV15_0 : std_logic;
signal f16_IN_POST_INV16_0 : std_logic;
signal f17_IN_POST_INV17_0 : std_logic;
signal f18_IN_POST_INV18_0 : std_logic;
signal f19_IN_POST_INV19_0 : std_logic;
signal f20_IN_POST_INV20_0 : std_logic;
signal f21_IN_POST_INV21_0 : std_logic;
signal f22_IN_POST_INV22_0 : std_logic;
signal F25_IN_POST_INV23_0 : std_logic;

begin
----------------------------------------------------------------------
-- Inversions
----------------------------------------------------------------------
 fpm_IN_POST_INV0_0  <= NOT fpm;
 f1_IN_POST_INV1_0   <= NOT f1;
 f2_IN_POST_INV2_0   <= NOT f2;
 f3_IN_POST_INV3_0   <= NOT f3;
 f4_IN_POST_INV4_0   <= NOT f4;
 f5_IN_POST_INV5_0   <= NOT f5;
 f6_IN_POST_INV6_0   <= NOT f6;
 f7_IN_POST_INV7_0   <= NOT f7;
 f8_IN_POST_INV8_0   <= NOT f8;
 f9_IN_POST_INV9_0   <= NOT f9;
 f10_IN_POST_INV10_0 <= NOT f10;
 f11_IN_POST_INV11_0 <= NOT f11;
 f12_IN_POST_INV12_0 <= NOT f12;
 f13_IN_POST_INV13_0 <= NOT f13;
 f14_IN_POST_INV14_0 <= NOT f14;
 f15_IN_POST_INV15_0 <= NOT f15;
 f16_IN_POST_INV16_0 <= NOT f16;
 f17_IN_POST_INV17_0 <= NOT f17;
 f18_IN_POST_INV18_0 <= NOT f18;
 f19_IN_POST_INV19_0 <= NOT f19;
 f20_IN_POST_INV20_0 <= NOT f20;
 f21_IN_POST_INV21_0 <= NOT f21;
 f22_IN_POST_INV22_0 <= NOT f22;
 F25_IN_POST_INV23_0 <= NOT F25;
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 sdata_net_1    <= sdata_net_0;
 sdata          <= sdata_net_1;
 cs_net_1       <= cs_net_0;
 cs             <= cs_net_1;
 sclk_net_1     <= sclk_net_0;
 sclk           <= sclk_net_1;
 AGlamp_0_net_0 <= AGlamp_0;
 AGlamp         <= AGlamp_0_net_0;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- clkdiv_0
clkdiv_0 : clkdiv
    port map( 
        -- Inputs
        clkin   => OSC_0_XTLOSC_O2F,
        -- Outputs
        clkout1 => clkdiv_0_clkout1,
        clkout3 => clkdiv_0_clkout3,
        clkout2 => clkdiv_0_clkout2 
        );
-- main_file_0
main_file_0 : main_file
    port map( 
        -- Inputs
        clk_1sec => clkdiv_0_clkout1,
        clk_2sec => clkdiv_0_clkout3,
        clock_1k => clkdiv_0_clkout2,
        cwp      => cwp,
        fpm      => fpm_IN_POST_INV0_0,
        ack      => ack,
        f1       => f1_IN_POST_INV1_0,
        f2       => f2_IN_POST_INV2_0,
        f3       => f3_IN_POST_INV3_0,
        f4       => f4_IN_POST_INV4_0,
        f5       => f5_IN_POST_INV5_0,
        f6       => f6_IN_POST_INV6_0,
        f7       => f7_IN_POST_INV7_0,
        f8       => f8_IN_POST_INV8_0,
        f9       => f9_IN_POST_INV9_0,
        f10      => f10_IN_POST_INV10_0,
        f11      => f11_IN_POST_INV11_0,
        f12      => f12_IN_POST_INV12_0,
        f13      => f13_IN_POST_INV13_0,
        f14      => f14_IN_POST_INV14_0,
        f15      => f15_IN_POST_INV15_0,
        f16      => f16_IN_POST_INV16_0,
        f17      => f17_IN_POST_INV17_0,
        f18      => f18_IN_POST_INV18_0,
        f19      => f19_IN_POST_INV19_0,
        f20      => f20_IN_POST_INV20_0,
        f21      => f21_IN_POST_INV21_0,
        f22      => f22_IN_POST_INV22_0,
        F25      => F25_IN_POST_INV23_0,
        RDY      => RDY,
        INT      => INT,
        -- Outputs
        AGlamp   => AGlamp_0,
        sclk     => sclk_net_0,
        cs       => cs_net_0,
        sdata    => sdata_net_0 
        );
-- OSC_0   -   Actel:SgCore:OSC:2.0.101
OSC_0 : TOP_OSC_0_OSC
    port map( 
        -- Inputs
        XTL                => XTL,
        -- Outputs
        RCOSC_25_50MHZ_CCC => OPEN,
        RCOSC_25_50MHZ_O2F => OPEN,
        RCOSC_1MHZ_CCC     => OPEN,
        RCOSC_1MHZ_O2F     => OPEN,
        XTLOSC_CCC         => OPEN,
        XTLOSC_O2F         => OSC_0_XTLOSC_O2F 
        );

end RTL;
