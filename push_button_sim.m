% This function tests the simulation of a push button

function z = push_button_sim()
global p_val;
p_val=~p_val;
z=p_val;
end
