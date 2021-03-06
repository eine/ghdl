library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity tb_psl_onehot0 is
end entity tb_psl_onehot0;


architecture psl of tb_psl_onehot0 is

  procedure seq (s : string; signal clk : std_logic; signal o : out std_logic)
  is
  begin
    for i in s'range loop
      wait until rising_edge(clk);
      case s(i) is
        when '0' | '_' => o <= '0';
        when '1' | '-' => o <= '1';
        when others    => o <= 'X';
      end case;
    end loop;
    wait;
  end seq;

  procedure hseq (s : string; signal clk : std_logic; signal o : out std_logic_vector(3 downto 0))
  is
  begin
    for i in s'range loop
      wait until rising_edge(clk);
      case s(i) is
        when '0' | '_' => o <= x"0";
        when '1'       => o <= x"1";
        when '2'       => o <= x"2";
        when '3'       => o <= x"3";
        when '4'       => o <= x"4";
        when '5'       => o <= x"5";
        when '6'       => o <= x"6";
        when '7'       => o <= x"7";
        when '8'       => o <= x"8";
        when '9'       => o <= x"9";
        when 'a' | 'A' => o <= x"A";
        when 'b' | 'B' => o <= x"B";
        when 'c' | 'C' => o <= x"C";
        when 'd' | 'D' => o <= x"D";
        when 'e' | 'E' => o <= x"E";
        when 'f' | 'F' | '-' => o <= x"F";
        when others => o <= x"X";
      end case;
    end loop;
    wait;
  end hseq;

  signal a, b : std_logic_vector(3 downto 0) := x"0";
  signal c    : natural range 0 to 15 := 0;
  signal clk  : std_logic := '1';

begin

  dut: entity work.psl_onehot0 port map (clk, a, b, c);

  clk <= not clk after 500 ps;

  --             012345678901234567
  SEQ_A : hseq ("000111222444888888", clk, a);
  SEQ_B : hseq ("000111222444888fff", clk, b);

  c <= to_integer(unsigned(b));

end architecture psl;
