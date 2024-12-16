function [l_sub, u_diag, u_super] = tri_LU_efficient(a_diag, a_sub, a_super)
% Let A be a tridiagonal matrix
% a_diag is the diagonal of A
% a_sub is the first sub-diagonal of A
% a_super is the first super-diagonal of A

% If A = LU is the LU factorization, then
% l_sub is the first sub-diagonal of L
% u_diag is the diagonal of U
% u_super is the first super-diagonal of U
n = length(a_diag); % one entry in each row

l_sub = zeros(n-1, 1); % starts one row late
u_diag = zeros(n,1);
u_super = zeros(n-1, 1); % ends one row late

u_diag(1,1) = a_diag(1,1);
u_super(1,1) = a_super(1,1); % for tridiag will be same for any n

for i = 2: n-1

l_sub(i-1) = a_sub(i-1)/u_diag(i-1); % ex. l_sub(1,1) = a_sub(1,1)/u_diag(1,1)
u_diag(i) = a_diag(i) - l_sub(i-1)*u_super(i-1);  % ex. u_diag(1,2) = a_diag(1,2) - l_sub(1,1)*u_super(1,1);
u_super(i)= a_super(i);

end

% last row 
l_sub(end) = a_sub(end)/u_diag(end-1);
u_diag(end) = a_diag(end) - l_sub(end)*u_super(end);

end