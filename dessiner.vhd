-- AUTEUR : Charles LADZRO
-- DATE   : 16/01/2020
-- LICENCE: Libre et gratuite
-- Commentaire: Sur la page Github




library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dessiner is 

--generic (
----	horz_vert               : in  integer range 0 to 1;
----	gauche_droite_haut_bas  : in  integer range 0 to 1;
--	ch_debut            		: IN  integer range 0 to 639;  -- 640 pixel au total
--	ch_fin		            : IN  integer range 0 to 639;  -- 640 pixel au total
--	cv_debut            		: IN  integer range 0 to 479;  -- 480 ligne au total
--	cv_fin		            : IN  integer range 0 to 479;  -- 480 ligne au total
--	red_in			         : in  integer range 0 to 255;
--	green_in		            : in  integer range 0 to 255;
--	blue_in    	            : in  integer range 0 to 255 );

port(
   rst      	            : IN  std_logic;         -- reset de l'interface
   clk		               : IN  std_logic;         -- horloge pixel
   c_h   		            : IN  integer range 0 to 1023;        
	c_v   		            : IN  integer range 0 to 1023;
	red			            : out std_logic_vector(3 downto 0); 
	green		               : out std_logic_vector(3 downto 0); 
	blue     	            : out std_logic_vector(3 downto 0) );        
	 
END entity dessiner;


ARCHITECTURE mire OF dessiner IS
BEGIN
  PROCESS(clk,rst)
	variable calc_v : integer;
	variable calc_h : integer;
  BEGIN  
    
    IF rst = '1'  THEN
      red   <= x"0";
      green <= x"0";
      blue  <= x"0"; 
 	 elsif rising_edge(clk)then
	 
		if (37 <= c_v and c_v <= 516) then
			calc_v := (c_v - 37);
			
			if (152 <= c_h and c_h <= 791) then
				calc_h := (c_h - 152);
				
--				if ( (ch_debut <= calc_h and calc_h <= ch_fin) and (cv_debut <= calc_v and calc_v <= cv_fin)) then
--					red   <= std_logic_vector(to_unsigned(red_in, 4));
--					green <= std_logic_vector(to_unsigned(green_in, 4));
--					blue  <= std_logic_vector(to_unsigned(blue_in, 4));

-------------------------------------------------------------------------------------------
--                         DESSIN GLOBALE SUR LECRAN ICI                                 --
-------------------------------------------------------------------------------------------
					
				if ( (0 <= calc_h and calc_h <= 10) and (0 <= calc_v and calc_v <= 10)) then
					red   <= std_logic_vector(to_unsigned(0, 4));
					green <= std_logic_vector(to_unsigned(255, 4));
					blue  <= std_logic_vector(to_unsigned(0, 4));
					
				elsif ( (100 <= calc_h and calc_h <= 150) and (200 <= calc_v and calc_v <= 300)) then
					red   <= std_logic_vector(to_unsigned(0, 4));
					green <= std_logic_vector(to_unsigned(0, 4));
					blue  <= std_logic_vector(to_unsigned(255, 4));
				else
					red <= x"0";
					green <= x"0";
					blue <= x"0";
				end if;
			
			else
				red <= x"0";
				green <= x"0";
				blue <= x"0";	
			end if;
			
		else		
			red <= x"0";
			green <= x"0";
			blue <= x"0";
		end if;
 	 	
    END IF;
  END PROCESS;
END architecture;
			
