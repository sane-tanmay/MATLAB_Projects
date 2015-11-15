

%% Test to verify the output of display_Timesimulation function
function tests = display_timeTest
tests = functiontests(localfunctions);
end
%% Test to verify initialization of clock hands and clock
function display_time_sim1_Test(testCase)

val= display_timeSim(1,10,10);

 actSolution =val;
 expSolution = 1;
verifyEqual(testCase,actSolution,expSolution);
end

