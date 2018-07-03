clear 
clc
close all

A = load('1-3-0.5V.mat');
B = load('1-4.mat');



%plot the experimental vs calculated graphs
f1 = figure;
plot(A.exp1(1,:), A.exp1(2,:),'b', B.exp1(1,:), B.exp1(2,:),'r');
legend('1-3', '1-4', 'location', 'northeast');
title('Experimental Results for 1-3 & 1-4');
xlabel('Time (S)');
ylabel('Velocity (m/s)');
saveas(f1,'1.34.all.jpg');
