% rotation.m handles the rotaton of the spinning element with the ball inside it. This function follows coam.m
% because coam.m gives the initial conditions for this function. Since the force and moment direction and 
% magnitudes change during the rotation, the entire rotation perios is split into 1000 steps and analyzed 
% that way. The ball and rotating element are assumed to rate from theta = 3pi/4 to -pi/4 up that, the ball 
% freefalls towards the curved section. 
% input arguments : w0 = initial anglular velocity, x0 & y0 = initial x and y positions
% output arguments : vf = final velocity (assumed in -y direction) , xf yf = final x and y positions
function [vf,t,xf,yf,al] = rotation(w0,x0,y0)
    global mb g Ib rb time f1 f2 f3;
    
    Ibar = 0.0128*mb/3 + 0.0032*mb; % moment of inertia of the rotating element
    Itot = Ibar + Ib + 2*mb*rb^2; % calculate moment of inertia around rotating axis 
    R = sqrt(2*rb^2); % distance of ball CG from rotating axis 
    itter=1;
    for i=(pi/2+5*pi/1000)-(pi/1000):-pi/1000:-pi/4 % for loop with step size of -pi/1000
        alpha = R*cos(i)*mb*g/Itot; % calculating alpha from the moment created by the ball
       
        if i == pi/2
            alpha = 0.0458;
        end
        a = alpha*R + (w0^2)*R; % calclating the acceleration tangential and normal
        Q = [0.5*alpha w0 pi/1000]; % making a column matrix to calculate time 
        Poly = roots(Q); % using the matlab root function to find root 
        

        % getting rid of the unwanted root 
        if Poly(1)>0
            dt = Poly(1);
        elseif Poly(2)>0
            dt = Poly(2);
        else
                dt=0;
        end
            
        
        wf = w0 +alpha*dt; % Calculating the new omega value
        vf = wf*R; % and the correspondant tangential velocity
        xf = x0 + R*cos(i) - R*cos(i+(pi/1000)); % calculating the new x position 
        yf = y0 + R*sin(i) - R*sin(i+(pi/1000)); % calculating the new y position 
        
        % plot figure 1, x vs y graph
        figure(f1)
        hold on;
        x=[x0 xf];
        y=[y0 yf];
        plot(x,y,'b')
        
        w0 = wf;
        time = time + dt;
        t(itter) = dt;
        %w(itter) = wf;
        al(itter) = alpha;
        itter = itter+1;
        x0 = xf;
        y0 = yf;
    end
end
