function [error] = error_function(model_function,x,y)

for i = 1:length(x)

    error(i) = (model_function(i) - y(i))^2;

end


for i = 1:length(x)

    if i > 1
        
        error(i) = error(i) + error(i-1);
    
    end

end

error = error(length(x));


end