Nilai201620172018 = [Data2016nilai; Data2017nilai; Data2018nilai;];
Jurusan201620172018 = [Data2016jurusan; Data2017jurusan; Data2018jurusan;];
panjangtabel=length(Jurusan201620172018);

partisi = panjangtabel/3;
partisi = round(partisi);

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

% asda = [98 95.5 93 72.5 89.75 359];
% coba = knnclassify(asda,Nilai2016201720182019,Jurusan2016201720182019,3);
% 