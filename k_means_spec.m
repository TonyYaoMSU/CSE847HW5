function [cluster_assignments] = k_means_spec(data, K)
    data_relaxed = spectral_relaxation_pre_process(data, K);
    cluster_assignments = kmeans(data_relaxed, K);
end