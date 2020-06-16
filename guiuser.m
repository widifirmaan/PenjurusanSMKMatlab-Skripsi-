function varargout = guiuser(varargin)
% GUIUSER MATLAB code for guiuser.fig
%      GUIUSER, by itself, creates a new GUIUSER or raises the existing
%      singleton*.
%
%      H = GUIUSER returns the handle to a new GUIUSER or the handle to
%      the existing singleton*.
%
%      GUIUSER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIUSER.M with the given input arguments.
%
%      GUIUSER('Property','Value',...) creates a new GUIUSER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guiuser_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guiuser_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guiuser

% Last Modified by GUIDE v2.5 16-Jun-2020 22:45:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guiuser_OpeningFcn, ...
                   'gui_OutputFcn',  @guiuser_OutputFcn, ...
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


% --- Executes just before guiuser is made visible.
function guiuser_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guiuser (see VARARGIN)

% Choose default command line output for guiuser
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guiuser wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guiuser_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function mat_Callback(hObject, eventdata, handles)
% hObject    handle to mat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mat as text
%        str2double(get(hObject,'String')) returns contents of mat as a double


% --- Executes during object creation, after setting all properties.
function mat_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ind_Callback(hObject, eventdata, handles)
% hObject    handle to ind (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ind as text
%        str2double(get(hObject,'String')) returns contents of ind as a double


% --- Executes during object creation, after setting all properties.
function ind_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ind (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ing_Callback(hObject, eventdata, handles)
% hObject    handle to ing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ing as text
%        str2double(get(hObject,'String')) returns contents of ing as a double


% --- Executes during object creation, after setting all properties.
function ing_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ipa_Callback(hObject, eventdata, handles)
% hObject    handle to ipa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ipa as text
%        str2double(get(hObject,'String')) returns contents of ipa as a double


% --- Executes during object creation, after setting all properties.
function ipa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ipa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jumlahrek_Callback(hObject, eventdata, handles)
% hObject    handle to jumlahrek (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jumlahrek as text
%        str2double(get(hObject,'String')) returns contents of jumlahrek as a double


% --- Executes during object creation, after setting all properties.
function jumlahrek_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jumlahrek (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%getSetting
k = cell2mat(evalin('base','k'));
norm = cell2mat(evalin('base','norm'));
nilai = evalin('base','nilai');
jurusan = evalin('base','jurusan');
dataraw = evalin('base','dataraw');

mat = str2double(get(handles.mat, 'string'));
ind = str2double(get(handles.ind, 'string'));
ipa = str2double(get(handles.ipa, 'string'));
ing = str2double(get(handles.ing, 'string'));
avg = (mat+ind+ipa+ing)/4;
sum = mat+ind+ipa+ing;
inputuser = [mat,ind,ipa,ing,avg,sum];
assignin('base','inputuser',inputuser);
        for j = 1:6
        readcol=inputuser(1,j:j);
        minim = min(dataraw(1:end,j));
        maxim = max(dataraw(1:end,j));
        normalisasi(j)=(((readcol-minim)*(norm-1))/(maxim-minim))+1;
        end
knndata=funknn(normalisasi,nilai,jurusan,k);
set(handles.text11, 'string', knndata);
