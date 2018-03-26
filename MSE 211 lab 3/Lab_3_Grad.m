function [ Grad ] = Lab_3_Grad( X )

    x=X(1);
    y=X(2);
    dx=2*x + 4*x*(x^2 + y - 11) + 2*y^2 - 14;
    dy=2*y + 4*y*(y^2 + x - 7) + 2*x^2 - 22;
    
    Grad=[dx;dy];
 
end