-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: Q1_ControlUnit.vhd
-- date: 4/4/2017
-- Modificação:
--   - Rafael Corsi : nova versão: adicionado reg S
--
-- Unidade que controla os componentes da CPU

library ieee;
use ieee.std_logic_1164.all;

entity controlUnit4 is
    port(
		instruction                 : in STD_LOGIC_VECTOR(17 downto 0);
		zr,ng                       : in STD_LOGIC;
		muxAMI                      : out STD_LOGIC_VECTOR(1 downto 0);
		zx, nx, zy, ny, f, no       : out STD_LOGIC;
		loadA, loadD, loadM, loadPC : out STD_LOGIC
    );
end entity;

architecture arch of controlUnit4 is

begin

  --=================================--
  -- implementar somente o sinal do mux novo
  -- muxAMI
  -- não precisa implementar os demais
  --=================================--


end architecture;
