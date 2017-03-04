clear ; close all; clc


% load the points from files provided
X = load('dataX.csv');
y = load('dataY.csv');


% plot the points on a scatter plot

plot(X(find(y==0)',1),X(find(y==0)',2),'.r','markerSize',12);
axis ([-5 12, -11 11]);     
hold on;
plot(X(find(y==1)',1),X(find(y==1)',2),'.g','markerSize',12);
hold on;
plot(X(find(y==2)',1),X(find(y==2)',2),'.k','markerSize',12);



% initialize constants
n = size(X,2);
lambda=1;
initial_theta = zeros(n+1,1);
options = optimset('GradObj', 'on', 'MaxIter', 50);
number_of_classes = length(unique(y));
thetas = zeros(number_of_classes,n+1);


% augment X with a fake property x0, always equal to zero,
% to make calculations easier
X = [ones(size(X,1),1) X];


% calculate best thetas for each class of points
% so that later we can use them to make predictions 
for i = 0:number_of_classes-1

    thetas(i+1,:) = fmincg (@(t)(lrCostFunction(t, X, y==i , lambda)),
    initial_theta,
    options)';
    
    xs = linspace(-5,12,100);
    ys = xs*(-1)*thetas(i+1,2)/thetas(i+1,3)-thetas(i+1,1)/thetas(i+1,3);
    
    hold on;
    plot(xs,ys);
end


% create a new point and predict in which class it should be put
%    point1 = [2.246 ; -0.2];
%    hold on; plot(point1(1), point1(2),'dc');
%    point1 = [1; point1];
%    probability_of_belonging = round(sigmoid(thetas*point1).*100)./100;
%    [maximum_value, index_of_max] = max(probability_of_belonging);
%    printf("Newly created point belongs to class %d with probability of %f\n", index_of_max,maximum_value);


% let's calculate predictions for points we were given as data
% they should be put to the same catogories they actually belong to
%    probability_of_belonging = round(sigmoid(thetas*X').*100)./100;
%    [probability_of_belonging_to_given_class, predicted_class] = max(probability_of_belonging)



% for a whole group of five points, place them in appropriate classes
% using the previosly calculated thetas
how_many_points_to_generate = 10
X_rand = [ones(how_many_points_to_generate,1) stdnormal_rnd(how_many_points_to_generate,2)*4];
[probability_of_belonging_to_given_class, predicted_class] = max(round(sigmoid(thetas*X_rand').*100)./100);


hold on; plot(X_rand(find(predicted_class==1),2), X_rand(find(predicted_class==1),3),'xr');
hold on; plot(X_rand(find(predicted_class==2),2), X_rand(find(predicted_class==2),3),'xg');
hold on; plot(X_rand(find(predicted_class==3),2), X_rand(find(predicted_class==3),3),'xk');


[X_rand probability_of_belonging_to_given_class']