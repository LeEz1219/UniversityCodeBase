%Li 006704029 lab6_DBSCANclc; close all; clear all;% Load data.X = load('s2.dat');X = X(:,[1 2]);% DBSCAN% initialize parameters ( you can change them to see the difference)eps = 2;minPts = 3;% initialize indices that contains the label/cluster info of every datapoint.labels = zeros(size(X,1), 1);% 0 - the datapoint hasn't been touched% -1 - the datapoint is considered as noise% any positive integer (e.g 1,2,3,4,...) cluster labelC = 1; % current cluster label starts with 1 %classify% walk through all data points:[m, ~] = size(X);for i = 1:m  % check every points, find neighbors, and extend clusters  % YOUR CODE HERE      if labels(i) ==0        [neighbors,nbP] = findNeighbors(X, i, eps);        if size(neighbors,1) < minPts            labels(i) = -1;        else            [labels,C] = extendCluster(X, labels, i, neighbors, nbP, C, eps, minPts);            C = C+1;                end    end      % END OF CODE end  %color k = max(labels);colors = hsv(k);indices = zeros(size(X,1),3);for i = 1:k    ind = find(labels==i);    for ii=1:length(ind)    indices(ind(ii),:) = colors(i,:);    endend% noiseind = find(labels == -1);if isempty(ind)==0    for i=1:ind    indices(i,:) = [0,0,0];  % black    endend% Plotfigure;scatter(X(:,1),X(:,2),32,indices,'filled');title(['eps=',num2str(eps),', minPts=',num2str(minPts)]);