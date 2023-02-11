function [data,files] = data_ident()

data = struct2cell(dir);

for i = 1:length(data(1,:))
    for j = 1:length(data(:,i))

        if contains(string(data(j,i)),'.dat')
    
            files(j,i) = string(data(j,i));
    
        end

    end
end

end