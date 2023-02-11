function [initial_centroids] = initialize(K,x)

%centroids = zeros(K, size(x,2));

totalRows = size(x,1);
sampleSize = K;

rndIDX = randperm(totalRows); 


initial_centroids = x(rndIDX(1:sampleSize),:);

end

