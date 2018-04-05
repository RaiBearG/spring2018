% curve.m handles the motion of the ball through a curved path 
% the entire rotation perios is split into 1000 steps and analyzed 
% that way. The ball and rotating element are assumed to rate from theta = 0 to -pi  
% input arguments : v0 = initial velocity, x0 & y0 = initial x and y positions
% output arguments : vf = final velocity (assumed in +y direction) , xf yf = final x and y positions
function [ vf,xf,yf ] = curve( v0,x0,y0,thetai,thetaf )
    global g rb time f1 f2;
    
    h=-pi/1000;% step size for a half circle translation 
    
    R = 0.0889/2-rb;% calculating the radius of the CG of ball from venter point
    
    %calculating the initial velocities in the x and y direciton for plotting
    vix = v0*cos(thetai-pi/2);
    viy = v0*sin(thetai-pi/2);
    
    for i=thetai+h:h:thetaf 
        a = g*cos(i); % calculating acceleration
        
        Q = [0.5*a v0 pi/1000];
        Poly = roots(Q);%making a colum matrix to calculate time
        
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
        
        vf = v0 + a*dt; % calculating velocity
        xf = x0 + R*cos(i) - R*cos(i+(pi/1000)); %caluclting the end coordinates in x and y
        yf = y0 + R*sin(i) - R*sin(i+(pi/1000));
        
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
        
        % since there is no moving element, there is no omega or alpha plot for this section 
        
        % reset the new data as old for the next ittiration 
        time = time+dt;
        v0 = vf;
        x0 = xf;
        y0 = yf;
        vix = vfx;
        viy = vfy;
    end

end

