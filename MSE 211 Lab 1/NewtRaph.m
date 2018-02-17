function [ fx,xr ] = NewtRaph( x0, err ) 
    iter = 0;
    xold = x0;
    x = x0;
    while iter<100
        iter = iter+1;
        fx = funct(x);
        dfx = dfunct(x);
        x = x-(fx/dfx);

        ea = abs((x-xold)/x)*100;
        if ea < err
            xr=x;
            break;
        end
        xold = x;
    end
end