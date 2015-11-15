classdef new_guiTest< matlab.unittest.TestCase
      methods(Test)
          function testedit1_HourButton(testCase)
              
      
                 H=new_gui;
                 %returns the handle to a new NEW_GUI 
                % ''=edit1_Callback';
                 
                 %Call callback
                 new_gui('edit1_Callback',H,0,0);
                 %get handle of current callback
                 
                 
                [ obj,fig] =gco;
                  
%                  get(obj.output,'type');
%                  val=str2double(get(H));
%                  actSolution =val;
%                  expSolution = 0;
%                  verifyEqual(testCase,actSolution,expSolution);
%                  
                close gcf;
          end
          
%           
%           function testedit2_MinuteButton(testCase)
%               %       
%                  H=new_gui;
%                  %returns the handle to a new NEW_GUI 
%                 %Call callback
%                  new_gui('edit2_Callback',H,[],[]);
%                  %get handle of current callback
%                  [obj,fig] =gco;
%                  get(obj.output,'type');
% %                val=str2double(get(H));
% %                actSolution =val;
% %                expSolution = 0;
% %                verifyEqual(testCase,actSolution,expSolution);
%                                
%           end

%           function testedit_SecondButton(testCase)
%                       
%                      H=new_gui;
    %                  %returns the handle to a new NEW_GUI 
    %                 %new_gui('edit3_Callback',H,[],[]);
    %                  %get handle of current callback
    %                 [obj,fig] =gco;
    %                  get(obj.output,'type');
    % %                val=str2double(get(H));
    % %                actSolution =val;
    % %                expSolution = 0;
    % %                verifyEqual(testCase,actSolution,expSolution);
    %                                 
%           end
%         
      end
end
  
%NEW_GUI('CALLBACK',hObject,eventData,handles,...)
%someAutoGenenratedGUIfile(handles.pushbutton1, [], handles);