function [theta,theta_init_val] = theta_def(x)

[theta] = theta_init(x);
theta_init_val = 0;

for k = length(theta)

    eval(theta(k) + "=" + theta_init_val);

end

for i = 1:length(theta) - 1

   eval(theta(i) + "=" + theta_init_val);

end

end