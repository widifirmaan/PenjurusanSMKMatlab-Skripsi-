%Testing Naive Bayes classifier

clc
clear all

%load data
[D_char,D,D_train,D_valid,maps,numVals] = load_data();

%overrid the D_train and D_valid to work with the data which was used in
%the report. If you want to generate a new training and validation sets,
%you can comment the following two lines.

 load('validation_.mat');
 load('training_.mat');

start=1;
topAlpha=2;
step=0.1;

% start=1;
% topAlpha=1000;
% step=1;

%to save the reported accuracy over training and validation sets
trainingAccuracy=zeros(floor((topAlpha-start)/step),1);
validationAccuracy=zeros(floor((topAlpha-start)/step),1);

counter=0;
for alpha=start:step:topAlpha
    
    strcat(sprintf('Processing: alpha=%d - %.3f',...
            alpha,counter*100/((topAlpha-start)/step)),'%')
    
    counter=counter+1;    
    %estimate new prior and likelihood using new alpha
       
    model = estimate_(D_train,numVals,alpha);
    %get training classes
    trueClasses=D_train(:,1);
    %buffer to save the predicted classes
    predictedClasses=zeros(size(trueClasses,1),1);
    %loop through the training data
    for j=1:size(D_train,1)
        %get the feature vector
        features=D_train(j,2:end);
        %classify using features, prior, and likelihood
        predictedClasses(j) = classify_( features, model );
    end
    
    %get the final report
    trainingAccuracy(counter)=sum((predictedClasses==trueClasses))/size(trueClasses,1);
    
    
    
    
    %do the same for the validation set
    trueClasses=D_valid(:,1);
    predictedClasses=zeros(size(trueClasses,1),1);
    for j=1:size(D_valid,1)
        features=D_valid(j,2:end);
        predictedClasses(j) = classify_( features, model );
    end
    validationAccuracy(counter)=sum((predictedClasses==trueClasses))/size(trueClasses,1);
end

%print training and validation accuracy
%[trainingAccuracy,validationAccuracy]

table(trainingAccuracy,validationAccuracy)



%%% Plot

x=start:step:topAlpha;
fig=plot(x,trainingAccuracy,'-',x,validationAccuracy,'--');
labels=[];
ylim([0.9 1])
set(gca, 'YTick',[0.9:0.01:1]);
title('Naive Bayes classifier');
xlabel('alpha');
ylabel('Accuracy');
legend('Training','Validation');
print(sprintf('.\\visualization\\accuracy 1-%d ',topAlpha),'-dpdf')



