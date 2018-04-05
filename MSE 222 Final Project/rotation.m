function [vf,t,xf,yf] = rotation(w0,x0,y0)
    global mb g Ib rb Ibar time;
    Itot = Ibar + Ib + 2*mb*rb^2;
    R = sqrt(2*rb^2);
    for i=(3*pi/4)-(pi/1000):-pi/1000:-pi/4
        alpha = R*cos(i)*mb*g/Itot;
        a = alpha*r + (w0^2)*R;
        Q = [0.5*alpha w0 pi/1000];
        Poly = roots(Q);
        if Poly(1)>0
            dt = Poly(1);
        else
        if Poly(2)>0
            dt = Poly(2);
        else
            dt=0;
        end
        end
        wf = w0 +alpha*dt;
        vf = wf*R;
        xf = x0 + R*cos(i) - Rcos(i+(pi/1000));
        yf = y0 + R*sin(i) - Rsin(i+(pi/1000));
        time = time + dt;
        %Plotting the w,alpha,a,v,x,y
        
        w0 = wf;
        x0 = xf;
        y0 = yf;
    end
end
