% function f(t,y) = y' using eq 35
f = @(t,y) 1 - 2*t*y;


% setup values and define variables
T = 5;
N = 200;
dt = T/N;
t_vals = 0:dt:T;

% initial conditons
ic = [0];


% Heun's Method
y_heun = zeros(1, length(t_vals));

% add in initial condition
y_heun(1) = ic;

for k = 1:N
    y_k = y_heun(k); 
    t_k = t_vals(k);
    f1 = f(t_k, y_k);
    f2 = f(t_k + dt, y_k + dt*f1);

    y_k1 = y_k + 0.5*dt*(f1 + f2);
    y_heun(:,k+1) = y_k1;
end


% RK4
y_rk4 = zeros(1, length(t_vals));

% add in initial condition
y_rk4(1) = ic;

for kr = 1:N
    y_kr = y_rk4(:,kr); 
    t_kr = t_vals(kr);
    f1r = f(t_kr, y_kr);
    f2r = f(t_kr + 0.5*dt, y_kr + 0.5*dt*f1r);
    f3r = f(t_kr + 0.5*dt, y_kr + 0.5*dt*f2r);
    f4r = f(t_kr + dt, y_kr + dt*f3r);

    y_kr1 = y_kr + dt*(f1r + 2*f2r + 2*f3r + f4r)/6;
    y_rk4(:,kr+1) = y_kr1;
end

% trapezoid method
y_trap = zeros(1, length(t_vals));

% add in initial condition
y_trap(1) = ic;

for kt = 1: N
    % using equation for problem 9
    num = y_trap(kt) + dt - (t_vals(kt)*y_trap(kt)*dt);
    denom = 1 + ((t_vals(kt)+dt)*dt);

    y_trap(kt+1) = num/denom;
end

% exact solution
y_dawson = dawson_integral(t_vals);

% errors
heun_err = max(abs(y_heun - y_dawson));
rk4_err = max(abs(y_rk4 - y_dawson));
trap_err = max(abs(y_trap - y_dawson));

%repeat with 10 steps

% setup values and define variables
N2 = 10;
dt2 = T/N2;
t_vals2 = 0:dt2:T;

% Heun's Method
y_heun_2 = zeros(1, length(t_vals2));

% add in initial condition
y_heun_2(1) = ic;

for k2 = 1:N2
    y_k2 = y_heun_2(k2); 
    t_k2 = t_vals2(k2);
    f12 = f(t_k2, y_k2);
    f22 = f(t_k2 + dt2, y_k2 + dt2*f12);

    y_k12 = y_k2 + 0.5*dt2*(f12 + f22);
    y_heun_2(:,k2+1) = y_k12;
end


% RK4
y_rk4_2 = zeros(1, length(t_vals2));

% add in initial condition
y_rk4_2(1) = ic;

for kr2 = 1:N2
    y_kr2 = y_rk4_2(:,kr2); 
    t_kr2 = t_vals2(kr2);
    f1r2 = f(t_kr2, y_kr2);
    f2r2 = f(t_kr2 + 0.5*dt2, y_kr2 + 0.5*dt2*f1r2);
    f3r2 = f(t_kr2 + 0.5*dt2, y_kr2 + 0.5*dt2*f2r2);
    f4r2 = f(t_kr2 + dt2, y_kr2 + dt2*f3r2);

    y_kr12 = y_kr2 + dt2*(f1r2 + 2*f2r2 + 2*f3r2 + f4r2)/6;
    y_rk4_2(:,kr2+1) = y_kr12;
end

% trapezoid method
y_trap_2 = zeros(1, length(t_vals2));

% add in initial condition
y_trap_2(1) = ic;

for kt2 = 1: N2
    % using equation for problem 9
    num = y_trap_2(kt2) + dt2 - (t_vals2(kt2)*y_trap_2(kt2)*dt2);
    denom = 1 + ((t_vals2(kt2)+dt2)*dt2);

    y_trap_2(kt2+1) = num/denom;
end

% exact solution
y_dawson_2 = dawson_integral(t_vals2);

% errors
heun_err_2 = max(abs(y_heun_2 - y_dawson_2));
rk4_err_2 = max(abs(y_rk4_2 - y_dawson_2));
trap_err_2 = max(abs(y_trap_2 - y_dawson_2));
