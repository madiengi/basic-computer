library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_12b is
    port(clk, ld_en, inc, clr: in std_logic;
         ld_value: in std_logic_vector(11 downto 0);   
         cnt_out : out std_logic_vector(11 downto 0));
end counter_12b;

architecture rtl of counter_12b is
    signal reg : unsigned(11 downto 0);

    begin
    process(clk, clr)
    begin
        -- asynchonous reset
        if (clr = '1') then 
            reg <= (others => '0');
        -- synchronous clock edge
        elsif (clk'event and clk = '1') then 
            if (ld_en = '1') then
                reg <= unsigned(ld_value);
            elsif (inc = '1') then
                reg <= reg + 1;
            else
                reg <= reg;
            end if;
        end if;
    end process;

    cnt_out <= std_logic_vector(reg);
    
end rtl;
            
