clear 
clc
close all

M = load('1-1-05v.mat');
NM = load('1-2-0.5V.mat');

A=0.5;


%find the final steady state velocity using last 10 values 
l=length(M.exp1);
sumM=0;
sumNM=0;
for c=l-9:l
    sumM = sumM + M.exp1(2,c);
    sumNM = sumNM + NM.exp1(2,c);

end
YssM = sumM/10;
YssNM = sumNM/10;


%find the .63 percent time of final val
xM = 0.63*YssM;
xNM = 0.63*YssNM;
n=1;
while M.exp1(2,n)<xM
    n = n+1;
end
tM = M.exp1(1,n)-0.5;

n=1;
while NM.exp1(2,n)<xNM
    n = n+1;
end
tNM = NM.exp1(1,n)-0.5;


% Calculate the Kv value
KvM = YssM/A;
KvNM = YssNM/A;


% Calculate tao
taoM = (-1*tM)/(log(1-(xM/(A*KvM))));
taoNM = (-1*tNM)/(log(1-(xNM/(A*KvNM))));

% new array in exp1 to calculate and save the calculated data 
for i=5000:l
    M.exp1(3,i) = A*KvM*(1-exp((-1*(M.exp1(1,i)-0.5)/taoM)));
    NM.exp1(3,i) = A*KvNM*(1-exp((-1*(NM.exp1(1,i)-0.5)/taoNM)));
end

%plot the experimental vs calculated graphs
f1 = figure;
plot(M.exp1(1,5000:end), M.exp1(2,5000:end),'b', M.exp1(1,5000:end), M.exp1(3,5000:end),'r',M.exp1(1,5000:end), NM.exp1(2,5000:end),'k', M.exp1(1,5000:end), NM.exp1(3,5000:end),'c');
legend('Mass Exp.', 'Mass Theor.','No Mass Exp.', 'No Mass Theor.', 'location', 'southeast');
title('1.5 V Motor Velocity Mass vs No Mass');
xlabel('Time (S)');
ylabel('Velocity (m/s)');
%saveas(f1,'1.2.1.5v.jpg');