library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity dp is
    port (clk, rst, i_ld, i_sel, j_ld, j_sel, k_ld, k_sel, row_sel, col_sel, temp1_ld, temp2_ld : in std_logic;
    n : in std_logic_vector(2 downto 0);
    A : in std_logic_vector(3 downto 0);
    templttemp, keqnplus1, jeqnplus1, ieqnplus1 : out std_logic;
    row, col : out std_logic_vector(2 downto 0);
    din : out std_logic_vector(3 downto 0));
end dp;

architecture rtl of dp is
    component adder3 is
    port (a, b : in std_logic_vector(2 downto 0);
    y : out std_logic_vector(2 downto 0));
    end component;
    component adder4 is
    port (a, b : in std_logic_vector(4 downto 0);
    y : out std_logic_vector(4 downto 0));
    end component;
    component comp is
    port (a, b : in std_logic_vector(2 downto 0);
    y : out std_logic);
    end component;
    component complt is
    port (a, b : in std_logic_vector(4 downto 0);
    y : out std_logic);
    end component;
    component mux2 is
    port (s : in std_logic;
    a, b: in std_logic_vector(2 downto 0);
    y: out std_logic_vector(2 downto 0)) ;
    end component;
    component reg3 is
    port (clk, rst, en: in std_logic;
    reg_in: in std_logic_vector(2 downto 0);
    reg_out: out std_logic_vector(2 downto 0));
    end component;
    component reg4 is
    port (clk, rst, en: in std_logic;
    reg_in: in std_logic_vector(3 downto 0);
    reg_out: out std_logic_vector(3 downto 0));
    end component;
    signal iplus1, i_in, i, jplus1, j, j_in, kplus1, k, k_in, nplus1 : std_logic_vector(2 downto 0);
    signal temp1, temp2 : std_logic_vector(3 downto 0);
    signal temp1_ex, temp2_ex, temp1plustemp2, A_ex : std_logic_vector(4 downto 0);
    begin
    A_ex(4) <= '0';
    A_ex (3 downto 0) <= A;
    temp1_ex(4) <= '0';
    temp2_ex(4) <= '0';
    temp1_ex(3 downto 0) <= temp1;
    temp2_ex(3 downto 0) <= temp2;
    i_adder : adder3 port map (i, "001", iplus1);
    i_mux : mux2 port map (i_sel, "000", iplus1, i_in);
    i_reg : reg3 port map (clk, rst, i_ld, i_in, i);
    j_adder : adder3 port map (j, "001", jplus1);
    j_mux : mux2 port map (j_sel, "000", jplus1, j_in);
    j_reg : reg3 port map (clk, rst, j_ld, j_in, j);
    k_adder : adder3 port map (k, "001", kplus1);
    k_mux : mux2 port map (k_sel, "000", kplus1, k_in);
    k_reg : reg3 port map (clk, rst, k_ld, k_in, k);
    row_mux : mux2 port map (row_sel, i, k, row);
    col_mux : mux2 port map (col_sel, k, j, col);
    temp1_reg : reg4 port map (clk, rst, temp1_ld, A, temp1);
    temp2_reg : reg4 port map (clk, rst, temp2_ld, A, temp2);
    temp_adder : adder4 port map (temp1_ex, temp2_ex, temp1plustemp2);
    temp_comp : complt port map (temp1plustemp2, A_ex, templttemp);
    n_adder : adder3 port map (n, "001", nplus1);
    i_comp : comp port map (i, nplus1, ieqnplus1);
    j_comp : comp port map (j, nplus1, jeqnplus1);
    k_comp : comp port map (k, nplus1, keqnplus1);
    din <= temp1plustemp2(3 downto 0);
end rtl;
