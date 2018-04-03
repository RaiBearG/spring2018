% flat.m is used to analyse the ball through a straight line motion 
% input of function are vi = initial velocity, theta = angle of the line, l = length of the line
% x0 and y0 = initial points and mu = coefficient of friction
% output of function are vf = final velocity , t = time of travel, xf and yf = final points

function [ vf,xf,yf ] = flat(vi,theta,l,x0,y0,mu)

    global mb Ib g rb time f1 f2 f3
    
    temp = (0.5*mb*vi^2 + 0.5*Ib*(vi/rb)^2 - mu*mb*g*l*cos(theta) - mb*g*l*sin(theta));
    vf = sqrt(temp/(0.5*mb + 0.5*Ib/rb^2)); % calculating final velocity
    xf = x0 + l*cos(theta); % calculating final x and y spots 
    yf = y0 + l*sin(theta);
    a = g*sin(theta) - mu*g*cos(theta); % calculating the acceleration 
    t = abs((vf - vi)/a); % time elapsed for the movement
    
    
    % plot figure 1, x vs y graph
    figure(f1)
    x=[x0 xf];
    y=[y0 yf];
    plot(x,y,'b')
    
    % plot x, y, v, a, vs t graph 
    figure(f2)
    deltat = [time t];
    velocity = [vi vf];
    acceleration = [a a];
    plot(deltat, x, deltat, y, deltat, velocity, deltat, acceleration);
    
    % since the straight elements don't rotate, there is no anglular velocity or acceleration 
    
    time = time+t; % adding to the accumulative time 
end

