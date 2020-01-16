-- AUTEUR : Charles LADZRO
-- DATE   : 16/01/2020
-- LICENCE: Libre et gratuite
-- Commentaire: Sur la page Github




library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity countVH is port(
    rst      	: IN  std_logic;         -- reset de l'interface
    clk		   : IN  std_logic;         -- horloge pixel
	 c_h    : OUT integer range 0 to 1023;     -- compteur de pixels
	 c_v    : OUT integer range 0 to 1023 );   -- compteur de lignes
	 
END entity countVH;


ARCHITECTURE RTL OF countVH IS
	signal  count_v : integer RANGE 0 TO 1023 := 0; 
	signal  count_h : integer RANGE 0 TO 1023 := 0;
BEGIN 

  PROCESS(clk, rst)
		
  BEGIN  
    
    IF (rst = '1')  THEN
      count_v <= 0;
      count_h <= 0;
            
 	 elsif rising_edge(clk)then
	 
			if ((count_h + 1) = 800) then
				count_v <= (count_v + 1) MOD 525;
			end if;
			count_h <= (count_h + 1) MOD 800; 
      
    END IF;
  END PROCESS;
  
  c_v <= count_v;
  c_h <= count_h;
END RTL;
