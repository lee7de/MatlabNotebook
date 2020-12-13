%% ==plotting==
fprintf('plotting Data...\n')
data = load('ex1data1.txt');
X = data(:, 1); Y = data(:, 2);
m = length(Y); %number of traing examples

% Plot Data
plotData(X, Y);

fprintf('Plotting ends.\n');
pause;

%% ==Gradient descent==
X = [ones(m,1), data(:,1)]; % Add a column of ones to x
theta = zeros(2, 1); 

%% Some gradient descent settings
iterations = 1500;
alpha = 0.01;

% compute and display initial cost
computeCost(X, y, theta)
