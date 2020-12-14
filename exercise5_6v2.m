% Data Analysis 2020
% Chapter 5 Excerise 6
% Non linear regression
% Nick Kaparinos
close all;
clc;
clear;

data = [1 2 98.2;2 3 91.7;3 8 81.3;4 16 64.0; 5 32 36.4;6 48 32.6;7 64 17.1;8 80 11.3];

X = data(:,2);
Y = data(:,3);

Ytrans = log(Y);

% A
% Data Scatterplot
figure(1)
scatter(X,Y)
hold on;

% Exponential
exponential = @(b,x)( b(1)*exp(b(2)*x) );

% Compute regression model
regressionModel = fitlm(X,Ytrans);

b = table2array(regressionModel.Coefficients);
b = b(:,1);

b(1) = exp(b(1));

pred = exponential(b,X);
plot(X,pred);
title("Exponential");
mse = sum((Y - pred).^2)/(length(X)-2);

% Plot diagnostic plot of standardised error
ei_standard = (Y - pred)/sqrt(mse);
figure(2)
scatter(Y,ei_standard);
hold on;
plot(Y,repmat(2,1,length(Y)));
hold on;
plot(Y,repmat(0,1,length(Y)));
hold on;
plot(Y,repmat(-2,1,length(Y)));
title("Exponential regression standardised error");


