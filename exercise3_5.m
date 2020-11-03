% Data Analysis 2020
% Chapter 3 Excerise 5
% Old Faithfull confidence intervals and normal distribution goodness of fit
% Nick Kaparinos
clc;
clear;

eruption = importdata("eruption.dat");
stdCI = zeros(3,2);
meanCI = zeros(3,2);
h = zeros(3,1);
p = zeros(3,1);

% Calculate confidence interval and goodness of fit
for i = 1:3
    data = eruption(:,i);
    [~,~,stdCI(i,:),~] = vartest(data,0);
    [~,~,meanCI(i,:),~] = ttest(data,0);
    [h(i),p(i)] = chi2gof(data);
end
stdCI = sqrt(stdCI);

% Test wikipedia hypothesis
correctMatrix = [true ; true];
for i = 1:length(eruption)
    if( eruption(i,2) < 2.5 )
        if( eruption(i,1) < 55 || eruption(i,1) > 75 )
            correctMatrix(1) = false;
        end
    else
        if( eruption(i,1) < 81 || eruption(i,1) > 101 )
            correctMatrix(2) = false;
        end
    end
end

