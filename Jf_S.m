function out = Jf_S(X, S)
% Input: X --> column vector containing variables x,y,z,d
% Input: S --> 4x4 array containing each satellite's coordinates and clock
%              time
% Output: out --> value of Jacobian of f evaluated at X (where definition 
%                 of f depends on the entries of S)

c = 299792.458; % speed of light in km/sec

% complete the function file

% eq 22
x= X(1);
y = X(2);
z = X(3);
d = X(4);

% output vector f(X)
out = zeros(4,4);

% Maybe one of the following 3 options is best inside of for loops:

for i = 1:4
    Ai = S(i, 1);
    Bi = S(i,2);
    Ci = S(i,3);
    ti = S(i, 4);

    denom = sqrt((x-Ai)^2 + (y-Bi)^2 + (z - Ci)^2);

    out(i,1) = (x-Ai)/denom; % partial derivative w/ respect to x
    out(i,2) = (y-Bi)/denom; % partial derivative w/ respect to y
    out(i,3) = (z-Ci)/denom; % partial derivative w/ respect to z
    out(i,4) = c;  % partial derivative w/ respect to d
end


end