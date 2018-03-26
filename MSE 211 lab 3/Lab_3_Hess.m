function [ Hes ] = Lab_3_Hess( X )

    x=X(1);
    y=X(2);
    ddx=12*x^2 + 4*y - 42;
    dxdy=4*x + 4*y;
    ddy=12*y^2 + 4*x - 26;
    Hes=[ddx,dxdy;dxdy,ddy];
    
end