% Data Analysis 2020
% Chapter 3 Excerise 9
% Bootstrap mean difference confidence interval
% Nick Kaparinos
clc;
clear;

M = 100;
n = 10;
m = 12;
B = 100;
a = 0.05;
X = normrnd(0,1,[M n]);
Y = normrnd(0,1,[M m]);
mx = mean(X,2);
my = mean(Y,2);

ts = tinv([0.025  0.975],n+m-2);
lowerLim = (B+1)*a/2;
upperLim = B+1-lowerLim;
limits = [lowerLim upperLim]/B*100;

% A
CIParametric = zeros(M,2);
CIBootstrap = zeros(M,2);
for i = 1:M
    % Parametric Confidence Interval
    sp = sqrt( ( (n-1)*var(X(i,:)) + (m-1)*var(Y(i,:)) )/(n+m-2) );
    CIParametric(i,:) = (mx(i)-my(i))+ts*sp*sqrt(1/n+1/m);
    
    % Bootstram Confidence Interval
    bootstrapMeanX = bootstrp(B,@mean,X(i,:));
    bootstrapMeanY = bootstrp(B,@mean,Y(i,:)); 
    difference = bootstrapMeanX - bootstrapMeanY;
    CIBootstrap(i,:) = prctile(difference,limits);
end

% B

