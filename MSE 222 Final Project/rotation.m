% rotation.m handles the rotaton of the spinning element with the ball inside it. This function follows coam.m
% because coam.m gives the initial conditions for this function. Since the force and moment direction and 
% magnitudes change during the rotation, the entire rotation perios is split into 1000 steps and analyzed 
% that way. The ball and rotating element are assumed to rate from theta = 3pi/4 to -pi/4 up that, the ball 
% freefalls towards the curved section. 
% input arguments : w0 = initial anglular velocity, x0 & y0 = initial x and y positions
% output arguments : vf = final velocity (assumed in -y direction) , xf yf = final x and y positions
function [vf,xf,yf] = rotation(w0,x0,y0)
    global mb g Ib rb time f1 f2 f3;
    
    Ibar = 0.0128*mb/3 + 0.0032*mb; % moment of inertia of the rotating element
    Itot = Ibar + Ib + 2*mb*rb^2; % calculate moment of inertia around rotating axis 
    R = sqrt(2*rb^2); % distance of ball CG from rotating axis 
    
    %calculating the initial velocities in the x and y direciton for plotting
    vix = w0*R*cos(3*pi/4);
    viy = w0*R*sin(3*pi/4);
    
    for i=(3*pi/4)-(pi/1000):-pi/1000:-pi/4 % for loop with step size of -pi/1000
        alpha = R*cos(i)*mb*g/Itot; % calculating alpha from the moment created by the ball
       
        %compensating for the time bug when i = pi/2
        if i == pi/2
            alpha = 0.0458;
        end
        
        a = alpha*R + (w0^2)*R; % calclating the acceleration tangential and normal
        Q = [0.5*alpha w0 pi/1000]; % making a column matrix to calculate time 
        Poly = roots(Q); % using the matlab root function to find root 
        
        t1 = abs(Poly(1));% preparing for the 2 roots for comparison
        t2 = abs(Poly(2));

        % getting rid of the unwanted root 
        if t1>0 && t1<0.05
            dt = t1;
        elseif t2>0 && t2<0.05
            dt = t2;
        else
                dt=0;
        end
            
        
        wf = w0 +alpha*dt; % Calculating the new omega value
        vf = wf*R; % and the correspondant tangential velocity
        xf = x0 + R*cos(i) - R*cos(i+(pi/1000)); % calculating the new x position 
        yf = y0 + R*sin(i) - R*sin(i+(pi/1000)); % calculating the new y position 
        
        % calculating the velocity components in x and y direction
        thetavel = i-pi/2;
        vfx = vf*cos(thetavel);
        vfy = vf*sin(thetavel);
        
        % plot figure 1, x vs y graph
        figure(f1)
        hold on;
        x=[x0 xf];
        y=[y0 yf];
        plot(x,y,'b')
        
        % plot x, y, v, a, vs t graph 
        figure(f2)
        hold on;
        deltat = [time time+dt];
        velx = [vix vfx];
        vely = [viy vfy];
        acceleration = [a a];
        plot(deltat, x, 'b',deltat, y,'g', deltat, velx, 'r', deltat, vely, 'y', deltat, acceleration, 'k');
        
        %plot W and alpha vs t graph
        figure(f3)
        hold on;
        dw = [w0 wf];
        dalpha = [alpha alpha];
        plot(deltat, dw, 'b', deltat, dalpha, 'g');
        
        % reset the new data as old for the next ittiration 
        w0 = wf;
        time = time + dt;% update the total time 
        x0 = xf;
        y0 = yf;
        vix = vfx;
        viy = vfy;
    end
end
