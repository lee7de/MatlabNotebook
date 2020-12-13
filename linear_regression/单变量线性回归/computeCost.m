function J = computeCost(X, y, theta)
% Initialize some useful values
m = length(y);
J = 0;

Z = (X * theta - y) .^ 2;
J = sum(Z(:,1))/(2 * m);

end