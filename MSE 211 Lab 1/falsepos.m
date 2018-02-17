function [ fxr,xr ] = falsepos( xL,xU,err )
    iter = 0;
    
    while 1
        
        fL = funct(xL);
        
        fU = funct(xU);
        
        
        iter = iter + 1;
 
        xr = xU - fU * (xL - xU)/(fL - fU);
        
        fxr = funct(xr);
        
        if iter > 1
            
            ea = abs((xr- xold) /xr) * 100;
            if ea > err
                
                break;
            end % ea > err
            
        end % if iter > 1
        
        if (fL*fxr) < 0
            xU = xr;
        
        elseif (fL * fxr) > 0
                xL = xr;
        end % if f(xL) * f(xr) > 0
        
        xold = xr;
 
    end
end