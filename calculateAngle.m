function angleAtX = calculateAngle(yz,xz,xy)
%CALCULATEANGLE Summary of this function goes here
angleAtX = acos((xy^2 + xz^2 - yz^2)/(2*xy*xz));
end

