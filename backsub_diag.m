function x = backsub_diag(u_diag, u_super, b)
    % Computes the solution to Ux = b, 
    % where U is an upper-triangular matrix such that:
    % 1. All diagonal elements of U are non-zero
    % 2. The first super-diagonal contains the only non-zero entries of U
    %    that are above the diagonal

    % Inputs:
    % * u_diag is a row vector containing the values of the diagonal of U 
    % * u_super is a row vector containing the values of the first 
    %   super-diagonal of U
    % * b is the right-hand side of the system (column vector)

    n = length(b);
    x = zeros(n, 1);

x(n) = b(n)/u_diag(n); % last equation

    % Output:
    % * x is the solution to Ux = b (a column vector)
 
    for i = n-1:-1:1
        x(i) = (b(i) - (u_super(i)*x(i+1))) / u_diag(i);
    end

end