% Data Analysis 2020
% Chapter 4 Excerise 1
% Uncertainty
% Nick Kaparinos
clc;
clear;

% B
e_real = 0.76;
h1 = 100;
M = 1000;
n = 5;
mu = 58;
sigma = 2;
samples = zeros(n,1);
eMean = zeros(M,1);
eStd = zeros(M,1);

for i = 1:M
    samples = normrnd(mu, sigma, n, 1);
    meanSamples = mean(samples);
    stdSmples = std(samples);
    e = sqrt(samples/h1);
    eMean(i) = mean(e);
    eStd(i) = std(e);
end

% Histogram
figure(1);
histogram(eMean);
hold on
plot([e_real e_real],ylim,'r')
hold off

% C
h1 = [80 100 90 120 95];
h2 = [48 60 50 75 56];

h1Std = std(h1);
h2Std = std(h2);

e = sqrt(h2./h1);
eStd2 = std(e);

h = ttest(e,e_real);




