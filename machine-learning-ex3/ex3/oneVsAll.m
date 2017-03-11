function [thetas] = oneVsAll(X, y, num_labels, lambda)
%ONEVSALL trains multiple logistic regression classifiers and returns all
%the classifiers in a matrix all_theta, where the i-th row of all_theta 
%corresponds to the classifier for label i
%   [all_theta] = ONEVSALL(X, y, num_labels, lambda) trains num_labels
%   logistic regression classifiers and returns each of these classifiers
%   in a matrix all_theta, where the i-th row of all_theta corresponds 
%   to the classifier for label i

% initialize constants
n = size(X, 2);
initial_theta = zeros(n+1,1);
options = optimset('GradObj', 'on', 'MaxIter',50);
number_of_classes = length(unique(y));
thetas = zeros(number_of_classes,n+1);

X = [ones(size(X,1),1) X];


% calculate best thetas for each class of points
% so that later we can use them to make predictions 
for i = 0:number_of_classes-1

    thetas(i+1,:) = fmincg (@(t)(lrCostFunction(t, X, y==i , lambda)),
    initial_theta,
    options)';
    
end


end