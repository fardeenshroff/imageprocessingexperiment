VHDL Code:

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Grayscale_Filter is
    Port (
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        r_in : in STD_LOGIC_VECTOR(7 downto 0); -- Red channel
        g_in : in STD_LOGIC_VECTOR(7 downto 0); -- Green channel
        b_in : in STD_LOGIC_VECTOR(7 downto 0); -- Blue channel
        gray_out : out STD_LOGIC_VECTOR(7 downto 0) -- Grayscale value
    );
end Grayscale_Filter;

architecture Behavioral of Grayscale_Filter is
begin
    process(clk, rst)
    variable temp_gray : unsigned(9 downto 0);
    begin
        if rst = '1' then
            gray_out <= (others => '0');
        elsif rising_edge(clk) then
            -- Compute grayscale as (0.3*R + 0.59*G + 0.11*B)
            temp_gray := (unsigned(r_in) * 3) / 10 + 
                         (unsigned(g_in) * 59) / 100 + 
                         (unsigned(b_in) * 11) / 100;
            gray_out <= std_logic_vector(temp_gray(7 downto 0));
        end if;
    end process;
end Behavioral;


---
