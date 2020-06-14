clc
clear all
Data2016nilai=cell2mat(table2cell(readtable('Data2016nilai.csv','Delimiter',';')));
Data2017nilai=cell2mat(table2cell(readtable('Data2017nilai.csv','Delimiter',';')));
Data2018nilai=cell2mat(table2cell(readtable('Data2018nilai.csv','Delimiter',';')));

Data2016jurusan=table2cell(readtable('Data2016jurusan.csv'));
Data2017jurusan=table2cell(readtable('Data2017jurusan.csv'));
Data2018jurusan=table2cell(readtable('Data2018jurusan.csv'));

Nilai201620172018 = [Data2016nilai; Data2017nilai; Data2018nilai;];
Jurusan201620172018 = [Data2016jurusan; Data2017jurusan; Data2018jurusan;];
panjangtabel=length(Jurusan201620172018);

%tanpanorm
%partisiuji
partisi1 = Nilai201620172018(1:partisi,1:6);
partisi2 = Nilai201620172018(partisi+1:partisi+partisi,1:6);
partisi3 = Nilai201620172018(partisi+partisi+1:end,1:6);
partisijurusan1 = Jurusan201620172018(1:partisi,1);
partisijurusan2 = Jurusan201620172018(partisi+1:partisi+partisi,1);
partisijurusan3 = Jurusan201620172018(partisi*2+1:end,1);

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
       kelashasil=knnclassify(readbyline,latihpartisi1,latihpartisijurusan1,3);
       hasilbos1(i)=[kelashasil];
end
hasilbostrans=hasilbos1';
hasilmatrik1=confusionmat(partisijurusan1,hasilbostrans);
akurasi1=(sum(diag(hasilmatrik1))/sum(sum(hasilmatrik1)))*100;

%kfold ke 2
for i = 1:panjangpartisi2
    readbyline = partisi2(i:i,:);
       kelashasil=knnclassify(readbyline,latihpartisi2,latihpartisijurusan2,3);
       hasilbos2(i)=[kelashasil];
end
hasilbostrans=hasilbos2';
hasilmatrik2=confusionmat(partisijurusan2,hasilbostrans);
akurasi2=(sum(diag(hasilmatrik2))/sum(sum(hasilmatrik2)))*100;

%kfold ke 3
for i = 1:panjangpartisi3
    readbyline3 = partisi3(i:i,:);
       kelashasil=knnclassify(readbyline3,latihpartisi3,latihpartisijurusan3,3);
       hasilbos3(i)=[kelashasil];
end
hasilbostrans=hasilbos3';
hasilmatrik3=confusionmat(partisijurusan3,hasilbostrans);
akurasi3=(sum(diag(hasilmatrik3))/sum(sum(hasilmatrik3)))*100;





%ereerwvrbrgsgsrz%

% trainpartisi1 = [Data2016nilai; Data2017nilai; Data2018nilai;];
% trainpartisi2 = [Data2016nilai; Data2017nilai; Data2019nilai;];
% trainpartisi3 = [Data2016nilai; Data2018nilai; Data2019nilai;];
% trainpartisi4 = [Data2017nilai; Data2018nilai; Data2019nilai;];
% jurusantrainpartisi1 = [Data2016jurusan; Data2017jurusan; Data2018jurusan;];
% jurusantrainpartisi2 = [Data2016jurusan; Data2017jurusan; Data2019jurusan;];
% jurusantrainpartisi3 = [Data2016jurusan; Data2018jurusan; Data2019jurusan;];
% jurusantrainpartisi4 = [Data2017jurusan; Data2018jurusan; Data2019jurusan;];
% %gabungan3angkatan
% 
% panjangtabel2019=length(Data2019jurusan);
% for i = 1:panjangtabel2019
%     readbyline2019 = Data2019nilai(i:i,:);
%        kelashasil=knnclassify(readbyline2019,trainpartisi1,jurusantrainpartisi1,3);
%        hasilbos2019(i)=[kelashasil];
% end
% hasilbos2019=hasilbos2019';
% hasilmatrik2019=confusionmat(Data2019jurusan,hasilbos2019);
% akurasi1=(sum(diag(hasilmatrik2019))/sum(sum(hasilmatrik2019)))*100;
% 
% panjangtabel2018=length(Data2018jurusan);
% for i = 1:panjangtabel2018
%     readbyline2018 = Data2018nilai(i:i,:);
%        kelashasil=knnclassify(readbyline2018,trainpartisi2,jurusantrainpartisi2,3);
%        hasilbos2018(i)=[kelashasil];
% end
% hasilbos2018=hasilbos2018';
% hasilmatrik2018=confusionmat(Data2018jurusan,hasilbos2018);
% akurasi1=(sum(diag(hasilmatrik2018))/sum(sum(hasilmatrik2018)))*100;