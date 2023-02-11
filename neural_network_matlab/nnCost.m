function [J, Theta1_grad, Theta2_grad] = nnCost(Theta1, Theta2, y, m, lambda, num_labels, X)

% Propagation 

% Input Layer
a1 = [ones(m,1),X]; % 5000 x 401
z1 = a1 * Theta1'; % 5000x25

% Hidden Layer 
a2 = nnSigmoid(z1);
a2 = [ones(m,1), a2];
z2 = a2 * Theta2';

% Output Layer 
htheta = nnSigmoid(z2); % 5000x10


% Vectorize Output 
yk = zeros(m,num_labels); 

for i = 1:m
    
   for j = 1:num_labels
       
      yk(i,j) = y(i) == j;
       
   end  
    
end


% Neural Network Total Cost 

J = (-1/m) * (yk(1,:) * log(htheta(1,:))' + (1-yk(1,:)) * log(1-htheta(1,:))');

for i = 2:m
   
J = J + (-1/m) * (yk(i,:) * log(htheta(i,:)') + (1-yk(i,:)) * log(1-htheta(i,:))');
    
end


% Regularization

%regTheta1 = Theta1(1,2).^2;

%regTheta2 = Theta2(1,2).^2; 


%for i = 2:25
    
%    for j = 3:401
      
%        regTheta1 = regTheta1 + Theta1(i,j).^2;
        
%    end
%end



%for i = 2:10
    
%    for j = 3:26
      
%        regTheta2 = regTheta2 + Theta2(i,j).^2;
        
%    end
%end



%reg = (lambda/(2*m)) * (regTheta1 + regTheta2);

%J = J + reg; 



% Backpropagation


% Output Layer Error 

Delta3 = htheta(1,:) - yk(1,:);

for i = 2:m
    
    Delta3 = Delta3 + htheta(i,:) - yk(i,:);
    
end

% Hiddent Layer Error 

sig = nnSigmoid([1,z1(1,:)]); 

for i = 2:m
    
  sig = sig + nnSigmoid([1,z1(i,:)]);   
    
end


Delta2 = Delta3 * Theta2 .*sig; 

Delta2 = Delta2(2:end); 

% Delta2 = 1x10 * 10x26.* 5000x26


Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2)); 



% Theta1_grad

Theta1_grad = Delta2' * a1(1,:); % 25x401 = 25x401 + 1x25 * 5000x401

for i = 2:m

Theta1_grad = Theta1_grad + Delta2' * a1(i,:);

end


% Theta2_grad 

Theta2_grad = Delta3' * a2(1,:); % 1x10 * 1x26


for i = 2:m

Theta2_grad = Theta2_grad + Delta3' * a2(i,:);

end

Theta1_grad = Theta1_grad/m;

Theta2_grad = Theta2_grad/m;



end

