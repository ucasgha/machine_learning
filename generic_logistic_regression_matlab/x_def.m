function [X] = x_def(x)

X = string(zeros(1,length(x(1,:)) + 1));
X(1) = 'x_0';

for j = 1:length(x(1,:))

    if j > 0

        X(j+1) = append('x_',string(j));

    end

end


end