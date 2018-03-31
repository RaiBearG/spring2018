function [F] = wallImpulse(vi)
    global mb

    t = 0.05; % impact time
    F = mb*vi/t;
end

