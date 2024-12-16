function root = newton_bisection(a, b, f, df, tol, max_iter)
% inputs
% a - starting left endpoint, b - ending right endpoint
% f - function for which we want to find the root
% df - function which calculates f'(x)
% tol - tolerance for stopping criteria
% max_iter - maximum number of iterations

% output: root is the approximation to the root

% feel free to remove these lines if you want to implement it differently

% % % % % % % maybe add back in fa anfd fb if error is too high (ask during office hours)
% % % % % % % also ask in office hours if they can pass in a root as one of the
% % % % % % % endpoints

x_old = a;

% complete the code
% 1. Try Newton's method
% 2. Inside interval --> keep Newton step
% 3. Outside interval --> take midpoint instead
% 4. Check convergence
% 5. Update left or right endpoint based on sign of function

for k = 1: max_iter
    x_newton = x_old - f(x_old)/df(x_old);
    
    % step 1 of newtons method & bisection method
    if x_newton > a && x_newton < b
        xk = x_newton;
    else
        xk = 0.5*(a +  b);
    end

% tolerance
    if abs(xk - x_old) < tol
        break % break NOT return
    end

    if f(a) * f(xk) < 0
            b = xk; 
    elseif f(b)*f(xk) < 0
            a = xk; 
    else
            root = xk;
            return
            % should I add else root= xk (ask during office hours) - works
            % with or without
    end

    % update x_old
    x_old = xk;
   
end

root = xk; % USE xk !!!

end