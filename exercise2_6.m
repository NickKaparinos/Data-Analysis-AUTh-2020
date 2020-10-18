% Data Analysis 2020
% Chapter 2 Excerise 5
% Test central limit theorem
% Nick Kaparinos
clc;
clear;

n = 100;
N = 1000;
samples = zeros(n,1);
Y = zeros(N,1);

% Generate samples
for i = 1:N
    for j = 1:n
        samples(j) = unifrnd(0,1);
    end
    Y(i) = mean(samples);
end

% Plot them as well as the normal distribution
histfit(Y);
