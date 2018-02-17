function [ theta ] = newangle( theta4 )
    global r1 r2 r3 r4 theta2
    a = r1-(r2*cos(theta2));
    b = (-1)*r2*sin(theta2);
    k = (a+(r4*cos(theta4)))/r3;
    l = (b+(r4*sin(theta4)))/r3;
    theta = atan2(l,k);

end