% generate some random 2-d data
figure;
data_one = mvnrnd([-5, -5], eye(2) * 5, 500);
data_two = mvnrnd([5, 5], eye(2) * 5, 500);
data_three = mvnrnd([-10, 10], eye(2) * 5, 500);
data = [data_one;data_two;data_three];
plot(data(:,1), data(:,2), 'bx');
title("Randomly generated data, assumed to be 3 clusters");
axis([-10 10 -10 10]);
saveas(gcf, 'problem-1-random-points.png');

% k-means cluster assignments, desired number of clusters = 3
k_means_assignments = k_means(data, 3);
% disp(k_means_assignments);

figure;
scatter(data(:,1), data(:,2), [], k_means_assignments);
title("Cluster assignments after training k-means and k=3");
axis([-10 10 -10 10]);
saveas(gcf, 'problem-1-random-points-CLUSTERED-k3.png');



% k-means cluster assignments, desired number of clusters = 3
k_means_assignments = k_means_spec(data, 3);
% disp(k_means_assignments);

figure;
scatter(data(:,1), data(:,2), [], k_means_assignments);
title("Spectral Cluster assignments after training k-means and k=3");
axis([-10 10 -10 10]);
saveas(gcf, 'problem-1-random-points-SPECTRAL-CLUSTERED-k3.png');