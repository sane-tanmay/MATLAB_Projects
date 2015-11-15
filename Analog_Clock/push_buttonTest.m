

%% Test to verify the working of a push button 
function tests = push_buttonTest
tests = functiontests(localfunctions);
end
%% Test to verify button press
function test_verfy_buttonON(testCase)
global p_val;
p_val=0;
val = push_button_sim();
actSolution =double(val);
expSolution = 1;
verifyEqual(testCase,actSolution,expSolution);
end

%% Test to verify button off
function test_verfy_buttonOFF(testCase)
global p_val;
p_val=1;
val = push_button_sim();
actSolution =double(val);
expSolution = 0;
verifyEqual(testCase,actSolution,expSolution);
end

