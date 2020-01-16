-- AUTEUR : Charles LADZRO
-- DATE   : 16/01/2020
-- LICENCE: Libre et gratuite
-- Commentaire: Sur la page Github



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SyncGen is port(
    rst      	: IN  std_logic;         -- reset de l'interface
    clk		   : IN  std_logic;         -- horloge pixel
	 c_h    		: OUT integer range 0 to 1023;        
	 c_v    		: OUT integer range 0 to 1023;        
	 hor_sync   : OUT std_logic;    -- synchronisation horizentale
	 ver_sync   : OUT std_logic );  -- synchronisation verticale
END entity SyncGen;


ARCHITECTURE struct OF SyncGen IS
	signal v,h : integer range 0 to 1023;
BEGIN

uut0: entity work.countVH(RTL) port map(rst => rst ,clk => clk , c_h => h   , c_v => v );

uut1: entity work.SyncVH(RTL) port map(rst => rst, clk => clk, c_v => v, c_h => h, hor_sync => hor_sync, ver_sync => ver_sync);

c_v <= v;
c_h <= h;

END struct;
