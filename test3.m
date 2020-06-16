function varargout = guiadmin(varargin)
% GUIADMIN MATLAB code for guiadmin.fig
%      GUIADMIN, by itself, creates a new GUIADMIN or raises the existing
%      singleton*.
%
%      H = GUIADMIN returns the handle to a new GUIADMIN or the handle to
%      the existing singleton*.
%
%      GUIADMIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIADMIN.M with the given input arguments.
%
%      GUIADMIN('Property','Value',...) creates a new GUIADMIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guiadmin_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guiadmin_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guiadmin

% Last Modified by GUIDE v2.5 16-Jun-2020 22:36:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guiadmin_OpeningFcn, ...
                   'gui_OutputFcn',  @guiadmin_OutputFcn, ...
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


% --- Executes just before guiadmin is made visible.
function guiadmin_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guiadmin (see VARARGIN)

% Choose default command line output for guiadmin
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guiadmin wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guiadmin_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function filePath_Callback(hObject, eventdata, handles)
% hObject    handle to filePath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of filePath as text
%        str2double(get(hObject,'String')) returns contents of filePath as a double


% --- Executes during object creation, after setting all properties.
function filePath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to filePath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in buttonBrowser.
function buttonBrowser_Callback(hObject, eventdata, handles)
% hObject    handle to buttonBrowser (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file,path] = uigetfile('*.csv');
if isequal(file,0)
   disp('User selected Cancel');
else
   disp(['File Loaded ', fullfile(path,file)]);
   dataraw=table2cell(readtable(file,'Delimiter',';'));
   assignin('base','dataraw',dataraw);
   set(handles.filePath,'string',path);
   set(handles.tabelDataRaw, 'Data', dataraw);
   nilai = cell2mat(dataraw(:,1:6));
   jurusan = dataraw(:,7);
   assignin('base','nilai',nilai);
   assignin('base','jurusan',jurusan);
   panjangdata = length(jurusan);
   assignin('base','panjangdata',panjangdata);
   initial = [];
    set(handles.tabelAkurasi, 'Data', initial);
    set(handles.tabelDataRaw, 'ColumnName', {'MAT','IND','IPA','ING','RATA2','JUMLAH','JURUSAN'});
end

% --- Executes on button press in buttonAkurasi.
function buttonAkurasi_Callback(hObject, eventdata, handles)
% hObject    handle to buttonAkurasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

f = waitbar(0,'Calculating');
pause(.5)
pilihannorm = get(handles.popupNormalisasi, 'Value');
panjangdata = evalin('base','panjangdata');
nilai = evalin('base','nilai');
jurusan = evalin('base','jurusan');
if isequal(pilihannorm,1)
    norm=10;
else if isequal(pilihannorm,2)
    norm=100;
    end
end
kboss=get(handles.popupK, 'Value');
for i = 1:panjangdata
    readline = nilai(i,:);
        for j = 1:6
        readcol=readline(1,j:j);
        minim = min(nilai(1:end,j));
        maxim = max(nilai(1:end,j));
        normalisasi(j)=(((readcol-minim)*(norm-1))/(maxim-minim))+1;
        end
    resultnorm(i,:)=normalisasi(:,:);
end
    assignin('base','resultnorm',resultnorm);
    partisi = panjangdata/3;
    partisi = round(partisi);
    assignin('base','partisi',partisi);

%partisiuji
partisi1 = resultnorm(1:partisi,1:6);
partisi2 = resultnorm(partisi+1:partisi+partisi,1:6);
partisi3 = resultnorm(partisi+partisi+1:end,1:6);
partisijurusan1 = jurusan(1:partisi,1);
partisijurusan2 = jurusan(partisi+1:partisi+partisi,1);
partisijurusan3 = jurusan(partisi*2+1:end,1);

%partisilatih
latihpartisi1 = [partisi2; partisi3];
latihpartisi2 = [partisi1; partisi3];
latihpartisi3 = [partisi1; partisi2];
latihpartisijurusan1 = [partisijurusan2; partisijurusan3];
latihpartisijurusan2 = [partisijurusan1; partisijurusan3];
latihpartisijurusan3 = [partisijurusan1; partisijurusan2];

panjangpartisi1 = length(partisi1);
panjangpartisi2 = length(partisi2);
panjangpartisi3 = length(partisi3);

%kfold ke 1
for i = 1:panjangpartisi1
    readbyline = partisi1(i:i,:);
       kelashasil=funknn(readbyline,latihpartisi1,latihpartisijurusan1,kboss);
       hasilbos1(i)=[kelashasil];
