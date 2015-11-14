

%% Test to verify the working of a push button 
function tests = edit_typeTest
tests = functiontests(localfunctions);
end
%% Test to verify hr data type
function test_verfy_hrType(testCase)
val='5';
actSol =edit_feed_hrTest(val);
actSolution=str2double(actSol);
verifyClass(testCase, actSolution, 'double');
end
%% Test to verify min data type
function test_verfy_minType(testCase)
val='55';
actSol =edit_feed_minTest(val);
actSolution=str2double(actSol);
verifyClass(testCase, actSolution, 'double');
end

%% Test to verify sec data type
function test_verfy_secType(testCase)
val='55';
actSol =edit_feed_secTest(val);
actSolution=str2double(actSol);
verifyClass(testCase, actSolution, 'double');
end
