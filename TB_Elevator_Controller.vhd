----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2023 11:18:00 PM
-- Design Name: 
-- Module Name: TB_Elevator_Controller - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use std.env.finish;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_Elevator_Controller is
--  Port ( );
end TB_Elevator_Controller;

architecture Behavioral of TB_Elevator_Controller is

        signal Clks : std_logic := '0';
        signal resets : std_logic:= '1';
        signal curfloors : std_logic_vector(2 downto 0);
        signal Up_Down_buttons : std_logic_vector(2 downto 0); 
        signal floor_reqs: std_logic_vector(2 downto 0); -- 00-1st floor, 01-2nd floor, 10-3rd floor, 11-4th floor, 100-5th floor
        signal doors_Open, doors_Close: std_logic; -- 0-open, 1-close
        signal temp: std_logic;
        
begin
Clks <= not Clks after 1 ns; --toggle the clock every 1 ns

storage_inst : entity work.controller
 port map (
 Clk => Clks, reset => resets,  Up_Down_button => Up_Down_buttons, floor_req => floor_reqs,
  door_Open => doors_Open, door_Close => doors_Close, curfloor => curfloors, temp => temp
 );
 
stim: process
begin
------------TestCase1-------------------
--    temp <= '0';
    
--    --wait for 2 ns;
--    curfloors <= "100";
--    curfloors <= (others => 'Z') after 2 ns;     
--    wait for 2 ns;
--    floor_reqs <= "010";
--    wait for 2 ns;
--    floor_reqs <= "001"; 
--    wait for 2 ns;
--    Up_Down_buttons <= "011";
--    wait for 1 ns;
-----------------------------------------------------------------------

----------TestCase2-------------------
--wait for 2 ns;
   
wait for 2 ns;
floor_reqs <= "010";
wait for 1 ns;
Up_Down_buttons <= "011";
wait for 2 ns;
floor_reqs <= "001"; 
wait for 2 ns;
---------------------------------------------------------------------    
    
------------TestCase3-------------------
--temp <= '0';
--curfloors <= "001";
--curfloors <= (others => 'Z') after 2 ns;   
--wait for 2 ns;
--floor_reqs <= "100";
--wait for 2 ns;
--floor_reqs <= "000"; 
--wait for 2 ns;
--Up_Down_buttons <= "011";
--wait for 1 ns;
-----------------------------------------------------------------------

------------TestCase4-------------------
--temp <= '0';
--curfloors <= "011";
--curfloors <= (others => 'Z') after 2 ns;   
--wait for 2 ns;
--floor_reqs <= "000";
--wait for 2 ns;
--floor_reqs <= "001"; 
--wait for 2 ns;
--Up_Down_buttons <= "100";
--wait for 1 ns;
-----------------------------------------------------------------------

------------TestCase5-------------------
--temp <= '0';
--curfloors <= "001";
--curfloors <= (others => 'Z') after 2 ns;   
--wait for 2 ns;
--floor_reqs <= "000";
--wait for 2 ns;
--floor_reqs <= "011"; 
--wait for 1 ns;

-----------------------------------------------------------------------

finish;
end process;

end Behavioral;
