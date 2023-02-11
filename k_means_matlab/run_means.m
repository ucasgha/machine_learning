function [idx,centroids] = run_means(x, initial_centroids, iterations,K,m,n)



   for i= 1:iterations
       
    
    idx = closestCentroid(x,initial_centroids,m,K);
    
    centroids = computeCentroids(x,idx,K, n);
    
    
   end
 


end

