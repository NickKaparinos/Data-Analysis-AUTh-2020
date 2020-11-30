% Data Analysis 2020
% Chapter 5 Excerise 2
% Correlation coefficient permutation hypothesis test
% Nick Kaparinos
clc;
clear;

L = 1000;
n = 20;
m = [0 0];
sx = 1;
sy = 1;
ro = [0 0.5];
samples = zeros(n,2,2);
t = zeros(L,2);

sigma = zeros(2,2,2);
sigma(:,:,1) = [sx^2 0; 0 sy^2];
sigma(:,:,2) = [sx^2 ro(2)*sx*sy; ro(2)*sx*sy sy^2];

squareTransform = 1;

% Generate starting samples and calculate t0
t0 = zeros(2,1);
for j = 1:2
    samples(:,:,j) = mvnrnd(m,sigma(:,:,j),n);
    r = corrcoef(samples(:,:,j));
    t0(j) = r(1,2)*sqrt( (n-2)/(1-r(1,2)^2) );
end

% Square transformation
if( squareTransform )
    samples = samples.^2;
end

for i = 1:L
    % Caclulate samples permutation
    samplesPerm = samples;
    samplesPerm(:,1,:) = samplesPerm(randperm(n),1,:);
    
    % Calculate t
    for j = 1:2
        r = corrcoef(samplesPerm(:,:,j));
        t(i,j) = r(1,2)*sqrt( (n-2)/(1-r(1,2)^2) );
    end
    
end
t = sort(t);

% Calculate CI
CI = zeros(2,2);
alpha = 5;
t0InCI = zeros(2,1);
percentiles = [alpha/2 (100-alpha)/2];

for j = 1:2
    CI(:,j) = prctile(t(:,j),percentiles);
    
    if( t0(j) > CI(1,j) && t0(j) < CI(2,j) )
        t0InCI(j) = 1;
    end
    
end