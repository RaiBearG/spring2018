function [vf] = spring(x)
    global mb

    k = 440; % K value of spring 
    t = 0.05; % impact time
    F = k*x*x;
    vf = F*t/mb;
end