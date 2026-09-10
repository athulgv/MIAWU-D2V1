-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 21.6.2021 12:10:47 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_fault_input is
end tb_fault_input;

architecture tb of tb_fault_input is

    component fault_input
        port (clock_1sec     : in std_logic;
              input          : in std_logic;
              ack_in         : in std_logic;
              priority       : in std_logic;
              ready1         : in std_logic;
              counter_enable : in std_logic;
              cwp_input      : in std_logic;
              fault_asserted : out std_logic);
    end component;

    signal clock_1sec     : std_logic;
    signal input          : std_logic;
    signal ack_in         : std_logic;
    signal priority       : std_logic;
    signal ready1         : std_logic;
    signal counter_enable : std_logic;
    signal cwp_input      : std_logic;
    signal fault_asserted : std_logic;

    constant TbPeriod : time := 10 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : fault_input
    port map (clock_1sec     => clock_1sec,
              input          => input,
              ack_in         => ack_in,
              priority       => priority,
              ready1         => ready1,
              counter_enable => counter_enable,
              cwp_input      => cwp_input,
              fault_asserted => fault_asserted);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clock_1sec is really your main clock signal
    clock_1sec <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        input <= '0';
        ack_in <= '0';
        priority <= '0';
        ready1 <= '0';
        counter_enable <= '1';
        cwp_input <= '0';

        wait for 100 ns;
        ready1 <= '1';
        wait for 100 ns;
        input  <= '1';
        wait for 100 ns;
        wait for 100 ns;
        wait for 100 ns;

        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_fault_input of tb_fault_input is
    for tb
    end for;
end cfg_tb_fault_input;