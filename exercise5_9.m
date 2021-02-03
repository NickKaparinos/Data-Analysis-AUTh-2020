% Data Analysis 2020
% Chapter 5 Excerise 9
% Step wise regression and multicollinearity
% Nick Kaparinos
close all;
clc;
clear;


data = importdata("hospital.txt");
headers = data.colheaders;
data = data.data;

X = data(:,2:end);
Y = data(:,1);

rmse = zeros(2,1);
R2 = zeros(2,1);
adjustedR2 = zeros(2,1);

Rsq = @(ypred,y) 1-sum((ypred-y).^2)/sum((y-mean(y)).^2);
adjRsq = @(ypred,y,n,dof) ( 1 - (n-1)/(n-dof)*sum((ypred-y).^2)/sum((y-mean(y)).^2) );

% Normal linear regression
regressionModel = fitlm(X,Y);
b = regressionModel.Coefficients.Estimate;

Ypred = [ones(length(X),1) X]*b;
errors = Y - Ypred;
rmse(1) = sqrt( 1/(length(Y)-length(b))*sum(errors.^2) );
R2(1) = Rsq(Ypred,Y);
adjustedR2(1) = adjRsq(Ypred,Y,length(Y),length(b));

% Step wise regression
[b,~,~,model,stats] = stepwisefit(X,Y);
b0 = stats.intercept;
b = [b0; b(model)]; 

Ypred = [ones(length(X),1) X(:,model)]*b;
errors = Y - Ypred;
rmse(2) = sqrt( 1/(length(Y)-length(b))*sum(errors).^2);

R2(2) = 1 - stats.SSresid/stats.SStotal;
adjustedR2(2) = adjRsq(Ypred,Y,length(Y),length(b));


R2Matrix = zeros(size(X,2),1);

% Multicollinearity
for i = 1:size(X,2)
    W = X;
    W(:,i) = [];
    Y = X(:,i);
    
    regressionModel = fitlm(W,Y);
    b = table2array(regressionModel.Coefficients);
    b = b(:,1);

    Ypred = [ones(length(W),1) W]*b;
    R2Matrix(i) = Rsq(Ypred,Y);
end

disp(R2Matrix)

