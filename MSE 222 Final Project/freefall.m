% freefall.m is used to analyse the ball when its falling down  
% the assumption made for this project is that the ball is falling straight down 
% input of function are vi = initial velocity, d= distance it falls for 
% x0 and y0 = initial points 
% output of function are vf = final velocity ,xf and yf = final points

function[vf, xf, yf] = freefall(vi, d, x0, y0)
    
    global g time f1 f2
    
    vf = -sqrt(abs(vi*vi+2*g*d)); %since ball is assumed to always go down in freefall, used absolute value 
                                  % to avoid a -ve inside the square root
    t=abs((vf-vi)/g); % time elapsed suring the motion 
    xf = x0; % assumed no horizontal acceleration therefor final x position is same as initial 
    yf = y0+vi*t - 0.5*g*t*t;% calculating the final point where the ball ends 
    
    % calculating the x and y velocity components 
    vix = 0;
    viy = vi;
    vfx = 0;
    vfy = vf;
    
     % plot figure 1, x vs y graph
    figure(f1)
    hold on;
    x=[x0 xf];
    y=[y0 yf];
    plot(x,y,'b')
    
    % plot x, y, v, a, vs t graph 
    figure(f2)
    hold on;
    deltat = [time t];
    velx = [vix vfx];
    vely = [viy vfy];
    acceleration = [g g];
    plot(deltat, x, 'b',deltat, y,'g', deltat, velx, 'r', deltat, vely, 'y', deltat, acceleration, 'k');    
    
    % since the straight elements don't rotate, there is no anglular velocity or acceleration 
    
    time = time+t; % adding to the accumulative time 
    
end
