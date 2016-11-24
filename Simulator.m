function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 07-Apr-2016 21:16:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)
audio_clip='flute.wav'
[road,fs]=wavread(audio_clip); % loads “the long and winding road” clip
left=road(:,1);
right=road(:,1);
soundsc(left,fs);
time=(1/44100)*length(left);
t=linspace(0,time,length(left));
plot(t/2,left);
xlabel('time (sec)');
ylabel('relative signal strength')


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)    
[road,fs]=wavread(handles.audio_clip); % loads “the long and winding road” clip
left=road(:,1);
right=road(:,1);
soundsc(left,fs);
time=(1/44100)*length(left);
t=linspace(0,time,length(left));
plot(t/2,left);
xlabel('time (sec)');
ylabel('relative signal strength')

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
 [road,fs]=wavread(handles.audio_clip); % loads “the long and winding road” clip

left=road(:,1);
right=road(:,1);
soundsc(left,fs*2)
time=(1/44100)*length(left);
t=linspace(0,time/2,length(left));
plot(t/2,left);
xlabel('time (sec)');
ylabel('relative signal strength')
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles) 

[road,fs]=wavread(handles.audio_clip); % loads “the long and winding road” clip
left=road(:,1);
left=flipud(left);
right=road(:,1);
soundsc(left,fs);
time=(1/44100)*length(left);
t=linspace(0,time,length(left));
plot(t/2,left);
xlabel('time (sec)');
ylabel('relative signal strength')
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
[road,fs]=wavread(handles.audio_clip); % loads “the long and winding road” clip
left=road(:,1);
right=road(:,1);
time=(1/44100)*length(left);
t=linspace(0,time*2,length(left));
soundsc(left,fs/2)
plot(t/2,left);
xlabel('time (sec)');
ylabel('relative signal strength')
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% Determine the selected data set.
str = get(hObject, 'String');
val = get(hObject,'Value');
% Set current data to the selected data set.
switch str{val};
case 'flute.wav' % User selects flue.wav.
   handles.audio_clip = 'flute.wav';
case 'hootie.wav' % User selects hootie.wav.
   handles.audio_clip = 'hootie.wav';
case 'tenorsax.wav' % User selects tenorsax.wav.
   handles.audio_clip = 'tenorsax.wav';
case 'road.wav' % User selects road.wav.
   handles.audio_clip = 'road.wav';
case 'mutedtrumpet.wav' % User selects mutedtrumpet.wav.
   handles.audio_clip = 'mutedtrumpet.wav';
end
% Save the handles structure.
guidata(hObject,handles)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
