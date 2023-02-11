%% Prepare workspace

clear; clc; 

%% Load data 

load('ex4data1.mat');
load('ex4weights.mat');

m = length(y);
n = size(X,2);

%% Neural Network Parameters 

input_layer_size = 400;
hidden_layer_size = 25;
num_labels = 10;
lambda = 1;
iterations = 30;

Theta1 = normrnd(0., 0.000001, [25, 401]);
Theta2 = normrnd(0., 0.000001, [10, 26]);


%% Implement Propagation + Backpropagation 

[J, Theta1_grad, Theta2_grad] = nnCost(Theta1, Theta2, y, m, lambda, num_labels, X);

%% Gradient Descent  

[cost_history, Theta1, Theta2] = gradientDescent(Theta1_grad, Theta2_grad, Theta1, Theta2, iterations,  y, m, lambda, num_labels, X);

%% Plot Cost 

plot(cost_history);
xlabel('Iterations');
ylabel('Cost');