end
hasilbostrans=hasilbos1';
hasilmatrik1=confusionmat(partisijurusan1,hasilbostrans);
akurasi1=(sum(diag(hasilmatrik1))/sum(sum(hasilmatrik1)))*100;

%kfold ke 2
for i = 1:panjangpartisi2
    readbyline = partisi2(i:i,:);
       kelashasil=funknn(readbyline,latihpartisi2,latihpartisijurusan2,kboss);
       hasilbos2(i)=[kelashasil];
end
hasilbostrans=hasilbos2';
hasilmatrik2=confusionmat(partisijurusan2,hasilbostrans);
akurasi2=(sum(diag(hasilmatrik2))/sum(sum(hasilmatrik2)))*100;

%kfold ke 3
for i = 1:panjangpartisi3
    readbyline3 = partisi3(i:i,:);
       kelashasil=funknn(readbyline3,latihpartisi3,latihpartisijurusan3,kboss);
       hasilbos3(i)=[kelashasil];
end
hasilbostrans=hasilbos3';
hasilmatrik3=confusionmat(partisijurusan3,hasilbostrans);
akurasi3=(sum(diag(hasilmatrik3))/sum(sum(hasilmatrik3)))*100;

%rata rata akurasi
rataakurasi = (akurasi1+akurasi2+akurasi3)/3;

%into tabel
akurasi=[akurasi1, akurasi2, akurasi3, rataakurasi, kboss, norm];
oldData = get(handles.tabelAkurasi, 'Data');
newData = [oldData; akurasi;];
set(handles.tabelAkurasi, 'Data', newData);
set(handles.tabelAkurasi, 'ColumnName', {'AKURASI1','AKURASI2','AKURASI3','RATA-RATA AKURASI','K','MINMAX'});
assignin('base','tabelakurasi',newData);
    % Close dialog box
    close(f);

% --- Executes on selection change in popupNormalisasi.
function popupNormalisasi_Callback(hObject, eventdata, handles)
% hObject    handle to popupNormalisasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupNormalisasi contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupNormalisasi


% --- Executes during object creation, after setting all properties.
function popupNormalisasi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupNormalisasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupK.
function popupK_Callback(hObject, eventdata, handles)
% hObject    handle to popupK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupK contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupK


% --- Executes during object creation, after setting all properties.
function popupK_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in buttonSave.
function buttonGenerate_Callback(hObject, eventdata, handles)
% hObject    handle to buttonSave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tabelakurasi = num2cell(evalin('base','tabelakurasi'));
%K terbaik
getK = tabelakurasi(end:end,5:5);
 
%Normalisasi terbaik
getNorm = tabelakurasi(end:end,6:6);

resultnorm = num2cell(evalin('base','resultnorm'));
jurusan = evalin('base','jurusan');
result = [jurusan, resultnorm];
set(handles.tabelResult, 'Data', result);
set(handles.tabelResult, 'ColumnName', {'KELAS','CIRI1','CIRI2','CIRI3','CIRI4','CIRI5','CIRI6'});
set(handles.hasilNormalisasi, 'string', getNorm);
set(handles.hasilK, 'string', getK);
assignin('base','K',getK);
assignin('base','Norm',getNorm);



% --- Executes on button press in buttonSort.
function buttonSort_Callback(hObject, eventdata, handles)
% hObject    handle to buttonSort (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%ambil data tabel akurasi
tabelakurasi = evalin('base','tabelakurasi');

%urutkan
sorted = sortrows(tabelakurasi,4);
set(handles.tabelAkurasi, 'Data', sorted);

%akurasi tertinggi
bestsort = [{'Akurasi Tertinggi : '},sorted(end:end,4:4)];
set(handles.loading, 'string', bestsort);
assignin('base','tabelakurasi',sorted);


% --- Executes on button press in buttonSave.
function buttonSave_Callback(hObject, eventdata, handles)
% hObject    handle to buttonSave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
getDataraw = evalin('base','nilai');
getK = evalin('base','K');
getNorm = evalin('base','Norm');
getNilai = evalin('base','resultnorm');
getJurusan = evalin('base','jurusan');
evalin( 'base', 'clearvars *' );
assignin('base','dataraw',getDataraw);
assignin('base','k',getK);
assignin('base','norm',getNorm);
assignin('base','nilai',getNilai);
assignin('base','jurusan',getJurusan);
guiuser;
close(guiadmin);