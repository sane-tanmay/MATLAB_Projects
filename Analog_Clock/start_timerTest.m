

%% Test to verify the output of start_Timertest 
function tests = start_timerTest
tests = functiontests(localfunctions);
end
%% Test to verify Execution Mode of the Timer
function testTimerExecutionMode(testCase)
val = start_timer();
actSolution =val.ExecutionMode;
expSolution = 'fixedRate';
verifyEqual(testCase,actSolution,expSolution);
end

%% Test to verify Period of the Timer
function testTimerPeriodVerfication(testCase)
val = start_timer();
actSolution =val.Period;
expSolution = 1;
verifyEqual(testCase,actSolution,expSolution,'AbsTol',1);
end

%% Test to correctness of the Timer Call Back Function
function testTimerCallbackVerfication(testCase)
val = start_timer();
actSolution =(val.TimerFcn);

verifyClass(testCase, actSolution, 'cell');
end