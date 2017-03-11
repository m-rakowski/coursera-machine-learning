clear ; close all; clc

% load X and y from file
load('ex3data1.mat');

% augment X with a fake property x0, always equal to zero,
% to make calculations easier


lambda = 0.1;

thetas = calculateThetas(X,y,lambda);
predictForPoint(X(1,:)');

% let's calculate predictions for points we were given as data
% they should be put to the same catogories they actually belong to
    probability_of_belonging = round(sigmoid(thetas*X').*100)./100;
    [probability_of_belonging_to_given_class, predicted_class] = max(probability_of_belonging);
    
    predicted_class'

    
% for a whole group of five points, place them in appropriate classes
% using the previosly calculated thetas
%how_many_points_to_generate = 10
%X_rand = [ones(how_many_points_to_generate,1) stdnormal_rnd(how_many_points_to_generate,n)*4];
%[probability_of_belonging_to_given_class, predicted_class] = max(round(sigmoid(thetas*X_rand').*100)./100);


%disp([predicted_class' probability_of_belonging_to_given_class' X_rand])