function[tfinal, xfinal,vfinal] = eulerlaminar(ti, tf, h, xi, vi)
    itter = 1;
    t=ti;
    while t <= tf
        xf = xi + h*vi;
        vf = vi + h*laminar(t, xi, vi);
        t = t+h;
        
        xfinal(itter) = xf;
        vfinal(itter) = vf;
        tfinal(itter) = t;
        
        xi = xf;
        vi = vf;
        
        itter = itter+1;
    end
end
        
        