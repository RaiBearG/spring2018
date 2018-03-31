function [ vf,t,xf,yf ] = flat(vi,theta,l,x0,y0,mu)

  global mb Ib g rb

  vf = sqrt((0.5*mb*vi^2 + 0.5*Ib*(vi/rb)^2 - mu*mb*g*l*cos(theta) - mb*g*l*sin(theta))/(0.5*mb + 0.5*Ib/rb^2));
  xf = x0 + l*cos(theta);
  yf = y0 + l*sin(theta);
  t = abs((vf - vi)/g);

  %plot the segment on x vs y graph
  x=[x0 xf];
  y=[y0 yf];
  hold on
  plot(x,y,'b')

end
