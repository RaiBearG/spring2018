function [ vf,t,xf,yf ] = flat(vi,theta,l,x0,y0,mu)

vf = sqrt((mb*vi^2 + Ib*(vi/rb)^2 - 2*mu*mb*g*l)/(mb + Ib/rb^2));
xf = x0 + l*cos(theta);
yf = y0 + l*sin(theta);
t = (vf - vi)/g;

end

