clc
clear all
Data2016nilai=cell2mat(table2cell(readtable('Data2016nilai.csv','Delimiter',';')));
Data2017nilai=cell2mat(table2cell(readtable('Data2017nilai.csv','Delimiter',';')));
Data2018nilai=cell2mat(table2cell(readtable('Data2018nilai.csv','Delimiter',';')));
Data2019nilai=cell2mat(table2cell(readtable('Data2019nilai.csv','Delimiter',';')));%baca tabel

Data2016jurusan=table2cell(readtable('Data2016jurusan.csv'));
Data2017jurusan=table2cell(readtable('Data2017jurusan.csv'));
Data2018jurusan=table2cell(readtable('Data2018jurusan.csv'));
Data2019jurusan=table2cell(readtable('Data2019jurusan.csv'));%bacajurusan

% Latih2016=[Data2016nilai,Data2016jurusan];
% Latih2017=[Data2017nilai,Data2017jurusan];
% Latih2018=[Data2018nilai,Data2018jurusan];
% Latih2019=[Data2019nilai,Data2019jurusan];
% M2016= fitcknn(Latih2016,'JURUSAN');
% M2017= fitcknn(Latih2017,'JURUSAN');

panjangtabel2017=length(Data2017jurusan);
for i = 1:panjangtabel2017
    readbyline2017 = Data2017nilai(i:i,:);
       disp(readbyline2017);
       kelashasil=knnclassify(readbyline2017,Data2016nilai,Data2016jurusan,1);
       disp(kelashasil);
end
