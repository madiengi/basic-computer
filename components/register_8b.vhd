library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity register_8b is 
    port(clk, ld_en : in std_logic;
         d_in : in std_logic_vector(7 downto 0);
         q_out : out std_logic_vector(7 downto 0));
end register_8b;

architecture rtl of register_8b is
    signal reg : std_logic_vector(7 downto 0);
    
    begin 
    process(clk)
    begin
        -- synchronous load 
        if (clk'event and clk = '1') then 
            if (ld_en = '1') then 
                reg <= d_in;
            else
                reg <= reg;
            end if;
        end if;
    end process;

    q_out <= reg;

end rtl;