% Data Analysis 2020
% Chapter 4 Excerise 3
% Error Propagation
% Nick Kaparinos
close all;
clc;
clear;

% B
mV = 77.78;
sV = 0.71;

mI = 1.21;
sI = 0.71;

mf = 0.283;
sf = 0.017;

M = 1000;
power = zeros(M,1);
sPower = zeros(M,1);
for i = 1:M
    V = normrnd(mV,sV);
    I = normrnd(mI,sI);
    f = normrnd(mf,sf);
    power(i) = V*I*cos(f);
    sPower(i) = sqrt( I*cos(f)*sV + V*cos(f)*sI - V*I*sin(f)*sf );
end

% C
powerC = zeros(M,1);
sPowerC = zeros(M,1);
for i = 1:M
    I = normrnd(mI,sI);
    sigma = [sV^2 0.5*sV*sf;0.5*sV*sf sf^2];
    VF = mvnrnd([mV mf],sigma,1);
    V = VF(1);
    f = VF(2);
    
    powerC(i) = V*I*cos(f);
    sPowerC(i) = sqrt( I*cos(f)*sV + V*cos(f)*sI - V*I*sin(f)*sf );
end
