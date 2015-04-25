function varargout = test_GUI(varargin)
% TEST_GUI MATLAB code for test_GUI.fig
%      TEST_GUI, by itself, creates a new TEST_GUI or raises the existing
%      singleton*.
%
%      H = TEST_GUI returns the handle to a new TEST_GUI or the handle to
%      the existing singleton*.
%
%      TEST_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEST_GUI.M with the given input arguments.
%
%      TEST_GUI('Property','Value',...) creates a new TEST_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before test_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to test_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help test_GUI

% Last Modified by GUIDE v2.5 25-Apr-2015 23:22:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @test_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @test_GUI_OutputFcn, ...
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


% --- Executes just before test_GUI is made visible.
function test_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to test_GUI (see VARARGIN)

% Choose default command line output for test_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes test_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = test_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function searchbox_Callback(hObject, eventdata, handles)
% hObject    handle to searchbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%stringToSearchFor = get(hObject,'String'); %returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of searchbox as a double


% --- Executes during object creation, after setting all properties.
function searchbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to searchbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in buttonID.
function buttonID_Callback(hObject, eventdata, handles)
% hObject    handle to buttonID (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%get(hObject,'Value') returns toggle state of buttonID


% --- Executes on button press in buttonSen.
function buttonSen_Callback(hObject, eventdata, handles)
% hObject    handle to buttonSen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%get(hObject,'Value') returns toggle state of buttonSen


% --- Executes on button press in buttonWord.
function buttonWord_Callback(hObject, eventdata, handles)
% hObject    handle to buttonWord (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%get(hObject,'Value') returns toggle state of buttonWord


% --- Executes on button press in buttonPhon.
function buttonPhon_Callback(hObject, eventdata, handles)
% hObject    handle to buttonPhon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%get(hObject,'Value') returns toggle state of buttonPhon


% --- Executes on button press in los.
function los_Callback(hObject, eventdata, handles)
% hObject    handle to los (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Reads content of Edit Text and checks which radiobutton is selected
%calls callFileSearch with these values
selectedButton = get(get(handles.parameterSelected,'SelectedObject'),'String');
switch selectedButton
    case 'Sprecher-ID'
        parameterType = 'id';
    case 'Satz'
        parameterType = 'sen';
    case 'Wort'
        parameterType = 'word';
    case 'Phonem'
        parameterType = 'phon';
end
stringToSearchFor = get(handles.searchbox,'String');
if isempty(stringToSearchFor) == 1
    stringToSearchFor = 0;
end
fileNames = callFileSearch(parameterType,stringToSearchFor);
set(handles.listboxResults,'string',fileNames);




% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in listboxResults.
function listboxResults_Callback(hObject, eventdata, handles)
% hObject    handle to listboxResults (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listboxResults contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listboxResults


% --- Executes during object creation, after setting all properties.
function listboxResults_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listboxResults (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in play.
function play_Callback(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%plays in listbox selected audiofile
indexSelected = get(handles.listboxResults,'Value');
fileNames = get(handles.listboxResults,'String');
fileNameDir = ['../../TIMIT MIT/' fileNames{indexSelected}];
playFile(fileNameDir);

% --- Executes on button press in directory.
function directory_Callback(hObject, eventdata, handles)
% hObject    handle to directory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%opens directory in which in listbox selected file is located
%FIX ME: opens always current directory
indexSelected = get(handles.listboxResults,'Value');
fileNames = get(handles.listboxResults,'String');
fileNameDir = ['../../TIMIT MIT/' fileNames{indexSelected}];
openFolder(fileNameDir);
