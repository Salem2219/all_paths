library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity toplevel is
    port ( clk, rst, start : in std_logic;
    n : in std_logic_vector(2 downto 0);
    A : in std_logic_vector(3 downto 0);
    wr : out std_logic;
    row, col : out std_logic_vector(2 downto 0);
    din : out std_logic_vector(3 downto 0));
end toplevel;

architecture rtl of toplevel is
    component dp is
    port (clk, rst, i_ld, i_sel, j_ld, j_sel, k_ld, k_sel, row_sel, col_sel, temp1_ld, temp2_ld : in std_logic;
    n : in std_logic_vector(2 downto 0);
    A : in std_logic_vector(3 downto 0);
    templttemp, keqnplus1, jeqnplus1, ieqnplus1 : out std_logic;
    row, col : out std_logic_vector(2 downto 0);
    din : out std_logic_vector(3 downto 0));
    end component;
    component ctrl is
    port (clk, rst, start, templttemp, keqnplus1, jeqnplus1, ieqnplus1 : in std_logic;
    i_ld, i_sel, j_ld, j_sel, k_ld, k_sel, row_sel, col_sel, temp1_ld, temp2_ld, wr : out std_logic);
    end component;
    signal i_ld, i_sel, j_ld, j_sel, k_ld, k_sel, row_sel, col_sel, temp1_ld, temp2_ld, templttemp, keqnplus1, jeqnplus1, ieqnplus1 : std_logic;
    begin
        datapath : dp port map (clk, rst, i_ld, i_sel, j_ld, j_sel, k_ld, k_sel, row_sel, col_sel, temp1_ld, temp2_ld, n, A, templttemp, keqnplus1, jeqnplus1, ieqnplus1, row, col, din);
        control : ctrl port map (clk, rst, start, templttemp, keqnplus1, jeqnplus1, ieqnplus1, i_ld, i_sel, j_ld, j_sel, k_ld, k_sel, row_sel, col_sel, temp1_ld, temp2_ld, wr);
    end rtl;