clearvars
clc
close all

global r1 r2 r3 r4 theta2
r1=8;
r2=4;
r3=9;
r4=6;
theta2=pi/3;
%theta2 = 0:(pi/36):(2*pi);

%code for part 1
x = 0:0.01:(2*pi);
y = funct(x);
plot(x,y);
xlabel('Angle');
ylabel('Function x');
title('Function for theta2 = pi/3');

%code for part 2
%[ytheta4,theta4] = falsepos(4.08, 4.21, power(10,-6));
%theta3 = newangle(theta4);
%disp(theta4);
%disp(ytheta4);
%disp(theta3);

%code for part 3
%[ytheta4,theta4] = NewtRaph(0.9,power(10,-6));
%theta3 = newangle(theta4);
%disp(theta4);
%disp(ytheta4);
%disp(theta3);

%code for implementation 
%[ytheta4,theta4] = NewtRaph(0.9,power(10,-6));
%theta3 = newangle(theta4);
%plot(theta2, theta3);
%xlabel('Theta 2');
%ylabel("Theta 3");
%title('Theta 3 vs Theta 2 for Root 1');


