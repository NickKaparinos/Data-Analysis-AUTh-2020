% Data Analysis 2020
% Chapter 3 Excerise 6
% Bootstrap mean and standard error
% Nick Kaparinos
close all;
clc;
clear;

% A and B

% Generate data
n = 10;
X = normrnd(0,1,[n 1]);
mX = mean(X);

% Bootstrap
B = 1000;
bootstrapMean = bootstrp(B,@mean,X);
seX = std(X)/sqrt(n);
seXB = std(bootstrapMean);

% Plot
figure(1)
clf;
histogram(bootstrapMean)
hold on;
plot([mX mX],ylim,'r');

% C)
Y = exp(X);
mY = mean(Y);

% Bootstrap
bootstrapMean = bootstrp(B,@mean,Y);
seY = std(X)/sqrt(n);
seYB = std(bootstrapMean);

% Plot
figure(2)
clf;
histogram(bootstrapMean);
hold on;
plot([mY mY],ylim,'r');


