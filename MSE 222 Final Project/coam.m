% coam.m function analyzes the part when the ball hits the rotating element. This function uses conservation
% momentum to find the velocity and omega of the rotating element after the ball has hit it. 
% input arguments : Vbi = initial velocity of the ball. on our board the element before this part is a flat
% road therefor Vbi is assumed to be in the x direction 
% output arguments w = omega of the element and the ball, Vbf is the tangential velocity of the ball and element
function [ w,Vbf ] = coam( Vbi )
    
    global mb rb time;
    
    Ibar = 0.0128*mb/3 + 0.0032*mb; % moment of inertia of the rotating element
    
    Vbf = (mb*rb*Vbi)/(rb*mb + Ibar/rb); % conservation of momentum to find the velocity after impact
    
    vbar = Vbf; % the coefficient of rustitution is assumed to be zero because the ball and the rotating
                % element are moving together after they impact. Hence vbar = Vbf
    
    w = vbar/rb;% angular velocity of the ball and rotating element together 
    
    time = time + 0.05; % time for this movement is assumed 0.05 seconds 
    
    % no plotting for this function as the movement is unsubstential 

end

