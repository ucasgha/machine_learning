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

%% Define x pending number of parameters in the x_file

[X] = x_def(x);
eval(X(1) + "=" + 'ones(length(x),1)'); 

for p = 2:length(X)

    eval(X(p) + "=" + 'x(:,p-1)');

end

%% Initial Data Plot 

pos = find (y==1);
neg = find (y==0);

for n = 2:length(X)

    if n < length(X) 

        x_plot_1 = eval(X(2));
        x_plot_2 = eval(X(n+1));

    end

    plot(x_plot_1(pos),x_plot_2(pos),'+');
    hold on 
    plot(x_plot_1(neg),x_plot_2(neg),'o');

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

for l = 1:300

    %% Define model hypothesis
    
    [hypothesis,h] = model(theta);
    model_function = zeros(1,length(x));
    
    for i = 1:length(x(:,1))
    
        hypothesis(i) = hypothesis(1);
        model_function(1,i) = eval(hypothesis(i));
        h(i) = 1 ./ (1 + exp(-model_function(1,i))); 
        

    end

    h = str2double(h);

    %% Define the cost function

    for i = 1:length(x(:,1))
    
        c(i) = -y(i) * log(h(i))-(1-y(i)) * log(1-h(i));

        if i > 1

            c(i) = c(i) + c(i-1);

        end

    end

    error = c(length(x(:,1)));

    J = (1/(length(x(:,1)))) * error;


    %% Define the cost derivatives  
    
    for n = 1:length(theta)
    
        x_val = eval(X(n));
    
        for i = 1:length(x)
    
            derivative(i,n) = append('derivative_',string(n-1));
            derivatives(i,n) = (h(i) - y(i)) * x_val(i);
    
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

%% Graph 

plot_x = [min(x(:,1))-2,  max(x(:,1))+2];
plot_y = (-1./(theta_2)) .* (theta_1 .* plot_x + (theta_0)); 
plot(plot_x, plot_y)