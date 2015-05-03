function varargout = searchGui(varargin)
% function to create a gui for the search of a database
% Usage varargout = searchGui(varargin)
%    or searchGui
% Input Parameter:
%   varargin:       no argument needed in this case
% Output Parameter:
%   varargin:       figure handle of the gui
%------------------------------------------------------------------------
% Example: searchGui;

% Author: Finn Bayer, Kristin Hasselbusch, Sandro Wehrhahn (c) TGM @ Jade Hochschule applied licence see EOF

% Source: http://blogs.mathworks.com/pick/2007/08/03/dynamic-guis-with-guide/
%         http://matlabgeeks.com/tips-tutorials/building-guis-in-matlab-part-iii-utilizing-user-input/
%         http://www.mathworks.com/matlabcentral/newsreader/view_thread/288173

%------------Function implementation---------------------------

%code was automaitcally generated by GUIDE, content of callback functions
%was added manually

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Not edited %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @searchGui_OpeningFcn, ...
    'gui_OutputFcn',  @searchGui_OutputFcn, ...
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


%OpeningFcn and OutputFcn are called at the initialization

% --- Executes just before searchGui is made visible.
function searchGui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to searchGui (see VARARGIN)

% Choose default command line output for searchGui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = searchGui_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%% Edited Code %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%callback functions to specifiy the behavior of the gui

