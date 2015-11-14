% This function defines a timer object and starts its execution
% The timer object is returned for debugging

function z = start_timer()
global tmr debug1;
if debug1==1
disp('Start Timer');
end
tmr = timer('ExecutionMode', 'FixedRate', 'Period', 1, 'TimerFcn', {@timer_loop});
start(tmr);
z=tmr;
end
