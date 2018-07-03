clear 
clc
close all

S = load('1-1-1.5V.mat');

A=1.5;


%find the final steady state velocity using last 10 values 
l=length(S.exp1);
sum=0;
for c=l-9:l
    sum = sum + S.exp1(2,c);
end
Yss = sum/10;


%find the .63 percent time of final val
x = 0.63*Yss;
n=1;
while S.exp1(2,n)<x
    n = n+1;
end
t = S.exp1(1,n)-0.5;


% Calculate the Kv value
Kv = Yss/A;


% Calculate tao
tao = (-1*t)/(log(1-(x/(A*Kv))));

% new array in exp1 to calculate and save the calculated data 
for i=5000:l
    S.exp1(3,i) = A*Kv*(1-exp((-1*(S.exp1(1,i)-0.5)/tao)));
end

%plot the experimental vs calculated graphs
f1 = figure;
plot(S.exp1(1,5000:end), S.exp1(2,5000:end),'b', S.exp1(1,5000:end), S.exp1(3,5000:end),'r');
legend('Experimental', 'Theoretical', 'location', 'southeast');
title('1.5 V Motor Velocity Experimental VS Theoretical');
xlabel('Time (S)');
ylabel('Velocity (m/s)');
saveas(f1,'1.1.1.5v.jpg');
