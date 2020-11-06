% Data Analysis 2020
% Chapter 3 Excerise 6
% Bootstrap confidence interval
% Nick Kaparinos
clc;
clear;

M = 5;
n = 10;
B = 1000;
X = normrnd(0,1,[M n]);
CIParam = zeros(M,2);
CIBoot = zeros(M,2);

for i = 1:M
    [~,~,CIParam(i,:),~] = ttest(X(i,:),0);
    CIBoot(i,:) = bootci(B,@mean);
end