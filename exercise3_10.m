% Data Analysis 2020
% Chapter 3 Excerise 10
% Random permutation hypothesis test
% Nick Kaparinos
clc;
clear;

M = 10000;
n = 10;
m = 12;
B = 1000;
a = 0.05;
X = normrnd(0,1,[M n]);
Y = normrnd(0,1,[M m]);

lowerLim = (B+1)*a/2;
upperLim = B+1-lowerLim;
limits = [lowerLim upperLim];

% A
CIBootstrap = zeros(M,2);
result = zeros(M,1);
for i = 1:M
    % Random permutation test
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
    stat = mean(X(i,:)) - mean(Y(i,:));
    difference = [difference; stat];
    difference = sort(difference);
    
    rankStat = find(difference == stat);
    if( length(rankStat) > 1)
        L = length(rankStat);
        sample = randsample(L,1);
        rankStat = rankStat(sample);
    end
    
    if( rankStat < limits(1) || rankStat > limits(2) )
        result(i) = 1;
    end
    
    if rankStat > 0.5*(B+1)
        pd = 2*(1-rankStat/(B+1));
    else
        pd = 2*rankStat/(B+1);
    end
    
end
disp(sum(result)/M)
