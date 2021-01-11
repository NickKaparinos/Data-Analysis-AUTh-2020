% Data Analysis 2020
% Chapter 6 Excerise 1
% PCA
% Nick Kaparinos
close all;
clc;
clear;

n = 1000;
sx = 1;
sy = 2;
W = [0.2 0.8;0.4 0.5;0.7 0.3];
sigma = [sx^2 0; 0 sy^2];
data = mvnrnd([0 0],sigma,n);

% A
% 2D Scatterplot
figure(1)
scatter(data(:,1),data(:,2))
title("2D Scatteplot")
xlabel("X1")
ylabel("X2")


% 3D Scatterplot
figure(2)
data3D = data*W';
scatter3(data3D(:,1),data3D(:,2),data3D(:,3))
title("3D Scatterplot")

data3D = normalize(data3D);
covMatrix = cov(data3D);
[~,eigenValues] = eig(covMatrix);
eigenValues = diag(eigenValues);
eigenValues = sort(eigenValues,'descend');

% PCA component scores
[~,scores,~] = pca(data3D);
figure(3)
scatter3(scores(:,1),scores(:,2),scores(:,3))
title("PCA Scores 3D Scatterplot")
xlabel("PC1")
ylabel("PC2")
zlabel("PC3")

% B
% Scree plot
figure(4)
plot(1:length(eigenValues),eigenValues,"-o")
title("Scree plot")
ylabel("eigenvalues")

% C
% PCA 2D scores scatterplot
figure(5)
scatter(scores(:,1),scores(:,2))
title("PCA Scores 2D Scatterplot")
xlabel("PC1")
ylabel("PC2")

infoLoss = eigenValues(3)/sum(eigenValues)
