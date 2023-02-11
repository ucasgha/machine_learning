function [theta] = theta_init(x)

theta = string(zeros(1,length(x(1,:)) + 1));
theta(1) = 'theta_0';

for j = 1:length(x(1,:))

    if j > 0

        theta(j+1) = append('theta_',string(j));

    end

end

end