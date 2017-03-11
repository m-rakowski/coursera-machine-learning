function thetas = calculateThetas(X,y,lambda)
% calculate best thetas for each class of points
% so that later we can use them to make predictions 
n = size(X,2);
number_of_classes = length(unique(y));

X = [ones(size(X,1),1) X];


options = optimset('GradObj', 'on', 'MaxIter', 10);

initial_theta = zeros(n+1,1);

thetas = zeros(number_of_classes,n+1);


for i = 0:number_of_classes-1

    thetas(i+1,:) = fmincg (@(t)(lrCostFunction(t, X, y==i , lambda)),
    initial_theta,
    options)';

end
end