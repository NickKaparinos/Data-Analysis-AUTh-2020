% Data Analysis 2020
% Chapter 5 Excerise 8
% Step wise regression
% Nick Kaparinos
close all;
clc;
clear;

data = importdata("physical.txt");
headers = data.colheaders;
data = data.data;

X = data(:,2:end);
Y = data(:,1);

rmse = zeros(2,1);
R2 = zeros(2,1);
adjustedR2 = zeros(2,1);

Rsq = @(ypred,y) 1-sum((ypred-y).^2)/sum((y-mean(y)).^2);
adjRsq = @(ypred,y,n,k) ( 1 - (n-1)/(n-1-k)*sum((ypred-y).^2)/sum((y-mean(y)).^2) );

% Normal linear regression
regressionModel = fitlm(X,Y);
b = table2array(regressionModel.Coefficients);
b = b(:,1);

Ypred = [ones(length(X),1) X]*b;
errors = Y - Ypred;
rmse(1) = sqrt( 1/(length(Y)-length(b))*sum(errors).^2 );
R2(1) = Rsq(Ypred,Y);
adjustedR2(1) = adjRsq(Ypred,Y,length(Y),length(b));

% Step wise regression
[b,~,~,model,stats] = stepwisefit(X,Y);
b0 = stats.intercept;
b = [b0; b(model)];     

Ypred = [ones(length(X),1) X(:,model)]*b;
errors = Y - Ypred;
rmse(2) = stats.rmse;

R2(2) = 1 - stats.SSresid/stats.SStotal
adjustedR2(2) = adjRsq(Ypred,Y,length(Y),length(b))
