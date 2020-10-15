% Data Analysis 2020
% Chapter 2 Excerise 5
% Normal distribution calculations for girder company
% Nick Kaparinos
clc;clear;

mu = 4;
sigma = 0.01;

% Probability that girder length is smaller than 3.9
probabilityOfFailure = normcdf(3.9, mu, sigma)

% First percentile
limit = norminv(0.01, mu, sigma)