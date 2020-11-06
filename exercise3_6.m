% Data Analysis 2020
% Chapter 3 Excerise 6
% Bootstrap mean and standard error
% Nick Kaparinos
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
seX = var(bootstrapMean);

% Plot
figure(1)
clf;
hist(bootstrapMean)
hold on;
yfet = ylim;
plot([mX mX],yfet,'r');

% Bootstrap Plot second method
result = bootstrp(B,@mean,X);
[fi,xi] = ksdensity(result);
figure(2);
clf;
plot(xi,fi);
hold on;
yfet = ylim;
plot([mX mX],yfet,'r');

% C)
Y = exp(X);
mY = mean(Y)

% Bootstrap
bootstrapMean = bootstrp(B,@mean,Y);
seY = var(bootstrapMean);

% Plot
figure(3)
clf;
hist(bootstrapMean);
hold on;
yfet = ylim;
plot([mY mY],yfet,'r');

% Bootstrap Plot second method
[fi,xi] = ksdensity(bootstrapMean);
figure(4);
clf;
plot(xi,fi);
hold on;
yfet = ylim;
plot([mY mY],yfet,'r');

