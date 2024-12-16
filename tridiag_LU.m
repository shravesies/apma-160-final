function [L,U] = tridiag_LU(A)
    % A is a square tridiagonal matrix
    % L and U are the matrices arising from A = LU factorization

[n, ~] = size(A); % it's a square so only need one dimension

    % Edit below to define the function
    L = eye(n);
    U = zeros(n);

U(1,1) = A(1,1);
U(1,2) = A(1,2); % for tridiag will be same for any n

for i = 2: n-1
    L(i,i-1) = A(i,i-1)/U(i-1,i-1); % ex. when i =2 L(2,1) = A(2,1)/U(1,1)
    U(i,i) = A(i,i) - L(i, i-1)*U(i-1,i); % ex. U(2,2) = A(2,2)  - L(2,1)/U(1,2)
    U(i, i+1) = A(i, i+1); %ex. U(2,3) = A(2,3)
end

% last row (same as above but with n bc we cant't do U(n,n+1))
L(n,n-1) = A(n, n-1)/U(n-1,n-1);
U(n, n) = A(n,n) - L(n,n-1)*U(n-1,n);
 
end