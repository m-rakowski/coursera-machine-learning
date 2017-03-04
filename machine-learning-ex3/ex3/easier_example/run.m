clear ; close all; clc

X = [7.1 1.2;  % red
     8 0.9;
     7.01 1.4;
     6.01 1.1;
     
     4 5;      % green
     3.9 6;
     5.5 5.1;
     4.9 5.2;
     
     -3 -1;       %yellow
     -1.1 -0.9;
     -1.2 -1.1];

n = size(X,2);
     
plot(X(1:4,1),X(1:4,2),'or')
hold on;
plot(X(5:8,1),X(5:8,2),'xg')
hold on;
plot(X(9:11,1),X(9:11,2),'oy')


X = [ones(size(X,1),1) X];
y = [0 0 0 0 1 1 1 1 2 2 2]';

lambda=0;
initial_theta = [0 0 0]';

options = optimset('GradObj', 'on', 'MaxIter', 50);

num_labels = 3;
thetas = zeros(num_labels,n+1);
for i = 0:num_labels-1

    thetas(i+1,:) = fmincg (@(t)(lrCostFunction(t, X, y==i , lambda)),
    initial_theta,
    options)';
    
    xs = linspace(-5,12,100);
    ys = xs*(-1)*thetas(i+1,2)/thetas(i+1,3)-thetas(i+1,1)/thetas(i+1,3);
    
    hold on;
    plot(xs,ys);
end



point1 = [2.246 ; -0.2];
hold on; plot(point1(1), point1(2),'ob');
point1 = [1; point1];
probability_of_belonging = round(sigmoid(thetas*point1).*100)./100
[maximum_value, index_of_max] = max(probability_of_belonging)
printf("Point belongs to class %d with probability of %f\n", index_of_max,maximum_value);




probability_of_belonging = round(sigmoid(thetas*X').*100)./100
[maximum_value, index_of_max] = max(probability_of_belonging)