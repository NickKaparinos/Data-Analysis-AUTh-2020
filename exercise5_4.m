% Data Analysis 2020
% Chapter 5 Excerise 4
% Linear regression
% Nick Kaparinos
clc;
clear;

lightair = importdata("lightair.dat");
X = lightair(:,1);
Y = lightair(:,2);

% A
% Scatterplot
figure(1)
scatter(X, Y);
hold on;
title("Scatterplot")
xlabel("Air density")
ylabel("Speed of light")

% B
% Compute regression model
regressionModel = fitlm(X,Y);

b = table2array(regressionModel.Coefficients);
b = b(:,1);

% Scatterplot with reggression
Xones = [ones(length(X),1) X];
regression = Xones*b;
plot(X,regression,'-')
hold on;

BCI = coefCI(regressionModel);

% C
% Plot confidence intervals
[~,ypredCI] = predict(regressionModel, X, 'Prediction', 'curve');
[~,yobservCI] = predict(regressionModel, X, 'Prediction', 'observation');
plot(X,ypredCI,'--')
hold on;
plot(X,yobservCI,'-.')
hold on;

% Predictions for x0 = 1.29
x0 = 1.29;
[ypred,ypredCI] = predict(regressionModel, x0, 'Prediction', 'curve');
[~,yobservCI] = predict(regressionModel, x0, 'Prediction', 'observation');
plot(x0 , ypred,'x');
plot(x0, ypredCI,'*');
plot(x0, yobservCI,'o');

% D
% Real regression
breal = zeros(2,1);
breal(1) = 299792.458;
breal(2) = -299792.458*0.00029/1.29;
regression = Xones*breal - 299000;
plot(X,regression,'LineWidth',2,'LineStyle','-','Color','r')


% Debug
close all;
n = 100;
sy2 = var(Y);
sx2 = var(X);
b1 = b(2);
se2 = (n-1)/(n-2)*(sy2-(b1^2)*sx2);
se = sqrt(se2);

