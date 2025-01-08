----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2023 03:34:09 PM
-- Design Name: 
-- Module Name: traffic_light_controller - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--use ieee.NUMERIC_STD.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity controller is
Port (
        Clk : in std_logic;
        reset : in std_logic;
        curfloor : in std_logic_vector(2 downto 0); -- used for Initial floor 
        Up_Down_button : in std_logic_vector(2 downto 0); -- Request from outside buttons on each floor
        floor_req: in std_logic_vector(2 downto 0); -- 00-1st floor, 01-2nd floor, 10-3rd floor, 11-4th floor, 100-5th floor
        door_Open, door_Close: out std_logic; -- 0-open, 1-close
        temp: in std_logic
    );
end controller;

architecture Behavioral of controller is
    type FSM_States is (Floor1, Floor2, Floor3, Floor4, Floor5);

    SIGNAL current_state, next_state: FSM_States;

    begin
    
        process(reset,Clk)
        begin
            if(reset = '0') then
                current_state <= Floor1;
            elsif(temp = '0') then
                if(curfloor = "001") then
                    current_state <= Floor2;
                elsif(curfloor = "010") then
                    current_state <= Floor3;
                elsif(curfloor = "011") then
                    current_state <= Floor4;
                elsif(curfloor = "100") then
                    current_state <= Floor5;
                else
                    current_state <= next_state;
                end if;
            elsif(rising_edge(Clk)) then
                current_state <= next_state;
            end if;
        end process;
                 
        process(curfloor, current_state, floor_req, Up_Down_button)
        begin
            case current_state is
                when Floor1 =>
                    door_Open <= '1';
                    door_Close <= '0';
                if(floor_req = "001" or Up_Down_button = "001") then 
                    door_Open <= '0';
                    door_Close <= '1'; 
                    next_state <= Floor2;
                elsif(floor_req = "010" or Up_Down_button = "010") then
                    door_Open <= '0';
                    door_Close <= '1'; 
                    next_state <= Floor3;
                elsif(floor_req = "011" or Up_Down_button = "011") then
                    door_Open <= '0';
                    door_Close <= '1'; 
                    next_state <= Floor4;
                elsif(floor_req = "100" or Up_Down_button = "100") then
                    door_Open <= '0';
                    door_Close <= '1'; 
                    next_state <= Floor5;
                else
                    door_Open <= '0';
                    door_Close <= '1';
                    next_state <= Floor1;       
                end if;    
                
                when Floor2 =>
                    --curfloor <= "01";
                    door_Open <= '1';
                    door_Close <= '0';
                if(floor_req = "000" or Up_Down_button = "000") then
                    door_Open <= '0';
                    door_Close <= '1'; 
                    next_state <= Floor1;
                elsif(floor_req = "010" or Up_Down_button = "010") then
                    door_Open <= '0';
                    door_Close <= '1'; 
                    next_state <= Floor3;
                elsif(floor_req = "011" or Up_Down_button = "011") then
                    door_Open <= '0';
                    door_Close <= '1'; 
                    next_state <= Floor4;
                elsif(floor_req = "100" or Up_Down_button = "100") then
                    door_Open <= '0';
                    door_Close <= '1'; 
                    next_state <= Floor5;
                else
                    door_Open <= '0';
                    door_Close <= '1';
                    next_state <= Floor2;       
                end if;
                
                when Floor3 =>
                    --curfloor <= "10";
                    door_Open <= '1';
                    door_Close <= '0';
                if(floor_req = "000" or Up_Down_button = "000") then
                    door_Open <= '0';
                    door_Close <= '1'; 
                    next_state <= Floor1;
                elsif(floor_req = "001" or Up_Down_button = "001") then
                    door_Open <= '0';
                    door_Close <= '1'; 
                    next_state <= Floor2;
                elsif(floor_req = "011" or Up_Down_button = "011") then
                    door_Open <= '0';
                    door_Close <= '1'; 
                    next_state <= Floor4;
                elsif(floor_req = "100" or Up_Down_button = "100") then
                    door_Open <= '0';
                    door_Close <= '1'; 
                    next_state <= Floor5;
                else
                    door_Open <= '0';
                    door_Close <= '1';
                    next_state <= Floor3;       
                end if;
                
                when Floor4 =>
                    door_Open <= '1';
                    door_Close <= '0';
                if(floor_req = "000" or Up_Down_button = "000") then
                    door_Open <= '0';
                    door_Close <= '1'; 
                    next_state <= Floor1;
                elsif(floor_req = "001" or Up_Down_button = "001") then
                    door_Open <= '0';
                    door_Close <= '1'; 
                    next_state <= Floor2;
                elsif(floor_req = "010" or Up_Down_button = "010") then
                    door_Open <= '0';
                    door_Close <= '1'; 
                    next_state <= Floor3;
                elsif(floor_req = "100" or Up_Down_button = "100") then
                    door_Open <= '0';
                    door_Close <= '1'; 
                    next_state <= Floor5;
                else
                    door_Open <= '0';
                    door_Close <= '1';
                    next_state <= Floor4;       
                end if;
                
                when Floor5 =>
                    door_Open <= '1';
                    door_Close <= '0';
                if(floor_req = "000" or Up_Down_button = "000") then
                    door_Open <= '0';
                    door_Close <= '1'; 
                    next_state <= Floor1;
                elsif(floor_req = "001" or Up_Down_button = "001") then
                    door_Open <= '0';
                    door_Close <= '1'; 
                    next_state <= Floor2;
                elsif(floor_req = "010" or Up_Down_button = "010") then
                    door_Open <= '0';
                    door_Close <= '1'; 
                    next_state <= Floor3;
                elsif(floor_req = "011" or Up_Down_button = "011") then
                    door_Open <= '0';
                    door_Close <= '1'; 
                    next_state <= Floor4;
                else
                    door_Open <= '0';
                    door_Close <= '1';
                    next_state <= Floor5;       
                end if;
                             
                --when others => next_state <= Floor1;
                when others =>
                if(curfloor = "001") then
                    next_state <= Floor2;
                elsif(curfloor = "010") then
                    next_state <= Floor3;
                elsif(curfloor = "011") then
                    next_state <= Floor4;
                elsif(curfloor = "100") then
                    next_state <= Floor5;
                else
                    next_state <= Floor1;
                end if;
            end case;
  
        end process;  

end Behavioral;
