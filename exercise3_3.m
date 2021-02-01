% Data Analysis 2020
% Chapter 3 Excerise 3
% Test probabily that exponential distrubution mean is inside confidence interval
% Nick Kaparinos
close all;
clc;
clear;

n = [5 100];
M = 100;
mu = 15;
confidencePercent = 95;

% Part a
isInsideIntervalCounter = 0;
for i = 1:M
    % Generate data
    samples = zeros(n(1),1);
    for j = 1:n(1)
        samples(j) = exprnd(mu);
    end
    
    % Calculate confidence interval
    [h,~,CI(:),~] = ttest(samples,mu);
    
    % Check if mean is inside confidence interval and update counter
    if(mu>=CI(1) && mu<=CI(2))
        isInsideIntervalCounter = isInsideIntervalCounter + 1;
    end
end
percentIsInsideIntervalA = isInsideIntervalCounter/M;

% Part b
isInsideIntervalCounter = 0;
for i = 1:M
    % Generate data
    samples = zeros(n(2),1);
    for j = 1:n(2)
        samples(j) = exprnd(mu);
    end
    
    % Calculate confidence interval
    [~,~,CI(:),~] = ttest(samples,mu);
    
    % Check if mean is inside confidence interval and update counter
    if(mu>=CI(1) && mu<=CI(2))
        isInsideIntervalCounter = isInsideIntervalCounter + 1;
    end
end
percentIsInsideIntervalB = isInsideIntervalCounter/M;

% Display results
disp(percentIsInsideIntervalA)
disp(percentIsInsideIntervalB)