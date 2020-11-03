% Data Analysis 2020
% Chapter 3 Excerise 4
% Confidence intervals and normal distribution goodness of fit
% Nick Kaparinos
clc;
clear;

x = [41 46 47 47 48 50 50 50 50 50 50 50 48 50 50 50 50 50 50 50 52 52 53 55 50 50 50 50 52 52 53 53 53 53 53 57 52 52 53 53 53 53 53 53 54 54 55 68];
v = var(x);

% a and b
[h1,~,CI,~] = vartest(x,25);

% c and d
[h2,~,CI2,~] = ttest(x,52);

% e
[h3,~] = chi2gof(x);