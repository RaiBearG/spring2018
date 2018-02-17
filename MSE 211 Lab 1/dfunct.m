function [ fx ] = dfunct( x )
    global r1 r2 theta2
    a = r1-(r2*cos(theta2));
    b = (-1)*r2*sin(theta2);
    fx = b*cos(x)-a*sin(x); 
end