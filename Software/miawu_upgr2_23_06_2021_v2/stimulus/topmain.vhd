--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: topmain.vhd
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
use ieee.std_logic_1164.all;

entity topmain is
end topmain;

architecture behavioral of topmain is

    constant SYSCLK_PERIOD : time := 31250 ns; -- 10MHZ

    signal SYSCLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';

    component TOP
        -- ports
        port( 
            -- Inputs
            XTL : in std_logic;
            RDY : in std_logic;
            f5 : in std_logic;
            fpm : in std_logic;
            INT : in std_logic;
            f3 : in std_logic;
            f4 : in std_logic;
            f2 : in std_logic;
            ack : in std_logic;
            f1 : in std_logic;
            f6 : in std_logic;
            cwp : in std_logic;

            -- Outputs
            sdata : out std_logic;
            cs : out std_logic;
            sclk : out std_logic

            -- Inouts

        );
    end component;

begin

    process
        variable vhdl_initial : BOOLEAN := TRUE;

    begin
        if ( vhdl_initial ) then
            -- Assert Reset
            NSYSRESET <= '0';
            wait for ( SYSCLK_PERIOD * 10 );
            
            NSYSRESET <= '1';
            wait;
        end if;
    end process;

    -- Clock Driver
    SYSCLK <= not SYSCLK after (SYSCLK_PERIOD / 2.0 );

    -- Instantiate Unit Under Test:  TOP
    TOP_0 : TOP
        -- port map
        port map( 
            -- Inputs
            XTL => SYSCLK,
            RDY => '0',
            f5 => '0',
            fpm => '0',
            INT => '0',
            f3 => '0',
            f4 => '0',
            f2 => '0',
            ack => '0',
            f1 => '0',
            f6 => '0',
            cwp => '0',

            -- Outputs
            sdata =>  open,
            cs =>  open,
            sclk =>  open

            -- Inouts

        );

end behavioral;

