% Data Analysis 2020
% Chapter 2 Excerise 4
% Compare E[1/X] with 1/E[X] for different distributions and number of samples
% Nick Kaparinos
clc;
clear;
close all;

n = [10 100 1000 10000 10000 10000 100000];
data = zeros(3,n(end));
results = zeros(length(n),2,3);

% Generate Data
for i=1:n(end)
    data(1,i) = unifrnd(1,2); 
    data(2,i) = unifrnd(0,1); 
    data(3,i) = unifrnd(-1,1); 
end

% Calculate results 
for j = 1:3
    for i=1:length(n)
        results(i,1,j) =  mean( data(j,1:n(i)).^(-1) );
        results(i,2,j) =  1/mean( data(j,1:n(i)) );
    end
end

% Graph results
for i = 1:3
    figure(i)
    bar(results(:,:,i));
    message = 'Distribution number  ';
    message = strcat(message,int2str(i));
    title(strcat(message,' results'));
end
