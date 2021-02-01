% Data Analysis 2020
% Chapter 5 Excerise 7
% Polynomial regression
% Nick Kaparinos
close all;
clc;
clear;

data = importdata("data5_7.txt");
X = data(:,2);
Y = data(:,3);

X = log(X);
Y = (Y + 273).^-1;

% Scatterplot
figure(100);
scatter(X,Y);
xlabel("ln(R)");
ylabel("1/T");

% A
k = 4;
R2 = zeros(k+1,1);
AdjustedR2 = zeros(k+1,1);
maxAdjR2 = zeros(2,1);

% R2 and adjusted R2
Rsq = @(ypred,y) 1-sum((ypred-y).^2)/sum((y-mean(y)).^2);
adjRsq = @(ypred,y,n,k) ( 1 - (n-1)/(n-1-k)*sum((ypred-y).^2)/sum((y-mean(y)).^2) );
rmse = @(residuals, n, dof) ( sqrt( 1/(n-dof) * sum(residuals.^2) ));


for i = 1:k
    % Polynomial regression
    b = polyfit(X,Y,i);
    Ypred = polyval(b,X);
    
    % Calculate R2 and find the max
    R2(i) = Rsq(Ypred,Y);
    AdjustedR2(i) = adjRsq(Ypred,Y,length(Y),i);
    if(AdjustedR2(i) > maxAdjR2(1))
        maxAdjR2(1) = AdjustedR2(i);
        maxAdjR2(2) = i;
    end
    
    % Plot Regression
    figure(2*i);
    scatter(X,Y);
    hold on;
    plot(X,Ypred);
    title("Data and regression, k =  " + i);
    xlabel("ln(R)");
    ylabel("1/T");
    
    % Diagnostic plot
    residuals = Y - Ypred;
    se = sqrt( 1/(length(X)-k-1) * (sum(residuals.^2)));
    figure(2*i+1)
    scatter(Y,residuals./se);
    hold on;
    plot(Y,repmat(2,1,length(Y)));
    plot(Y,zeros(1,length(Y)));
    plot(Y,repmat(-2,1,length(Y)));
    title("Diagnostic plot, k = " + i);
    xlabel("1/T");
    ylabel("Standardised Error");

end

% Steinhart-Hart
k = 2;
Xinput = [ones(length(X),1) X X.^3];
fetModel = fitlm(Xinput,Y);
b = regress(Y,Xinput);
Ypred = Xinput*b;

fetRmse = rmse(fetModel.Residuals.Raw, length(X),3);

R2(i+1) = Rsq(Ypred,Y)
AdjustedR2(i+1) = adjRsq(Ypred,Y,length(Y),3)

% Plot Regression
figure(2*(i+1));
scatter(X,Ypred);
hold on;
plot(X,Ypred);
title("Data and Steinhart-Hart regression");
xlabel("ln(R)");
ylabel("1/T");

% Diagnostic plot
residuals = Y - Ypred;
se = sqrt( 1/(length(X)-1) * (sum(residuals.^2)));
figure(2*(i+1)+1)
fet2 = residuals./fetModel.RMSE;
scatter(Y,residuals./se);
hold on;
plot(Y,repmat(2,1,length(Y)));
plot(Y,zeros(1,length(Y)));
plot(Y,repmat(-2,1,length(Y)));
title("Diagnostic plot, Steinhart-Hart");
xlabel("1/T");
ylabel("Standardised Error");

if( maxAdjR2 > AdjustedR2(end) )
    disp("Polynomial regression is better");
end
