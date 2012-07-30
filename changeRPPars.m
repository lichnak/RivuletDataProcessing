function varargout = changeRPPars(varargin)
% CHANGERPPARS M-file for changeRPPars.fig
%      CHANGERPPARS, by itself, creates a new CHANGERPPARS or raises the existing
%      singleton*.
%
%      H = CHANGERPPARS returns the handle to a new CHANGERPPARS or the handle to
%      the existing singleton*.
%
%      CHANGERPPARS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHANGERPPARS.M with the given input arguments.
%
%      CHANGERPPARS('Property','Value',...) creates a new CHANGERPPARS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before changeRPPars_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to changeRPPars_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help changeRPPars

% Last Modified by GUIDE v2.5 30-Jul-2012 15:57:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @changeRPPars_OpeningFcn, ...
                   'gui_OutputFcn',  @changeRPPars_OutputFcn, ...
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


% --- Executes just before changeRPPars is made visible.
function changeRPPars_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to changeRPPars (see VARARGIN)

% Choose default command line output for changeRPPars
handles.output = hObject;

% Initialize gui
handles.metricdata = initializeGUI(hObject,eventdata,handles);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes changeIMPars wait for user response (see UIRESUME)
uiwait(handles.figure1);



% --- Outputs from this function are returned to the command line.
function varargout = changeRPPars_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% The figure can be deleted now
delete(handles.figure1);

%% Pushbuttons

% --- Executes on button press in PushOK.
function PushOK_Callback(hObject, eventdata, handles)
% hObject    handle to PushOK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%extract handles.metricdata
Width   = handles.metricdata.Width;
Length  = handles.metricdata.Length;
Angle   = handles.metricdata.Angle;

HfThS   = handles.metricdata.HfThS;
LfThS   = handles.metricdata.LfThS;
HfThB   = handles.metricdata.HfThB;
LfThB   = handles.metricdata.LfThB;
PolDeg  = handles.metricdata.PolDeg;
CuvWidth= handles.metricdata.CuvWidth;

nCuts   = handles.metricdata.nCuts;


% assign the output cell
handles.output = {[Width Length] Angle [HfThS LfThS HfThB LfThB CuvWidth]... 
    PolDeg nCuts};

% Update handles structure
guidata(hObject, handles);

% Use UIRESUME instead of delete because the OutputFcn needs
% to get the updated handles structure.
uiresume(handles.figure1);


% --- Executes on button press in PushDef.
function PushDef_Callback(hObject, eventdata, handles)
% hObject    handle to PushDef (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% reinitialize gui
handles.metricdata = initializeGUI(hObject,eventdata,handles);
% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in PushCancelClose.
function PushCancelClose_Callback(hObject, eventdata, handles)
% hObject    handle to PushCancelClose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% assign the output cell
handles.output = [];                                                        %set the output as empty matrix

% Update handles structure
guidata(hObject, handles);

% Use UIRESUME instead of delete because the OutputFcn needs
% to get the updated handles structure.
uiresume(handles.figure1);

%% Edit fields

function EditnCuts_Callback(hObject, eventdata, handles)
% hObject    handle to EditnCuts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditnCuts as text
%        str2double(get(hObject,'String')) returns contents of EditnCuts as a double

handles.metricdata.nCuts = str2double(get(hObject,'String'));

% Update handles structure
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function EditnCuts_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditnCuts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditHfThS_Callback(hObject, eventdata, handles)
% hObject    handle to EditHfThS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditHfThS as text
%        str2double(get(hObject,'String')) returns contents of EditHfThS as a double

handles.metricdata.HfThS = str2double(get(hObject,'String'));

% Update handles structure
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function EditHfThS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditHfThS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditLfThS_Callback(hObject, eventdata, handles)
% hObject    handle to EditLfThS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditLfThS as text
%        str2double(get(hObject,'String')) returns contents of EditLfThS as a double

handles.metricdata.LfThS = str2double(get(hObject,'String'));

% Update handles structure
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function EditLfThS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditLfThS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditHfThB_Callback(hObject, eventdata, handles)
% hObject    handle to EditHfThB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditHfThB as text
%        str2double(get(hObject,'String')) returns contents of EditHfThB as a double

handles.metricdata.HfThB = str2double(get(hObject,'String'));

% Update handles structure
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function EditHfThB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditHfThB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditLfThB_Callback(hObject, eventdata, handles)
% hObject    handle to EditLfThB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditLfThB as text
%        str2double(get(hObject,'String')) returns contents of EditLfThB as a double

handles.metricdata.LfThB = str2double(get(hObject,'String'));

% Update handles structure
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function EditLfThB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditLfThB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditPolDeg_Callback(hObject, eventdata, handles)
% hObject    handle to EditPolDeg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditPolDeg as text
%        str2double(get(hObject,'String')) returns contents of EditPolDeg as a double

handles.metricdata.PolDeg = str2double(get(hObject,'String'));

% Update handles structure
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function EditPolDeg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditPolDeg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditCuvWidth_Callback(hObject, eventdata, handles)
% hObject    handle to EditCuvWidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditCuvWidth as text
%        str2double(get(hObject,'String')) returns contents of EditCuvWidth as a double

handles.metricdata.CuvWidth = str2double(get(hObject,'String'));

% Update handles structure
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function EditCuvWidth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditCuvWidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditWidth_Callback(hObject, eventdata, handles)
% hObject    handle to EditWidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditWidth as text
%        str2double(get(hObject,'String')) returns contents of EditWidth as a double

handles.metricdata.Width = str2double(get(hObject,'String'));

% Update handles structure
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function EditWidth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditWidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditLength_Callback(hObject, eventdata, handles)
% hObject    handle to EditLength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditLength as text
%        str2double(get(hObject,'String')) returns contents of EditLength as a double

handles.metricdata.Length = str2double(get(hObject,'String'));

% Update handles structure
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function EditLength_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditLength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditAngle_Callback(hObject, eventdata, handles)
% hObject    handle to EditAngle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditAngle as text
%        str2double(get(hObject,'String')) returns contents of EditAngle as a double

handles.metricdata.Angle = str2double(get(hObject,'String'));

% Update handles structure
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function EditAngle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditAngle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%% Auxiliary functions
function metricdata = ...
    initializeGUI(hObject,eventdata,handles)
%
% function for gui inicialization, to be executed just before progGui is
% made visible

% set editable fields
handles.metricdata.Width    = 0.15;
handles.metricdata.Length   = 0.30;
handles.metricdata.Angle    = 60;
handles.metricdata.HfThS    = 1.93;
handles.metricdata.HfThB    = 0.33;
handles.metricdata.LfThS    = 6.00;
handles.metricdata.LfThB    = 2.25;
handles.metricdata.PolDeg   = 2;
handles.metricdata.CuvWidth = 80;
handles.metricdata.nCuts    = 5;

% fill in the fields
set(handles.EditWidth,'String',handles.metricdata.Width);
set(handles.EditLength,'String',handles.metricdata.Length);
set(handles.EditAngle,'String',handles.metricdata.Angle);
set(handles.EditHfThS,'String',handles.metricdata.HfThS);
set(handles.EditHfThB,'String',handles.metricdata.HfThB);
set(handles.EditLfThS,'String',handles.metricdata.LfThS);
set(handles.EditLfThB,'String',handles.metricdata.LfThB);
set(handles.EditPolDeg,'String',handles.metricdata.PolDeg);
set(handles.EditCuvWidth,'String',handles.metricdata.CuvWidth);
set(handles.EditnCuts,'String',handles.metricdata.nCuts);

metricdata = handles.metricdata;
% Update handles structure
guidata(handles.figure1, handles);