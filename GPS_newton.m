S = [15600, 7540, 20140, 0.07074;
              18760, 2750, 18610, 0.0722;
              17610, 14630, 13480, 0.0769;
              19170, 610, 18390, 0.07242];

% 1st row of S contains A_1, B_1, C_1, t_1
% 2nd row of S contains A_2, B_2, C_2, t_2
% etc...


c = 299792.458; % speed of light in km/sec

% using functions defined in separate files
f = @(X) f_S(X, S);
Jf = @(X) Jf_S(X, S); % you need to finish Jf_S.m 


X_initial = [0; 0; -6370; 0]; % initial guess = South Pole

% uncomment to generate 3D plot using initial condition
plot_GPS(S,X_initial)


% finish the code by implementing Newton's method
tol = 1e-7;

% initialize X_hist
X_hist = X_initial;

% says it should be less than 10 iterations but 20 to be safe
for N = 1:20
    X_old = X_hist(:,N);
    
        a = Jf(X_old);
        b = -f(X_old);
        step = a\b;
    X_new = X_old + step;
    
    
    X_hist = [X_hist, X_new];
    
    error = norm(X_new - X_old);

    if norm(X_new - X_old) < tol
        break
    end

end

receiver_location = X_hist(:,end);



%%%% can also plot every Newton step by adding these lines into your for loop:
% plot_GPS(S, X_new)
% pause;
%%%% (your variable might have a name which is different from "X_new")


% uncomment to generate 3D plot using final iteration
plot_GPS(S,X_hist(:,end))
