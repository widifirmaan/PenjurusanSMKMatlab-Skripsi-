clc;
close all;
clear all;

%import data
Data2016nilai=cell2mat(table2cell(readtable('Data2016nilai.csv','Delimiter',';')));
Data2017nilai=cell2mat(table2cell(readtable('Data2017nilai.csv','Delimiter',';')));
Data2018nilai=cell2mat(table2cell(readtable('Data2018nilai.csv','Delimiter',';')));

Data2016jurusan=table2cell(readtable('Data2016jurusan.csv'));
Data2017jurusan=table2cell(readtable('Data2017jurusan.csv'));
Data2018jurusan=table2cell(readtable('Data2018jurusan.csv'));

%combine data
data = [Data2016nilai; Data2017nilai; Data2018nilai;];
jurusan = [Data2016jurusan; Data2017jurusan; Data2018jurusan;];
[s,~,j] = unique(jurusan);
target = j
panjangtabel=length(jurusan);

%normalisasi minmax 1-10
for i = 1:length(data)
    readbyline = data(i,:);
    for j = 1:4
        readcol=readbyline(1,j:j);
        minim = min(data(1:end,j));
        maxim = max(data(1:end,j));
        norm10(j)=(((readcol-minim)*(10-1))/(maxim-minim))+1;
    end
    resultnorm10(i,:)=norm10(:,:);
end
partisi = panjangtabel/3;
partisi = round(partisi);

%partisi uji
partisi1 = resultnorm10(1:partisi,1:4);
partisi2 = resultnorm10(partisi+1:partisi+partisi,1:4);
partisi3 = resultnorm10(partisi+partisi+1:end,1:4);
partisijurusan1 = target(1:partisi,1);
partisijurusan2 = target(partisi+1:partisi+partisi,1);
partisijurusan3 = target(partisi*2+1:end,1);

%partisi latih
latihpartisi1 = [partisi2; partisi3];
latihpartisi2 = [partisi1; partisi3];
latihpartisi3 = [partisi1; partisi2];
latihpartisijurusan1 = [partisijurusan2; partisijurusan3];
latihpartisijurusan2 = [partisijurusan1; partisijurusan3];
latihpartisijurusan3 = [partisijurusan1; partisijurusan2];

%panjang tiap partisi
panjangpartisi1 = length(partisi1);
panjangpartisi2 = length(partisi2);
panjangpartisi3 = length(partisi3);
panjangpartisilatih1 = length(latihpartisi1);
panjangpartisilatih2 = length(latihpartisi2);
panjangpartisilatih3 = length(latihpartisi3);

%% Testing Side
nb = fitcnb(latihpartisi1,latihpartisijurusan1); 
for i = 1:panjangpartisi1
    testdata = partisi1(i:i,:);
    Group = predict(nb,testdata);
       hasilbos1(i)=[Group];
end
hasilbostrans1=hasilbos1';
hasilmatrik1=confusionmat(partisijurusan1,hasilbostrans1);
akurasi1=(sum(diag(hasilmatrik1))/sum(sum(hasilmatrik1)))*100;
plotConfMat(hasilmatrik1);

% testdata = [100 100 100 100 100 400]; % take 1 new unknown observation and give to trained model
% Group = predict(nb,testdata);