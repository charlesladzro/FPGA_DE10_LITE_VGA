-- AUTEUR : Charles LADZRO
-- DATE   : 16/01/2020
-- LICENCE: Libre et gratuite
-- Commentaire: Sur la page Github



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SyncVH is port(
    rst      	: IN  std_logic;         -- reset de l'interface
    clk		   : IN  std_logic;         -- horloge pixel
    c_v   		: IN integer range 0 to 1023;        
	 c_h   		: IN integer range 0 to 1023;
	 hor_sync   : OUT std_logic;    -- synchronisation horizentale
	 ver_sync   : OUT std_logic );  -- synchronisation verticale
	 
END entity SyncVH;


ARCHITECTURE RTL OF SyncVH IS
	signal v_hor_sync   : std_logic := '1';    -- variable synchronisation horizentale
	signal v_ver_sync   : std_logic := '1';    -- variable synchronisation verticale
BEGIN

  PROCESS(clk,rst)
  BEGIN  
    
    IF rst = '1'  THEN
      v_hor_sync <= '1';
      v_ver_sync <= '1';
      
 	 elsif rising_edge(clk)then
	   -- synchronisation horizentale
	   if(8 <= c_h and c_h <= 103) then
	   	v_hor_sync <= '0';

	   else
	   	v_hor_sync <= '1';   
	   end if;
	   
           -- synchronisation verticale
           if(2 <= c_v and c_v <= 3) then
	   	v_ver_sync <= '0';

	   else
	   	v_ver_sync <= '1';   
	   end if;     
      	
      
    END IF;
  END PROCESS;

  hor_sync <= v_hor_sync;
  ver_sync <= v_ver_sync;
  
END RTL;
