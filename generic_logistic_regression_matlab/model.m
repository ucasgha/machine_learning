function [hypothesis,h] = model(theta)

[h] = model_init(theta);

for z = 1:length(h)

    if z > 1

        h(z) = append(string(h(z-1)),string(h(z)));

    end

end
    
hypothesis = h(z);


end