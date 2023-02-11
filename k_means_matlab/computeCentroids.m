function centroids = computeCentroids(x,idx,K, n)

centroids = zeros(K,n);

for i = 1:K
    
    indices = idx == i;
    
for j = 1:n
        
centroids(i,j) = (x(:,j)' * indices)/sum(indices);

end
    
end


end

