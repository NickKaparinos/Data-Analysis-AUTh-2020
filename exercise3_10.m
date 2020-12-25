% Data Analysis 2020
% Chapter 3 Excerise 10
% Bootstrap testing hypothesis
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

lowerLim = (B+1)*a/2;
upperLim = B+1-lowerLim;
limits = [lowerLim upperLim]/B*100;
limits(1) = ceil(limits(1));
limits(2) = floor(limits(2));

% A
CIBootstrap = zeros(M,2);
result = zeros(M,1);
for i = 1:M
    % Bootstram hypothesis testing
    samples = [X(i,:) Y(i,:)];
    difference = zeros(B,1);
    for j = 1:B
        samplesTemp = samples(randperm(length(samples)));
        samplesX = samplesTemp(1:n);
        samplesY = samplesTemp(n+1:end);
        mx = mean(samplesX);
        my = mean(samplesY);
        difference(j) = mx - my;
    end
    difference = sort(difference);
    %CIBootstrap(i,:) = prctile(difference,limits);
    stat = mean(X(i,:)) - mean(Y(i,:));
    if( stat < difference(limits(1)) || stat > difference(limits(2)) )
        result(i) = 1;
    end
end
disp(M - sum(result))
