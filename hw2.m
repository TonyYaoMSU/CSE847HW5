figure;
scatter([0 -1 -3 1 3], [0 2 6 -2 -6])

load USPS.mat
reconstructed = A;

% write the sample images
sample_one = reshape(reconstructed(1,:), 16, 16);
imwrite(sample_one','./problem-2-sample-image1.jpg');
sample_two = reshape(reconstructed(1000,:), 16, 16);
imwrite(sample_two','./problem-2-sample-image2.jpg');

% d = 10
[residuals,reconstructed] = pcares(A, 10);
disp(norm(A - reconstructed));
imwrite(reshape(reconstructed(1,:), 16, 16)','./reduced_images/image_1_10.jpg');
imwrite(reshape(reconstructed(1000,:), 16, 16)','./reduced_images/image_2_10.jpg');

% d = 50
[residuals,reconstructed] = pcares(A, 50);
disp(norm(A - reconstructed));
imwrite(reshape(reconstructed(1,:), 16, 16)','./reduced_images/image_1_50.jpg');
imwrite(reshape(reconstructed(1000,:), 16, 16)','./reduced_images/image_2_50.jpg');

% d = 100
[residuals,reconstructed] = pcares(A, 100);
disp(norm(A - reconstructed));
imwrite(reshape(reconstructed(1,:), 16, 16)','./reduced_images/image_1_100.jpg');
imwrite(reshape(reconstructed(1000,:), 16, 16)','./reduced_images/image_2_100.jpg');

% d = 200
[residuals,reconstructed] = pcares(A, 200);
disp(norm(A - reconstructed));
imwrite(reshape(reconstructed(1,:), 16, 16)','./reduced_images/image_1_200.jpg');
imwrite(reshape(reconstructed(1000,:), 16, 16)','./reduced_images/image_2_200.jpg');