
%% Clear all

clc; clear all;

%% Define the learning rate 

[alpha] = rate_ident();

%% Identify the relevant data files in the directory (.dat)

[data,files] = data_ident();

%% Select the relevant data files to be used for the x and y values

[x_file,y_file] = file_ident(files);

%% Set the x and y variables 

x = load(x_file);
y = load(y_file); 

%% Plot the data 

subplot(1,2,1)
scatter(x,y)
xlabel('input data');
ylabel('output data');
title('Linear regression')
hold on

%% Define x pending number of parameters in the x_file

[X] = x_def(x);
eval(X(1) + "=" + 'ones(length(x),1)'); 

for p = 2:length(X)

    eval(X(p) + "=" + 'x(:,p-1)');

end

%% Define thetas pending number of parameters in the x_file 


[theta] = theta_init(x);
theta_init_val = 0;

for k = length(theta)

    eval(theta(k) + "=" + theta_init_val);

end

for i = 1:length(theta) - 1

   eval(theta(i) + "=" + theta_init_val);

end

for l = 1:100

    %% Define model hypothesis
    
    [hypothesis,h] = model(theta);
    model_function = zeros(1,length(x));
    
    for i = 1:length(x(:,1))
    
        hypothesis(i) = hypothesis(1);
        model_function(1,i) = eval(hypothesis(i));
    
    end
    
    %% Define the cost function 
    
    [error] = error_function(model_function,x,y);
    m = length(x);
    
    J(l) = (1/(2*m)) * error; 
    
    %% Define the cost derivatives  
    
    for n = 1:length(theta)
    
        x_val = eval(X(n));
    
        for i = 1:length(x)
    
            derivative(i,n) = append('derivative_',string(n-1));
            derivatives(i,n) = (model_function(i) - y(i)) * x_val(i);
    
            if i > 1
    
                derivatives(i,n) = derivatives(i,n) + derivatives(i-1,n);
    
            end
    
        end
    
        sum_derivatives(n) = derivatives(length(x),n);
    
    end
    
    %% Define gradient descent 
     
    for p = 1:length(theta)

        right_hand(p) = eval(theta(p)) - (alpha/(length(x))) * sum_derivatives(p);
        eval(eval('theta(p)') + "=" + 'right_hand(p)');  
    
    end
    

end

%% Graph the soluation

plot(x,model_function)
subplot(1,2,2)
plot(J)
xlabel('Iterations');
ylabel('Cost (error)');
title('Model Error');







 

