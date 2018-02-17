function [ fx ] = funct( x )
    global r1 r2 r3 r4 theta2
    a = r1-(r2*cos(theta2));
    b = (-1)*r2*sin(theta2);
    c = (power(r3,2)-power(a,2)-power(b,2)-power(r4,2))/(2*r4);
    fx = a*cos(x)+b*sin(x)-c; 

end