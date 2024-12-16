function x = sherman_morrison_solve(L,U,P,u,v,b)
% inputs to the function
% L, U, P are the LU factors of some n x n matrix A
% u, v are n x 1 column vectors
% b is a right-hand side vector (also n x 1)

% output
% x is the solution to (A - uv^T)x = b

% to solve Ax = b we use
% LUx = Pb
% Ly = Pb, Ux = y

% solve Ax1 = b (so x1 = A−1b)
y1 = L\(P*b); % forward sub for y
x1 = U\y1; % backward sub for x

% solve Ax2 = u (so x2 = A−1u)
y2 = L\(P*u); % forward sub for y
x2 = U\y2; % backward sub for x

% Compute α = 1 − v^T x2
alpha = 1- ((v')*x2);

% Compute β = v^T x1
Beta = (v') *x1;

% Compute the solution as x = x1 + β/α * x2
x = x1 + ((Beta/alpha) * x2) ;

end