function [ w,Vbf,vbar ] = coam( Vbi,e )
global mb rb;
Ibar = 0.0128*mb/3 + 0.0032*mb;
Vbf = (mb*rb*Vbi)/(rb*mb + Ibar/rb);
vbar = Vbf;
w = vbar/rb;

end

