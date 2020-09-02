%Testing Naive Bayes classifier using joint dist. of feature 9 and 11

clc
clear all

%load data
[D_char,D,D_train,D_valid,maps,numVals] = load_data();

%overrid the D_train and D_valid to work with the data which was used in
%the report. If you want to generate a new training and validation sets,
%you can comment the following two lines.
load('validation_.mat');
load('training_.mat');

alpha=1.01;


%split the data

%classes
D_train_classes=D_train(:,1);
D_valid_classes=D_valid(:,1);

%dependent features
dep_vector=[9,11];

%estimate new prior and likelihood using new alpha
model = estimate_dep(D_train,numVals,alpha,dep_vector);


%buffer to save the predicted classes
predictedClasses=zeros(size(D_train_classes,1),1);
%loop through the training data
for j=1:size(D_train,1)
    %get the feature vector
    pairs=[D_train(j,dep_vector(1)+1),D_train(j,dep_vector(2)+1)];
    features=[D_train(j,2:dep_vector(1)),D_train(j,dep_vector(1)+2:dep_vector(2)),...
        D_train(j,(dep_vector(2)+2):end)];
    %classify using features, prior, and likelihood
    predictedClasses(j) = classify_dep( features, model, pairs);
end

%get the final report
trainingAccuracy=sum((predictedClasses==D_train_classes))/size(D_train_classes,1);

%do the same for the validation set

predictedClasses=zeros(size(D_valid_classes,1),1);
for j=1:size(D_valid,1)
    pairs=[D_valid(j,dep_vector(1)+1),D_valid(j,dep_vector(2)+1)];
    features=[D_valid(j,2:dep_vector(1)),D_valid(j,dep_vector(1)+2:...
        dep_vector(2)),D_valid(j,dep_vector(2)+2:end)];
    predictedClasses(j) = classify_dep( features, model,pairs );
end
validationAccuracy=sum((predictedClasses==D_valid_classes))/size(D_valid_classes,1);


%print training and validation accuracy
%[trainingAccuracy,validationAccuracy]


table(trainingAccuracy,validationAccuracy)

