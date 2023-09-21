Library IEEE;
use IEEE.std_logic_1164.all;

entity veding_machine is
port(CLK, RST : in std_logic;
	  nickel_in, dime_in, quarter_in : in boolean;
	  candy_out, nickel_out, dime_out : out std_logic);
end entity veding_machine;

architecture FSM of veding_machine is
	type state is(ST0, ST5, ST10, ST15, ST20, ST25, ST30, ST35, ST40, ST45);
	signal pr_state, nx_state : state;
--	attribute enum_encoding : string;
--	attribute enum_encoding of state: type is "sequential";
begin
	
	process(RST, CLK) is
		begin
		
			if(RST = '1') then
				pr_state <= ST0;
				elsif(CLK'event and CLK = '1') then
					pr_state <= nx_state;
			end if;
		end process;
	
	process(pr_state, nickel_in, dime_in, quarter_in)
		begin
			case pr_state is
				when ST0 =>
					Candy_out <= '0';
					nickel_out <= '0';
					dime_out <= '0';
					if(nickel_in) then
						nx_state <= ST5;
						elsif(dime_in) then
							nx_state <= ST10;
						elsif(quarter_in) then
							nx_state <= ST25;
						else 
							nx_state <= ST0;
					end if;
					
				when ST5 =>
					Candy_out <= '0';
					nickel_out <= '0';
					dime_out <= '0';
					if(nickel_in) then
						nx_state <= ST10;
						elsif(dime_in) then
							nx_state <= ST15;
						elsif(quarter_in) then
							nx_state <= ST30;
						else 
							nx_state <= ST5;
					end if;
					
				when ST10 =>
					Candy_out <= '0';
					nickel_out <= '0';
					dime_out <= '0';
					if(nickel_in) then
						nx_state <= ST15;
						elsif(dime_in) then
							nx_state <= ST20;
						elsif(quarter_in) then
							nx_state <= ST35;
						else 
							nx_state <= ST10;
					end if;
					
				when ST15 =>
					Candy_out <= '0';
					nickel_out <= '0';
					dime_out <= '0';
					if(nickel_in) then
						nx_state <= ST20;
						elsif(dime_in) then
							nx_state <= ST25;
						elsif(quarter_in) then
							nx_state <= ST40;
						else 
							nx_state <= ST15;
					end if;
					
				when ST20 =>
					Candy_out <= '0';
					nickel_out <= '0';
					dime_out <= '0';
					if(nickel_in) then
						nx_state <= ST25;
						elsif(dime_in) then
							nx_state <= ST30;
						elsif(quarter_in) then
							nx_state <= ST45;
						else 
							nx_state <= ST20;
					end if;
					
				when ST25 =>
					Candy_out <= '1';
					nickel_out <= '0';
					dime_out <= '0';
					nx_state <= ST0;
				
				when ST30 =>
					Candy_out <= '1';
					nickel_out <= '1';
					dime_out <= '0';
					nx_state <= ST0;
					
				when ST35 =>
					Candy_out <= '1';
					nickel_out <= '0';
					dime_out <= '1';
					nx_state <= ST0;
					
				when ST40 =>
					Candy_out <= '0';
					nickel_out <= '1';
					dime_out <= '0';
					nx_state <= ST35;
					
				when ST45 =>
					Candy_out <= '0';
					nickel_out <= '0';
					dime_out <= '1';
					nx_state <= ST35;
			END CASE;
		END PROCESS;
END ARCHITECTURE FSM;
					
