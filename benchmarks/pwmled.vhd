library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pwmled is
  port (
    clk : in std_logic;
    rst : in std_logic;
    pwm_out : out std_logic);
end pwmled;

architecture impl of pwmled is
  signal counter : unsigned(15 downto 0);
  signal pwm : std_logic;
begin
  pwm <= '1' when (counter(6 downto 0) < counter(14 downto 8)) else '0';
  pwm_out <= counter(15) xor pwm;

  process(clk, rst)
  begin
    if(rst = '0') then
      counter <= (others => '0');
    elsif(rising_edge(clk)) then
      counter <= counter + 1;
    end if;
  end process;
end impl;

