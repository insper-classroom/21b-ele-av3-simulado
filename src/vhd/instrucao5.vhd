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

entity instrucao5 is
    port(
		instruction                 : out STD_LOGIC_VECTOR(17 downto 0)
    );
end entity;

architecture arch of instrucao5 is

begin

  --=================================--
  -- Substitua o "000000...."
  -- pela operação que realiza %D > 1
  --=================================--
  instruction <= "000000000000000000";

end architecture;
