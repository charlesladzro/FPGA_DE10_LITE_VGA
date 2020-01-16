-- AUTEUR : Charles LADZRO
-- DATE   : 16/01/2020
-- LICENCE: Libre et gratuite
-- Commentaire: Sur la page Github




LIBRARY ieee;
USE ieee.std_logic_1164.all; 


ENTITY DE0_top_dessiner IS 
	PORT
	(
		MAX10_CLK1_50 :  IN  STD_LOGIC;
		KEY :  IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
--		SW :  IN  STD_LOGIC_VECTOR(9 DOWNTO 0);
		VGA_HS :  OUT  STD_LOGIC;
		VGA_VS :  OUT  STD_LOGIC;
		VGA_R :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		VGA_G :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		VGA_B :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END entity;

ARCHITECTURE struct OF DE0_top_dessiner IS 

SIGNAL	rst :  STD_LOGIC;
SIGNAL	clk_vga :  STD_LOGIC;

BEGIN 

U1 : entity work.interface_dessiner
PORT MAP(rst, clk_vga, VGA_HS, VGA_VS, VGA_R, VGA_G, VGA_B);

U2 : entity work.pll_vga
PORT MAP(MAX10_CLK1_50, clk_vga);


rst <= NOT(KEY(0));

END architecture;