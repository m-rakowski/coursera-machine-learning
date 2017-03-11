function [maximum_value, index_of_max] = predictForPoint(point, thetas)
% create a new point and predict in which class it should be put
    
    probability_of_belonging = round(sigmoid(thetas*point).*100)./100;
    [maximum_value, index_of_max] = max(probability_of_belonging);
    printf("Newly created point belongs to class %d with probability of %f\n", index_of_max,maximum_value);


end