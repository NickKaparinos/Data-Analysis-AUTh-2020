% Data Analysis 2020
% Chapter 3 Excerise 1
% Poisson distribution most likely lambda
% Nick Kaparinos
clc;clear;

lambda = [1 5 10];
n = [10 50 100];
M = [10 50 100];
samples = zeros(n(1),1);
result = zeros(3,3,3);

% Part a 
for i = 1:n(1)
    samples(i) = poissrnd(lambda(2));
end
lambdaHat = mle(samples,'distribution','Poisson');
mu = mean(samples);
if( abs(mu - lambdaHat) < 0.0001 )
    disp('Mean of samples is equal to the most likely value of lambda');
end

% Part b
for k = 1:3
    for j = 1:3
        for i = 1:3
            means = partB(n(i), M(j), lambda(k));
            result(i,j,k) = mean(means);
            % Histogram
            figure(i*100 + j*10 + k)
            hist(means);
            title(getTitle(n(i), M(j), lambda(k)));
        end
    end
end
% Display result
disp(result)

function means = partB(n,M,lambda)
    means = zeros(M,1);
    samples = zeros(n,1);
    for i = 1:M
        for j = 1:n
            samples(j) = poissrnd(lambda);
        end
        means(i) = mean(samples);
    end
end

function title = getTitle(n, M, lambda)
    nStr = int2str(n);
    MStr = int2str(M);
    lambdaStr = int2str(lambda);
    title = 'n = ';
    title = strcat(title, nStr);
    title = strcat(title,' , M = ');
    title = strcat(title,MStr);
    title = strcat(title,' , lambda = ');
    title = strcat(title,lambdaStr);
end