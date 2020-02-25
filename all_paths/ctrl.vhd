library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity ctrl is
    port (clk, rst, start, templttemp, keqnplus1, jeqnplus1, ieqnplus1 : in std_logic;
    i_ld, i_sel, j_ld, j_sel, k_ld, k_sel, row_sel, col_sel, temp1_ld, temp2_ld, wr : out std_logic);
end ctrl;

architecture rtl of ctrl is
    type state_type is (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9);
    signal current_state, next_state: state_type; 
    begin
        process (rst, clk)
        begin
            if (rst ='1') then
            current_state <= s0;
            elsif (rising_edge(clk)) then
            current_state <= next_state;
            end if;
        end process;
        process(current_state, start, templttemp, keqnplus1, jeqnplus1, ieqnplus1)
        begin
            case current_state is
               when s0 =>
               i_ld <= '0';
               i_sel <= '0';
               j_ld <= '0';
               j_sel <= '0';
               k_ld <= '0';
               k_sel <= '0';
               row_sel <= '0';
               col_sel <= '0';
               wr <= '0';
               temp1_ld <= '0';
               temp2_ld <= '0';
               next_state <= s1;
               when s1 =>
               i_ld <= '0';
               i_sel <= '0';
               j_ld <= '0';
               j_sel <= '0';
               k_ld <= '1';
               k_sel <= '0';
               row_sel <= '0';
               col_sel <= '0';
               wr <= '0';
               temp1_ld <= '0';
               temp2_ld <= '0';
               if (start = '1') then
               next_state <= s2;
               else
               next_state <= s1;
               end if;
               when s2 =>
               i_ld <= '1';
               i_sel <= '0';
               j_ld <= '0';
               j_sel <= '0';
               k_ld <= '0';
               k_sel <= '0';
               row_sel <= '0';
               col_sel <= '0';
               wr <= '0';
               temp1_ld <= '0';
               temp2_ld <= '0';
               if (keqnplus1 = '0') then
               next_state <= s3;
               else
               next_state <= s1;
               end if;
               when s3 =>
               i_ld <= '0';
               i_sel <= '0';
               j_ld <= '1';
               j_sel <= '0';
               k_ld <= '0';
               k_sel <= '0';
               row_sel <= '0';
               col_sel <= '0';
               wr <= '0';
               temp1_ld <= '0';
               temp2_ld <= '0';
               if (ieqnplus1 = '0') then
               next_state <= s4;
               else
               next_state <= s9;
               end if;
               when s4 =>
               i_ld <= '0';
               i_sel <= '0';
               j_ld <= '0';
               j_sel <= '0';
               k_ld <= '0';
               k_sel <= '0';
               row_sel <= '0';
               col_sel <= '0';
               wr <= '0';
               temp1_ld <= '0';
               temp2_ld <= '0';
               if (jeqnplus1 = '0') then
               next_state <= s5;
               else
               next_state <= s8;
               end if;
               when s5 =>
               i_ld <= '0';
               i_sel <= '0';
               j_ld <= '0';
               j_sel <= '0';
               k_ld <= '0';
               k_sel <= '0';
               row_sel <= '0';
               col_sel <= '0';
               wr <= '0';
               temp1_ld <= '1';
               temp2_ld <= '0';
               next_state <= s6;
               when s6 =>
               i_ld <= '0';
               i_sel <= '0';
               j_ld <= '0';
               j_sel <= '0';
               k_ld <= '0';
               k_sel <= '0';
               row_sel <= '1';
               col_sel <= '1';
               wr <= '0';
               temp1_ld <= '0';
               temp2_ld <= '1';
               next_state <= s7;
               when s7 =>
               i_ld <= '0';
               i_sel <= '0';
               j_ld <= '1';
               j_sel <= '1';
               k_ld <= '0';
               k_sel <= '0';
               row_sel <= '0';
               col_sel <= '1';
               wr <= templttemp;
               temp1_ld <= '0';
               temp2_ld <= '0';
               next_state <= s4;
               when s8 =>
               i_ld <= '1';
               i_sel <= '1';
               j_ld <= '0';
               j_sel <= '0';
               k_ld <= '0';
               k_sel <= '0';
               row_sel <= '0';
               col_sel <= '0';
               wr <= '0';
               temp1_ld <= '0';
               temp2_ld <= '0';
               next_state <= s3;
               when others =>
               i_ld <= '0';
               i_sel <= '0';
               j_ld <= '0';
               j_sel <= '0';
               k_ld <= '1';
               k_sel <= '1';
               row_sel <= '0';
               col_sel <= '0';
               wr <= '0';
               temp1_ld <= '0';
               temp2_ld <= '0';
               next_state <= s2;
            end case;
        end process;
    end rtl;


