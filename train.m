clc;
close all;
clear all;

%% Training Side
% random three class data with target matrix -- [9X3] 9 observation with 3 features
data = [10 0 0;
        10 0 1;
        10 1 0;
        2 10 0;
        2 10 1;
        2 11 0;
        5 0 10;
        5 0 11;
        5 1 10];
target = [1;1;1;2;2;2;3;3;3];
% create a k Nearest Neighbour model
kNNModel = fitcknn(data,target,'NumNeighbors',4); % kNNModel is the trained model. save it at end for doing testing
save('kNNModel.mat','kNNModel');

% train performance
label = predict(kNNModel,data);

perf=sum(label==target)/size(label,1) % performance in the range of 0 to 1

%% Testing Side
% for testing load the trained model
load('kNNModel.mat');
testdata = [10 0 3]; % take 1 new unknown observation and give to trained model
Group = predict(kNNModel,testdata);