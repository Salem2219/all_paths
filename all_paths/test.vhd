library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity test is 
    port (clk, rst, start : in std_logic;
    n : in std_logic_vector(2 downto 0));
end test;

architecture rtl of test is
    component toplevel is
    port ( clk, rst, start : in std_logic;
    n : in std_logic_vector(2 downto 0);
    A : in std_logic_vector(3 downto 0);
    wr : out std_logic;
    row, col : out std_logic_vector(2 downto 0);
    din : out std_logic_vector(3 downto 0));
    end component;
    component matrix is
    port(clk, wr : in std_logic;
    row_addr : in std_logic_vector(2 downto 0);
    col_addr : in std_logic_vector(2 downto 0);
    din : in std_logic_vector(3 downto 0);
    dout : out std_logic_vector(3 downto 0));
    end component;
    signal wr : std_logic;
    signal row, col : std_logic_vector (2 downto 0);
    signal din, A : std_logic_vector(3 downto 0);
    begin
        u1 : toplevel port map (clk, rst, start, n, A, wr, row, col, din);
        u2 : matrix port map (clk, wr, row, col, din, A);
    end rtl;