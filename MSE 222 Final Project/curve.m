function [ vf,t,xf,yf ] = curve( v0,x0,y0,thetai,thetaf )
global g;
h=-pi/1000;
for i=thetai+h:h:thetaf
    a = g*cos(i);
    Q = [0.5*a v0 pi/1000];
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
    vf = v0 + a*dt;
    xf = x0 + R*cos(i) - Rcos(i+(pi/1000));
    yf = y0 + R*sin(i) - Rsin(i+(pi/1000));
    time = time + dt;
    %Plot v,a,x,y
    
    
    v0 = vf;
    x0 = xf;
    y0 = yf;
end

end

