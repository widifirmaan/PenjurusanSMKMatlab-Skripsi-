function [K_NN, testClass] = knn(trainData, trainClass, testData, K_neighbors)

[~, trainM] = size(trainData);
[~, testM]  = size(testData);

distancias          = zeros(testM,trainM);
distanciasOrdenadas = zeros(testM,trainM);
    
K = K_neighbors;

% Distancia (Euclidean)
for i=1:testM
    for j=1:trainM;
     distancias(i,j) = pdist([trainData(:,j)'; testData(:,i)']);
    end
end

% Distancias Ordenadas
for i=1:testM
    [orden, ind] = sort(distancias(i,:));
    indice(i,:) = ind;
    distanciasOrdenadas(i,:) = orden;
end

% K-Nearest Neighbors
indiceKNN = indice(:,1:K);
K_NN = zeros(2,K,testM);

for i=1:testM
    for j=1:K
        K_NN(:,j,i) = trainData(:,indiceKNN(i,j))';
    end
end

trainClass = trainClass';
testClassTemp = trainClass(indiceKNN);

% Clasificacion
Class = unique(testClassTemp);
nClass = length(Class);
%contClass = zeros(nClass,testM);

for i = 1:nClass
    contClass(i,:) = sum((testClassTemp == Class(i)),2); % Filas
end

[~, indiceMax] = max(contClass);
testClass = Class(indiceMax);

end