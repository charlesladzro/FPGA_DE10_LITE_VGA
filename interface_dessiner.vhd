-- AUTEUR : Charles LADZRO
-- DATE   : 16/01/2020
-- LICENCE: Libre et gratuite
-- Commentaire: Sur la page Github




library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity interface_dessiner is port(
    rst      	: IN  std_logic;         -- reset de l'interface
    clk		   : IN  std_logic;         -- horloge pixel
	 hor_sync   : OUT std_logic;         -- synchronisation horizontale
	 ver_sync   : OUT std_logic;         -- synchronisation verticale
	 red	      : OUT std_logic_vector(3 downto 0);  
    green	   : OUT std_logic_vector(3 downto 0); 
    blue	    	: OUT std_logic_vector(3 downto 0) );
END entity ;


ARCHITECTURE struct OF interface_dessiner IS
   signal h,v       : integer range 0 to 1023;
BEGIN

uut0: entity work.SyncGen(struct) port map(rst, clk, h, v, hor_sync, ver_sync);

uut1: entity work.dessiner(mire) port map(rst, clk, h, v, red, green, blue);

END architecture;
