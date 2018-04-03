% main.m function runs all the subroutines 
% and manages all the elemental analysis using those functions

clear vars force
clc
close all

% declaring global variables and assigning values
global mb Ib g rb time f1 f2 f3
mb = 0.02; % mass of ball 
g=9.81; % gravitational acceleration 
rb=0.015; % raduis of the ball
Ib = mb*rb*rb; % moment of inertia of the ball
time = 0;

%declaring all the figures
f1=figure(); % graph for X vs Y 
f2=figure(); % graph for X, Y, V(velocity), A(acceleration) vs T
f3=figure(); % graph for W(omega) and a (alpha) vs T

% setting up the x an dy y boundaries of the graph. Converted to meter from inch 
figure(f1); 
plot(0,0)
hold on;
xlim([0 0.31])
ylim([0 0.31])