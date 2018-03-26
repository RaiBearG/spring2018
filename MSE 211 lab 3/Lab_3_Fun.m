function [ f,g ] = Lab_3_Fun( X )
   
    x=X(1);
    y=X(2);
    a=x^2+y-11;
    b=x+y^2-7;
    f=a^2+b^2;
    [g] = Lab_3_Grad( X );
end