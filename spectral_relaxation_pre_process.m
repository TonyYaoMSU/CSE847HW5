function [transformed_data] = spectral_relaxation_pre_process(X,k)
% transforms the input data matrix using SVD into a form that k-means 
% can more easily cluster

[U,S,V] = svd(X);
% disp(size(U)) % data x data
% disp(size(S)) % data x features
% disp(V) % features x features
% disp((U*S*V.')-X) %should be close to 0
[features, ~] = size(V);
if k >= features
   disp("WARNING! k is not less than the original number of features!");
end
clip = min(features, k);
truncated_V = V(1:clip, :);
% disp(truncated_V);
transformed_data = X * truncated_V;
end