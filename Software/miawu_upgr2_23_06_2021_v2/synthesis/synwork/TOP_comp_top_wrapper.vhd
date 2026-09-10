--
-- Synopsys
-- Vhdl wrapper for top level design, written on Thu Sep 10 15:18:12 2026
--
library ieee;
use ieee.std_logic_1164.all;

entity wrapper_for_TOP is
   port (
      F25 : in std_logic;
      INT : in std_logic;
      RDY : in std_logic;
      XTL : in std_logic;
      ack : in std_logic;
      cwp : in std_logic;
      f1 : in std_logic;
      f10 : in std_logic;
      f11 : in std_logic;
      f12 : in std_logic;
      f13 : in std_logic;
      f14 : in std_logic;
      f15 : in std_logic;
      f16 : in std_logic;
      f17 : in std_logic;
      f18 : in std_logic;
      f19 : in std_logic;
      f2 : in std_logic;
      f20 : in std_logic;
      f21 : in std_logic;
      f22 : in std_logic;
      f3 : in std_logic;
      f4 : in std_logic;
      f5 : in std_logic;
      f6 : in std_logic;
      f7 : in std_logic;
      f8 : in std_logic;
      f9 : in std_logic;
      fpm : in std_logic;
      AGlamp : out std_logic;
      cs : out std_logic;
      sclk : out std_logic;
      sdata : out std_logic
   );
end wrapper_for_TOP;

architecture rtl of wrapper_for_TOP is

component TOP
 port (
   F25 : in std_logic;
   INT : in std_logic;
   RDY : in std_logic;
   XTL : in std_logic;
   ack : in std_logic;
   cwp : in std_logic;
   f1 : in std_logic;
   f10 : in std_logic;
   f11 : in std_logic;
   f12 : in std_logic;
   f13 : in std_logic;
   f14 : in std_logic;
   f15 : in std_logic;
   f16 : in std_logic;
   f17 : in std_logic;
   f18 : in std_logic;
   f19 : in std_logic;
   f2 : in std_logic;
   f20 : in std_logic;
   f21 : in std_logic;
   f22 : in std_logic;
   f3 : in std_logic;
   f4 : in std_logic;
   f5 : in std_logic;
   f6 : in std_logic;
   f7 : in std_logic;
   f8 : in std_logic;
   f9 : in std_logic;
   fpm : in std_logic;
   AGlamp : out std_logic;
   cs : out std_logic;
   sclk : out std_logic;
   sdata : out std_logic
 );
end component;

signal tmp_F25 : std_logic;
signal tmp_INT : std_logic;
signal tmp_RDY : std_logic;
signal tmp_XTL : std_logic;
signal tmp_ack : std_logic;
signal tmp_cwp : std_logic;
signal tmp_f1 : std_logic;
signal tmp_f10 : std_logic;
signal tmp_f11 : std_logic;
signal tmp_f12 : std_logic;
signal tmp_f13 : std_logic;
signal tmp_f14 : std_logic;
signal tmp_f15 : std_logic;
signal tmp_f16 : std_logic;
signal tmp_f17 : std_logic;
signal tmp_f18 : std_logic;
signal tmp_f19 : std_logic;
signal tmp_f2 : std_logic;
signal tmp_f20 : std_logic;
signal tmp_f21 : std_logic;
signal tmp_f22 : std_logic;
signal tmp_f3 : std_logic;
signal tmp_f4 : std_logic;
signal tmp_f5 : std_logic;
signal tmp_f6 : std_logic;
signal tmp_f7 : std_logic;
signal tmp_f8 : std_logic;
signal tmp_f9 : std_logic;
signal tmp_fpm : std_logic;
signal tmp_AGlamp : std_logic;
signal tmp_cs : std_logic;
signal tmp_sclk : std_logic;
signal tmp_sdata : std_logic;

begin

tmp_F25 <= F25;

tmp_INT <= INT;

tmp_RDY <= RDY;

tmp_XTL <= XTL;

tmp_ack <= ack;

tmp_cwp <= cwp;

tmp_f1 <= f1;

tmp_f10 <= f10;

tmp_f11 <= f11;

tmp_f12 <= f12;

tmp_f13 <= f13;

tmp_f14 <= f14;

tmp_f15 <= f15;

tmp_f16 <= f16;

tmp_f17 <= f17;

tmp_f18 <= f18;

tmp_f19 <= f19;

tmp_f2 <= f2;

tmp_f20 <= f20;

tmp_f21 <= f21;

tmp_f22 <= f22;

tmp_f3 <= f3;

tmp_f4 <= f4;

tmp_f5 <= f5;

tmp_f6 <= f6;

tmp_f7 <= f7;

tmp_f8 <= f8;

tmp_f9 <= f9;

tmp_fpm <= fpm;

AGlamp <= tmp_AGlamp;

cs <= tmp_cs;

sclk <= tmp_sclk;

sdata <= tmp_sdata;



u1:   TOP port map (
		F25 => tmp_F25,
		INT => tmp_INT,
		RDY => tmp_RDY,
		XTL => tmp_XTL,
		ack => tmp_ack,
		cwp => tmp_cwp,
		f1 => tmp_f1,
		f10 => tmp_f10,
		f11 => tmp_f11,
		f12 => tmp_f12,
		f13 => tmp_f13,
		f14 => tmp_f14,
		f15 => tmp_f15,
		f16 => tmp_f16,
		f17 => tmp_f17,
		f18 => tmp_f18,
		f19 => tmp_f19,
		f2 => tmp_f2,
		f20 => tmp_f20,
		f21 => tmp_f21,
		f22 => tmp_f22,
		f3 => tmp_f3,
		f4 => tmp_f4,
		f5 => tmp_f5,
		f6 => tmp_f6,
		f7 => tmp_f7,
		f8 => tmp_f8,
		f9 => tmp_f9,
		fpm => tmp_fpm,
		AGlamp => tmp_AGlamp,
		cs => tmp_cs,
		sclk => tmp_sclk,
		sdata => tmp_sdata
       );
end rtl;
