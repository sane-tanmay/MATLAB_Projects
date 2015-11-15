% This is the code to dipaly an analog clock
% with time input and start and stop intercase

function varargout = new_gui(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @new_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @new_gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before new_gui is made visible.
function new_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to new_gui (see VARARGIN)

% Create the data to plot.

handles.bg_cl=[1 1 1]; % back-ground color
pause on;
handles.hfig=gcf; % obj handle

set(handles.hfig,'NumberTitle','off');
set(handles.hfig,'name','Analog Clock');
set(handles.hfig,'color',handles.bg_cl);
set(handles.hfig,'visible','on');
guidata(hObject,handles);
axis off;

% Set the current data value.

%Draw clock
handles.clck_rad=4.9; % Clock radius
guidata(hObject,handles);
handles.sec_hd_len= (0.85)*(handles.clck_rad);%second_hand length
handles.cl_brdr=linspace(0,2*pi,1200); % number of points on the clock border
handles.x_plr=handles.clck_rad*cos(handles.cl_brdr); %x polar co-ord
handles.y_plr=handles.clck_rad*sin(handles.cl_brdr); %y ploar co-ord
hold on
 
plot(handles.x_plr,handles.y_plr,'k','linewidth',4); % outer rim
%plot numbers 
handles.clc_xcr=0;
handles.clc_ycr=0;

handles.clck_num_r= handles.clck_rad-0.5; %virtual radius of numbers
 %from 60deg i.e pos 1 to pos 12 in steps of  -ve 30 deg 
 for i=0:11
 clck_num_ang{i+1}= (pi/3)-((pi*i)/6);
 end 
handles.clck_num_ang=clck_num_ang;
handles.clck_num_ang= cell2mat(handles.clck_num_ang);
handles.clck_num_ang=handles.clck_num_ang';
handles.clck_hr_num = linspace(1,12,12)'; %Numbers to be plotted
handles.clck_num_ar = [handles.clck_num_r*cos(handles.clck_num_ang) handles.clck_num_r*sin(handles.clck_num_ang) handles.clck_hr_num]; %row matrix of x y cd of mumbers
%Display text at these numbers
handles.han_num_dis = text(handles.clck_num_ar(:,1)+handles.clc_xcr,handles.clck_num_ar(:,2) + handles.clc_ycr,num2str(handles.clck_num_ar(:,3)),'horizontalAlignment','center','verticalAlignment','middle');
%text(x, y, 'text', 'horizontalAlignment', 'halign', 'verticalAlignment', 'valign')

f_han=handles.hfig;
y=display_time(0,0,0); % Display function called 

guidata(hObject,handles);

% Choose default command line output for new_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes new_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = new_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% The callback function for the hr input field

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.hr_val= str2double(get(hObject,'String'));
global debug1;
if (debug1==1)
disp('edt 1');
end
% Save the change you made to the structure
 global curr_hr ;
curr_hr=handles.hr_val;

guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% The callback function for the min input field
function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
min_val= str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
 global curr_min ;
curr_min=min_val;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% The callback function for the sec input field
function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sec_val= str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double

 global curr_sec ;

curr_sec=sec_val;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% Call back function for start and stop button

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global is_on tmr;

if(is_on==1)
    stop(tmr);
    
    is_on=0;
else 
    y=start_timer();
    is_on=1;
    
end 
    disp('Push');
    disp(is_on);



handles.hfig=gcf;
