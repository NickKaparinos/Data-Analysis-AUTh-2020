% Data Analysis 2020
% Chapter 5 Excerise 1
% Correlation coefficient confidence interval and hypothesis testing
% Nick Kaparinos
clc;
clear;

M = 100000;
n = 20;
mx = 0;
my = 0;
sx = 1;
sy = 1;
ro = [0 0.5];
m = [mx my];

sigma = zeros(2,2,2);
sigma(:,:,1) = [sx^2 0; 0 sy^2];
sigma(:,:,2) = [sx^2 ro(2)*sx*sy; ro(2)*sx*sy sy^2];

CorrelationCi = zeros(M,2,2);
roInCI = zeros(1,2);
nullHypothesisTesting = zeros(2,1);


for i = 1:M
    samples = zeros(n,2,2);
    for j = 1:2
        % Genrate Samples
        samples(:,:,j) = mvnrnd(m,sigma(:,:,j),n);
        % Calculate CI
        [~,p,RL,RU] = corrcoef(samples(:,:,j));
        CorrelationCi(i,:,j) = [RL(1,2),RU(1,2)];
        
        % Check if real correlation coefficient is inside the CI
        if( ro(j) > CorrelationCi(i,1,j) && ro(j) < CorrelationCi(i,2,j) )
            roInCI(j) = roInCI(j) + 1;
        end
        
        % Hypothesis Testing
        if( p(1,2) > 0.05 )
            nullHypothesisTesting(j) = nullHypothesisTesting(j) + 1;
        end    
        
    end
end
roInCI = roInCI./M;

% Histograms
figure(1)
histogram(CorrelationCi(:,1,1));
hold on;
histogram(CorrelationCi(:,2,1));
title("Sample 1: correlation coefficient confidence interval")
legend("Lower bound","Upper bound")

figure(2)
histogram(CorrelationCi(:,1,2))
hold on;
histogram(CorrelationCi(:,2,2))
title("Sample 2: correlation coefficient upper bound")
legend("Lower bound","Upper bound")

disp(roInCI);
disp(nullHypothesisTesting);









% Debug
% [h,p,stats] = fishertest(samples1');
% r1 = corrcoef(samples1(:,1),samples1(:,2));
% r2 = corrcoef(samples1(:,:));
% fet = GetCorrelationCi(samples1);

% function CorrelationCi = GetCorrelationCi(samples)
%     sx = std(samples(:,1));
%     sy = std(samples(:,2));
%     sxy = cov(samples);
%     sxy = sxy(1,2);
%     r = sxy/(sx*sy)
%     CorrelationCi = 0;
% end
