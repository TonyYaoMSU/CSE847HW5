function [cluster_assignments] = k_means(data, K)
    rng(847); % seed for constistent results
    [n, d] = size(data);
    cluster_assignments = zeros(n, 1);
    
    % choose random centroids
    centroids = rand(K,d);
    old_centroids = rand(K,d) * 10;

   
    % termiate when centroids do not change
    while norm(centroids - old_centroids) > 0.001
        for i=1:n
            point = data(i,:);
            distances = sqrt(sum(bsxfun(@minus, point, centroids).^2,2));

            % choose closest cluster
            cluster_assignments(i) = find(distances==min(distances));

        end
        
        old_centroids = centroids;
        for i=1:K
            centroid_points = zeros(0,d);
            for j=1:n
                point = data(j,:);
                if cluster_assignments(j) == i
                    centroid_points = [centroid_points ; point];
                end
            end
            centroids(i,:) = mean(centroid_points, 1);
        end
    end
end