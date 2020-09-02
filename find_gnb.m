function [labels,probabilities] = find_gnb(X,Y,Xnew)
%Gaussian Naive Bayes (GNB)
%
%Author: David Ferreira - Federal University of Amazonas
%Contact: ferreirad08@gmail.com
%
%find_gnb
%
%Syntax
%1. [labels,probabilities] = find_gnb(X,Y,Xnew)
%
%Description
%1. Returns the labels with their respective probabilities in descending order.
%
%X is a M-by-N matrix, with M instances of N features. 
%Y is a M-by-1 matrix, with respective M labels to each training instance. 
%Xnew is a 1-by-N matrix, with one instance of N features to be classified.
%
%Examples
%1.
%     load fisheriris
%     X = meas;
%     Y = species;
%     Xnew = mean(meas);
%     [labels,probabilities] = find_gnb(X,Y,Xnew)
%     labels = 
%         'versicolor'
%         'virginica'
%         'setosa'
%     probabilities =
%         1.0000
%         0.0000
%         0.0000

[C,~,Y] = unique(Y,'stable');
binranges = 1:numel(C);

% Class prior probability
probability = histc(Y,binranges)/numel(Y);
for j = binranges
    A = X(Y==j,:);
    S = std(A,1);
    % Probability density function (PDF) of the normal distribution
    gauss = 1./(S.*sqrt(2.*pi))...
        .*exp(-1/2.*((Xnew-mean(A))./S).^2);
    % Product
    probability(j) = probability(j)*prod(gauss);
end

% Sort the probabilities in descending order with their respective labels
[probabilities,I] = sort(probability,'descend');
labels = C(I);
% Normalizes the probabilities
probabilities = probabilities/sum(probabilities);
end
