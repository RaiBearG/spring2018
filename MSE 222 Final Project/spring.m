% spring.m handles the initial launch of the system. The ball is not in contact with the spring
% before it is launched. 
%input argument : x = retraction of the spring in meters
%putput arguments : vf = final velocity of the ball (since horizontal element after this, the velocity in x
function [vf] = spring(x)
    
    global mb time

    k = 440; % K value of spring (
    
    t = 0.05; % impact time assumption for the entire project 
    
    F = k*x*x;% force of the impact
    
    vf = F*t/mb; % velocity of the ball after the impact
    
    time = time+t;
    
    % since this is the initiating point, no plotting needed 
    
end
