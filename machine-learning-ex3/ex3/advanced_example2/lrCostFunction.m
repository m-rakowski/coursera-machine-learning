function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with 
%regularization
%   J = LRCOSTFUNCTION(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

J = lambda/2/m*sum(theta([2:length(theta)]).^2)+1/m*sum(-1*y.*log(sigmoid(X*theta))-(1-y).*log(1-sigmoid(X*theta)));

grad = zeros(size(theta));
grad = lambda/m*theta+1/m*X'*(sigmoid(X*theta)-y);
grad(1) = (1/m*X'*(sigmoid(X*theta)-y))(1);


end