%%%%%%%%%%%%%%%%%%%%%% Simple Search Callback %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in los.
% by pushing the button 'Los!' the search of the database with one
% parameter (entered by user) is started --> simple search
function los_Callback(hObject, eventdata, handles)
% hObject    handle to los (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%display 'Suche..' in listbox while execution of fileSearch
set(handles.listboxResults,'string','Suche...');

%check which radiobutton is selected
selectedButton = get(get(handles.parameterSelected,'SelectedObject'),'String');
%to catch the error if no searchparameter is set (unix systems)
if isempty(selectedButton)
    selectedButton = 0;
end

%Read content of searchbox (Edit Text)
stringToSearchFor = get(handles.searchbox,'String');
%if nothing was entered, set 0
if isempty(stringToSearchFor) == 1
    stringToSearchFor = 0;
end

%call fileSearch with the entered string depending on which button was
%selected, matches are saved in fileNames as a cell array
switch selectedButton
    case 'Speaker-ID'
        fileNames = fileSearch(stringToSearchFor,0,0,0);
    case 'Sentence'
        fileNames = fileSearch(0,stringToSearchFor,0,0);
    case 'Word'
        fileNames = fileSearch(0,0,stringToSearchFor,0);
    case 'Phoneme'
        fileNames = fileSearch(0,0,0,stringToSearchFor);
    case 0
        fileNames=[];
end

%if there were matches, the elements of the cell array (which are filenames)
%are displayed in the listbox, if not it shows 'Keine Ergebnisse'
if isempty(fileNames) ==0
    set(handles.listboxResults,'string',fileNames,'value',1);
else
    set(handles.listboxResults,'string',['Keine Ergebnisse fuer ' stringToSearchFor],'value',1);
end
%displays the first sentence right after searching
displaySentence(handles)

%%%%%%%%%%%%%%%%%%% End Simple Search Callback %%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%% Display Full Sentence of Selected Item %%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on selection change in listboxResults.
% by clicking on one of the elements in the listbox, the sentence, which is
% contained by the selected filename, is shown in a box underneath
function listboxResults_Callback(hObject, eventdata, handles)
% hObject    handle to listboxResults (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

displaySentence(handles);


%%%%%%%%%%% End Display Full Sentence of Selected Item %%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%% Play Callback %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in play.
% by pushing the button 'Abspielen' the audio file specified by the selected
% element of the listbox is played by function playFile()
function play_Callback(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%get the current elements of listbox and the index of the selected one
fileNames = get(handles.listboxResults,'String');
indexSelected = get(handles.listboxResults,'Value');

%if the listbox is containing an cell array (meaning that there are results)
%the audiofile with the name of the selected element is played
if iscell(fileNames)==1
    fileNameDir = ['TIMIT MIT/' fileNames{indexSelected}];
    Noise = detectNoise(fileNameDir);
    if Noise == 0
        playFile(fileNameDir);
    else
        tmp = warningGui;
        if tmp==1
            playFile(fileNameDir);
        end
    end
end

%%%%%%%%%%%%%%%%%% End Play Callback %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%% Open Folder Callback %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in directory.
% by pushing the button 'In Ordner anzeigen', the directory of the selected
% file is opened
function directory_Callback(hObject, eventdata, handles)
% hObject    handle to directory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%get the current elements of listbox and the index of the selected one
fileNames = get(handles.listboxResults,'String');
indexSelected = get(handles.listboxResults,'Value');

%if the listbox is containing an cell array (meaning that there are results)
%the directory containg the selected file is opened by the file manager
if iscell(fileNames)==1
    fileNameDir = ['TIMIT MIT/' fileNames{indexSelected}];
    openFolder(fileNameDir);
end

%%%%%%%%%%%%%%%%% End Open Folder Callback %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%% Open Advanced Search GUI Element %%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in moreParButton.
% if the button 'Nach mehreren Parametern suchen' is toggled, the gui is
% extended to show the advanced search with more possible input parameters
function moreParButton_Callback(hObject, eventdata, handles)
% hObject    handle to moreParButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%toggle state of the button
wantAdvanced = get(hObject,'Value');

%if it is toggled, the gui is enlarged and the compontents of the simple
%search panels are disabled
if wantAdvanced == 1
    currentPos = get(handles.figure1,'position');
    set(handles.figure1,'position',[currentPos(1) currentPos(2) 124.2 32.4]);
    set(handles.searchbox,'enable','off');
    set(handles.los,'enable','off');
    set(handles.buttonID,'enable','off');
    set(handles.buttonSen,'enable','off');
    set(handles.buttonWord,'enable','off');
    set(handles.buttonPhon,'enable','off');
    %if it is not toggled, the gui gets its original size and the compontents
    %of the simple search panels are enabled
else
    currentPos = get(handles.figure1,'position');
    set(handles.figure1,'position',[currentPos(1) currentPos(2) 80.2 32.4]);
    set(handles.searchbox,'enable','on');
    set(handles.los,'enable','on');
    set(handles.buttonID,'enable','on');
    set(handles.buttonSen,'enable','on');
    set(handles.buttonWord,'enable','on');
    set(handles.buttonPhon,'enable','on');
    
end

%%%%%%%%%%%%% End Open Advanced Search GUI Element %%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%% Advanced Search Callback %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in losAdvanced.
% by pushing the button 'Los!' the search of the database with one ore more
% parameters (entered by user) is started --> advanced search
function losAdvanced_Callback(hObject, eventdata, handles)
% hObject    handle to losAdvanced (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%display 'Suche..' in listbox while execution of fileSearch
set(handles.listboxResults,'string','Suche...');


%read content of the four edit boxes or set 0 if empty
id = get(handles.editID,'String');
sen = get(handles.editSen,'String');
word = get(handles.editWord,'String');
phon = get(handles.editPhon,'String');
if isempty(id) == 1
    id = 0;
end
if isempty(sen) == 1
    sen = 0;
end
if isempty(word) == 1
    word = 0;
end
if isempty(phon) == 1
    phon = 0;
end

%call fileSearch with the entered strings, matches are saved in fileNames
%as a cell array
fileNames = fileSearch(id,sen,word,phon);

%if there were matches, the elements of the cell array (which are filenames)
%are displayed in the listbox, if not it shows 'Keine Ergebnisse'
if isempty(fileNames) ==0
    set(handles.listboxResults,'string',fileNames,'value',1);
else
    set(handles.listboxResults,'string','Keine Ergebnisse','value',1);
end

%displays the first sentence right after searching
displaySentence(handles)

%%%%%%%%%%%%%%%% End Advanced Search Callback %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%% Display Full Sentences  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%function which is called by the callbacks of the listbox and the search
%buttons
function displaySentence(handles)

%get the current elements of listbox and the index of the selected one
fileNames = get(handles.listboxResults,'String');
indexSelected = get(handles.listboxResults,'Value');

%if the listbox is containing an cell array (meaning that there are results)
%it opens the text file with the sentences and displayes it and the id number
%in as a static text
if iscell(fileNames)==1
    file = fileNames{indexSelected};
    %open text file
    path = ['TIMIT MIT/' file '.txt'];
    fid = fopen(path);
    %read file seperated by a space in cell array of strings
    zeile = textscan(fid,'%s','delimiter',' ');
    fclose(fid);
    %delete numbers, that are always the first to elements of cell array
    %and make a large stirng from the rest
    satz = [];
    for k=3:length(zeile{1})
        satz = [satz ' ' zeile{1}{k}];
    end
    %get id number of speaker
    dir = strsplit(file,'/');
    id = dir{1}(end-3:end);
    
    %display id number and sentence in static text
    set(handles.senReturn,'String',[id ': ' satz]);
else
    %if there a no results, display nothing
    set(handles.senReturn,'String','');
end

%%%%%%%%%%%%%%%%%%%%%%End Display Full Sentences %%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%% Keyboard Input %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function searchbox_Callback(hObject, eventdata, handles)
% hObject    handle to searchbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of searchbox as text
%        str2double(get(hObject,'String')) returns contents of searchbox as a double
if strcmp(get(handles.figure1,'CurrentCharacter'),char(13))==1
    losAdvanced_Callback(hObject,eventdata,handles)
end

function editID_Callback(hObject, eventdata, handles)
% hObject    handle to editID (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editID as text
%        str2double(get(hObject,'String')) returns contents of editID as a double
if strcmp(get(handles.figure1,'CurrentCharacter'),char(13))==1
    losAdvanced_Callback(hObject,eventdata,handles)
end


function editSen_Callback(hObject, eventdata, handles)
% hObject    handle to editSen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editSen as text
%        str2double(get(hObject,'String')) returns contents of editSen as a double

if strcmp(get(handles.figure1,'CurrentCharacter'),char(13))==1
    losAdvanced_Callback(hObject,eventdata,handles)
end


function editWord_Callback(hObject, eventdata, handles)
% hObject    handle to editWord (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editWord as text
%        str2double(get(hObject,'String')) returns contents of editWord as a double
if strcmp(get(handles.figure1,'CurrentCharacter'),char(13))==1
    losAdvanced_Callback(hObject,eventdata,handles)
end


function editPhon_Callback(hObject, eventdata, handles)
% hObject    handle to editPhon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editPhon as text
%        str2double(get(hObject,'String')) returns contents of editPhon as a double
if strcmp(get(handles.figure1,'CurrentCharacter'),char(13))==1
    losAdvanced_Callback(hObject,eventdata,handles)
end

%%%%%%%%%%%%%%%%%%%%%%% End Keyboard Input %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


