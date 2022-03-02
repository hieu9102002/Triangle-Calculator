function oneTriangle(triangleVector)
%ONETRIANGLE Summary of this function goes here
%   Detailed explanation goes here
%% Data loading
%get point coordinates
ABC = mat2cell(triangleVector,1, [2 2 2]);
A = cell2mat(ABC(1));
B = cell2mat(ABC(2));
C = cell2mat(ABC(3));

%% Calculations
%get side lengths
AB = calculateDistance(A, B);
BC = calculateDistance(B, C);
CA = calculateDistance(C, A);

%get angles at point
AAngle = calculateAngle(BC,AB,CA);
BAngle = calculateAngle(CA,BC,AB);
CAngle = calculateAngle(AB,BC,CA);

%perimeter
Perimeter = AB + BC + CA;
p = Perimeter/2;
Area = sqrt(p*(p-AB)*(p-BC)*(p-CA));
%% Check for angle descriptions
angleDescription = "";

if (AAngle > pi/2 || BAngle > pi/2 || CAngle > pi/2)
    angleDescription = "Obtuse";
elseif (AAngle == pi/2 || BAngle == pi/2 || CAngle == pi/2)
    angleDescription = "Right";
else
    angleDescription = "Acute";
end

%% Check for length descriptions
lengthDescription = "";

%check equilateral
if (AB == BC && BC == CA)
    strcat(lengthDescription,"equilateral ");
end

%check isoceles
if (AB == BC || AB == CA || BC == CA)
    lengthDescription = strcat(lengthDescription,"isoceles ");
end

%check degenerate
if (AB + BC == CA || AB + CA == BC || BC + CA == AB)
    lengthDescription = strcat(lengthDescription, "degenerate ");
end

%check scalene
if (lengthDescription == "")
    lengthDescription = strcat(lengthDescription, "scalene ");
end
%% Output
%Flattening the vector into strings for display
a=sprintf('(%d, %d)', A);
b=sprintf('(%d, %d)', B);
c=sprintf('(%d, %d)', C);

fprintf("A = %s\n", a);
fprintf("B = %s\n", b);
fprintf("C = %s\n", c);

fprintf("AB = %.2f\n", AB);
fprintf("BC = %.2f\n", BC);
fprintf("CA = %.2f\n", CA);

fprintf(strcat(angleDescription, " ", lengthDescription, "triangle\n"));

fprintf("Perimeter = %.2f\n", Perimeter);
fprintf("Area = %.2f\n", Area);
%% Plot
%plot triangle
drawTriangle(A,B,C);
end

