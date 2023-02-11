function [h] = model_init(theta)

for p = 1:length(theta)

    if p < length(theta)
   
        h(p) = append(theta(p),' * ', append('x_',string(p-1),'(i)'),' + ');

    else

        h(p) = append(theta(p),' * ', append('x_',string(p-1),'(i)'));

    end

end 

end