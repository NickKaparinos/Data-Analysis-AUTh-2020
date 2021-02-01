% Data Analysis 2020
% Chapter 4 Excerise 2
% Simple Error Propagation
% Nick Kaparinos
close all;
clc;
clear;

% A
sx = 5;
X1 = 500;
X2 = 300;
sy = sqrt( (X1+X2)^2*sx^2 );

% B
n = 1000;
X1 = 1:1:n;
X2 = 1:1:n;
grid = zeros(n);
for i = 1:n
    for j = 1:n
        grid(i,j) = sqrt( X1(i)^2*sx^2 + X2(j)^2*sx^2 );
    end
end

% Surface
surf(X1,X2,grid);