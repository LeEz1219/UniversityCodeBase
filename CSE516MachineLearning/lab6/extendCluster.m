function [labels,C] = extendCluster2(X, labels, p, neighbors, nbP, C, eps, minPts)
    % extend a cluster with label C from the seed p
    % you can define this function recursively. or use a while loop with a queue. 

    
    labels(p) = C;      
    kk=1;
    while true
        j = nbP(kk);
        if labels(j)==0
            labels(j) = C;
            [neighbors2,nbP2] = findNeighbors(X,j,eps);
            if size(neighbors2,1) >= minPts
                neighbors = [neighbors; neighbors2];
                nbP = [nbP; nbP2];
            end
        end
       
        kk = kk+1;
        if kk>size(neighbors,1)
            break;
        end
    end
    % END OF CODE
  end