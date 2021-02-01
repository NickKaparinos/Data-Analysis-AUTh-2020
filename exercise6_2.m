% Data Analysis 2020
% Chapter 6 Excerise 2
% PCA
% Nick Kaparinos
close all;
clc;
clear;

data = importdata("yeast.dat")';

% A
n = size(data,1);
data = normalize(data);

covMatrix = cov(data');
[~,eigenValues] = eig(covMatrix);
eigenValues = diag(eigenValues);
eigenValues = eigenValues(end:-1:1);

% Scree plot
figure(1)
plot(1:length(eigenValues),eigenValues,"-o")
title("Scree plot")
ylabel("eigenvalues")

td = 90;
eigenValuesSum = sum(eigenValues);
sumEigenValues = 0;
i = 0;
while(sumEigenValues < td)
    i = i + 1;
    sumEigenValues = sumEigenValues + 100*eigenValues(i)/eigenValuesSum;
end

% B
[~,scores,~] = pca(data');
% PCA 2D scores scatterplot
figure(2)
scatter(scores(:,1),scores(:,2))
title("PCA Scores 2D Scatterplot")
xlabel("PC1")
ylabel("PC2")

% PCA 3D scores scatterplot
figure(3)
scatter3(scores(:,1),scores(:,2),scores(:,3))
title("PCA Scores 3D Scatterplot")
xlabel("PC1")
ylabel("PC2")
zlabel("PC3")
