function idx = closestCentroid(x,initial_centroids,m,K)

idx = zeros(3,1);

for i = 1:m 
    
    distance = inf;
    
    for j = 1:K
        
        dist = norm(x(i,:) - initial_centroids(j,:)) ;
        
        if(dist < distance)
            distance = dist;
            idx(i) = j;
            
        end
        
    end
end

end

