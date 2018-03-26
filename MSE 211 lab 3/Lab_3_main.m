clearvars
clc
close all

%plottong the finction 

x=-7:0.1:7;
[x1 ,y1] = meshgrid(x);
for i=1:length(x)
    for j=1:length(x)
        X=[x1(i,j);y1(i,j)];
        z(i,j)=Lab_3_Fun(X);
    end
end

surf(x1,y1,z);
shading interp;



%Fastest descent method
%{
tolerence=10^(-4);
x0=[0;0];
x01=[-1;0];
x02=[-4;-2];
x03=[4;-2];
[X, f, k, Err] = Lab_3_sdm(x03,tolerence);
figure
contour(x1,y1,z,100)
hold on;
plot(X(1,:), X(2,:),'-k+')

disp(k);
disp(X);
disp(f);
disp(Err);
%}

%Newton Method
%{
tolerence=10^(-4);
x0=[0;0];
x01=[-5;4];
x02=[-4;-4];
x03=[4;-4];
[X, f, k, Err] = Lab_3_Newton(x0,tolerence);
figure
contour(x1,y1,z,100)
hold on;
plot(X(1,:), X(2,:),'-k+')

disp(k);
disp(X);
disp(f);
disp(Err);
%}

%Matlab Function Method (fminunc)
%{
x0=[5;2];
x01=[-5;4];
x02=[-4;-4];
x03=[4;-4];
options = optimoptions('fminunc','GradObj','on','Algorithm','trust-region');
[X,FVAL,EXITFLAG,OUTPUT] = fminunc(@Lab_3_Fun,x0,options);
figure
contour(x1,y1,z,100)
hold on;
plot(X(1,:), X(2,:),'-k+')

disp(X);
disp(FVAL);
disp(EXITFLAG);
disp(OUTPUT);
%}


%Matlab Function Method (fmincon)
%{
x0=[0;0];
x01=[-1;0];
x02=[-4;-2];
x03=[4;-2];
options = optimoptions('fmincon','GradObj','on','display','iter');
A=[-2 1];
b=0;
Aeq=[];
beq=[];
lb=[0 -2];
ub=[4 3];
nonlcon=[];
[X,FVAL,EXITFLAG,OUTPUT] = fmincon(@Lab_3_Fun,x01,A,b,Aeq,beq,lb,ub,nonlcon,options);
figure
contour(x1,y1,z,100)
hold on;
plot(X(1,:), X(2,:),'-k+')

disp(X);
disp(FVAL);
disp(EXITFLAG);
disp(OUTPUT); 
%}
