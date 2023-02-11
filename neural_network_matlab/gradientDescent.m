function [cost_history, Theta1, Theta2] = gradientDescent(Theta1_grad, Theta2_grad, Theta1, Theta2, iterations,  y, m, lambda, num_labels, X)

cost_history = zeros(iterations,1);

alpha = 0.001; 

for i = 1:iterations

Theta1 = Theta1 - alpha * Theta1_grad;

Theta2 = Theta2 - alpha * Theta2_grad; 

[J, Theta1_grad, Theta2_grad] = nnCost(Theta1, Theta2, y, m, lambda, num_labels, X);

cost_history(i) = J;

end


end

