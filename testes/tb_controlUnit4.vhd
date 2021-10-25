-- Elementos de Sistemas
-- developed by Luciano Soares
-- 1 tb_q1_ControlUnit.vhd
-- date: 4/4/2017

Library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_ControlUnit4 is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_controlUnit4 is

  component controlUnit4 is
      port(
        instruction                 : in STD_LOGIC_VECTOR(17 downto 0);  -- instrução para executar
        zr,ng                       : in STD_LOGIC;                      -- valores zr(se zero) e ng(se negativo) da ALU
        muxAMI                      : out STD_LOGIC_VECTOR(1 downto 0);                     -- mux que seleciona entre reg. A e Mem. RAM para ALU
        zx, nx, zy, ny, f, no       : out STD_LOGIC;                     -- sinais de controle da ALU
        loadA, loadD, loadM, loadPC : out STD_LOGIC                      -- sinais de load do reg. A, reg. D, Mem. RAM e Program Counter
        );
  end component;

	signal clk : std_logic := '0';
  signal instruction                 : STD_LOGIC_VECTOR(17 downto 0) := (others => '0');
  signal zr,ng                       : STD_LOGIC := '0';
  signal muxAMI                      : STD_LOGIC_VECTOR(1 downto 0);
  signal zx, nx, zy, ny, f, no       : STD_LOGIC := '0';
  signal loadA, loadD,  loadM, loadPC : STD_LOGIC := '0';

begin

	uCU: controlUnit4 port map(instruction, zr, ng, muxAMI, zx, nx, zy, ny, f, no, loadA, loadD, loadM, loadPC);

	clk <= not clk after 100 ps;

  main : process
    begin
      test_runner_setup(runner, runner_cfg);

    instruction <= "00" & "000" & "000010" & "0001" & "000";
    zr <= '0';  ng <= '0';
    wait until clk = '1';
    assert(muxAMI = "01")
      report "**Falha** Teste 1" severity error;

    instruction <= "00" & "001" & "000010" & "0001" & "000";
    zr <= '0';  ng <= '0';
    wait until clk = '1';
    assert(muxAMI = "01")
    report "**Falha** Teste 2" severity error;

    instruction <= "10" & "000" & "000010" & "0001" & "000";
    wait until clk = '1';
    assert(muxAMI = "00")
      report "**Falha** Teste 3" severity error;

    instruction <= "10" & "001" & "000010" & "0001" & "000";
    wait until clk = '1';
    assert(muxAMI = "10")
      report "**Falha** Teste 4" severity error;

    test_runner_cleanup(runner); -- Simulation ends here

	wait;
  end process;
end architecture;
