function[vf,t] = freefall(vi,d)
    global g
    vf = abs(sqrt(vi*vi+2*g*d));
    t=(vf-vi)/g;
end