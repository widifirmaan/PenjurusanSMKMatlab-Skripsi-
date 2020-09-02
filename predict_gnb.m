function [label,accuracy] = predict_gnb(X,Y,Xnew,Ynew)

[C,~,Y] = unique(Y,'stable');
binranges = 1:numel(C);

P = size(Xnew,1);
label = zeros(P,1);
for i = 1:P
    % Class prior probability
    probability = histc(Y,binranges)/numel(Y);
    for j = binranges
        A = X(Y==j,:);
        S = std(A,1);
        % Probability density function (PDF) of the normal distribution
        gauss = 1./(S.*sqrt(2.*pi))...
            .*exp(-1/2.*((Xnew(i,:)-mean(A))./S).^2);
        % Product
        probability(j) = probability(j)*prod(gauss);
    end
    
    % Sort the probabilities in descending order and check the estimated label
    [~,I] = sort(probability,'descend');
    label(i) = I(1);
end

% Check the number of input and output arguments
if nargin > 3 && nargout > 1
    [~,Ynew] = ismember(Ynew,C);
    accuracy = sum(label==Ynew)/P;
end

label = C(label);
end
