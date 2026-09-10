----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Wed Mar 20 14:56:16 2019
-- Testbench Template
-- This is a basic testbench that instantiates your design with basic 
-- clock and reset pins connected.  If your design has special
-- clock/reset or testbench driver requirements then you should 
-- copy this file and modify it. 
----------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: main.vhd
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

entity main is
end main;

architecture behavioral of main is

    constant SYSCLK_PERIOD : time := 100 ns; -- 10MHZ

    signal SYSCLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';

    component main_file
        -- ports
        port( 
            -- Inputs
            clk_1sec : in std_logic;
            clock_1k : in std_logic;
            cwp : in std_logic;
            fpm : in std_logic;
            ack : in std_logic;
            f1 : in std_logic;
            f2 : in std_logic;
            f3 : in std_logic;
            f4 : in std_logic;
            f5 : in std_logic;
            f6 : in std_logic;
            RDY : in std_logic;
            INT : in std_logic;

            -- Outputs
            sclk : out std_logic;
            cs : out std_logic;
            sdata : out std_logic

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

    -- Instantiate Unit Under Test:  main_file
    main_file_0 : main_file
        -- port map
        port map( 
            -- Inputs
            clk_1sec => SYSCLK,
            clock_1k => SYSCLK,
            cwp => '0',
            fpm => '0',
            ack => '0',
            f1 => '0',
            f2 => '0',
            f3 => '0',
            f4 => '0',
            f5 => '0',
            f6 => '0',
            RDY => '0',
            INT => '0',

            -- Outputs
            sclk =>  open,
            cs =>  open,
            sdata =>  open

            -- Inouts

        );

end behavioral;

