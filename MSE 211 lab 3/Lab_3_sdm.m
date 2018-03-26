function [ X,f,k,Err ] = Lab_3_sdm( x,tol )
    
    k=0;
    d=1;
    X=x;
    f(1)=Lab_3_Fun(X);
    Err=NaN;
    while d>tol
        G=Lab_3_Grad(x);
        H=Lab_3_Hess(x);
        h=abs((G.'*G)/(G.'*H*G));
        xnew= x-G*h;
        X=[X xnew];
        k=k+1;
        d=norm(xnew-x);
        Err= [Err d];
        x=xnew;
        f(k+1)=Lab_3_Fun(x);
    end
end