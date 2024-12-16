function x = forwardsub_diag(l_vals, b)
    % Computes the solution to Lx = b, 
    % where L is a lower-triangular matrix such that:
    % 1. All diagonal elements of L = 1
    % 2. The first sub-diagonal contains the only non-zero entries of L
    %    that are below the diagonal

    % Inputs:
    % * l_vals is a row vector containing the values of the first 
    %   sub-diagonal of L
    % * b is the right-hand side of the system (column vector)

 n = length(b);
 x = zeros(n, 1);

  x(1) = b(1); % first equation
 
    % Output:

    % * x is the solution to Lx = b (a column vector)
   for i = 2:n
        x(i) = b(i) - l_vals(i-1) * x(i-1);
   end
  

end