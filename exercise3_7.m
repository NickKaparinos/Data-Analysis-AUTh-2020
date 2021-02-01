% Data Analysis 2020
% Chapter 3 Excerise 7
% Bootstrap mean confidence interval
% Nick Kaparinos
close all;
clc;
clear;

M = 100;
n = 10;
B = 1000;
X = normrnd(0,1,[M n]);
CIParam = zeros(M,2);

% A
% Bootstrap CI
CIBoot = bootci(B,{@mean,X'},'type','percentile')';

% Parametric CI
for i = 1:M
    [~,~,CIParam(i,:),~] = ttest(X(i,:),0);
end

% Histograms
figure(1);
histogram(CIBoot(:,1), M);
hold on;
histogram(CIParam(:,1), M);
legend('Bootstrap','Parametric');
title('Confidence Interval lower bound');

figure(2);
histogram(CIBoot(:,2), M);
hold on;
histogram(CIParam(:,2), M);
legend('Bootstrap','Parametric');
title('Confidence Interval upper bound');

% B
% Bootstrap CI
Y = X.^2;
CIBoot = bootci(B,@mean,Y')';

% Parametric CI
for i = 1:M
    [~,~,CIParam(i,:),~] = ttest(Y(i,:),0);
end

% Histograms
figure(3);
histogram(CIBoot(:,1), M);
hold on;
histogram(CIParam(:,1), M);
legend('Bootstrap','Parametric');
title('Confidence Interval lower bound');

figure(4);
histogram(CIBoot(:,2), M);
hold on;
histogram(CIParam(:,2), M);
legend('Bootstrap','Parametric');
title('Confidence Interval upper bound');
