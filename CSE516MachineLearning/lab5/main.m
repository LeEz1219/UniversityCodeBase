X = load('s1.dat');K = 7;epoch = 20;centroids = initCentroids(X, K);for i=1:epoch  indices = reassignPoints(X, centroids);  centroids = updateCentroids(X, indices, K);endscatter(X(:,1),X(:,2),32,indices,'filled')