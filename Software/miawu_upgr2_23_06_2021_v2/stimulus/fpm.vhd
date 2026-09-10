----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Fri Mar 15 16:26:31 2019
-- Testbench Template
-- This is a basic testbench that instantiates your design with basic 
-- clock and reset pins connected.  If your design has special
-- clock/reset or testbench driver requirements then you should 
-- copy this file and modify it. 
----------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: fpm.vhd
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

entity fpm is
end fpm;

architecture behavioral of fpm is

    constant SYSCLK_PERIOD : time := 100 ns; -- 10MHZ

    signal SYSCLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';

    component fpm_input
        -- ports
        port( 
            -- Inputs
            clock_1sec : in std_logic;
            fpm_in : in std_logic;
            ack_in : in std_logic;

            -- Outputs
            fault_asserted : out std_logic;
            rest_enable : out std_logic

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

    -- Instantiate Unit Under Test:  fpm_input
    fpm_input_0 : fpm_input
        -- port map
        port map( 
            -- Inputs
            clock_1sec => SYSCLK,
            fpm_in => '0',
            ack_in => '0',

            -- Outputs
            fault_asserted =>  open,
            rest_enable =>  open

            -- Inouts

        );

end behavioral;

