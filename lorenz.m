%define variables

sigma  = 10;
r = 28;
b = 8/3;

f = @(t,y) [sigma*(y(2) - y(1)); 
    (r*y(1)) - y(2) - (y(1)*y(3)); ...
    (y(1)*y(2)) - (b*y(3))];


T = 20; % final time
ic = [5;5;5]; % initial condition

[tspan, vals] = ode45(f, [0, T], ic);


x_vals = vals(:,1);
y_vals = vals(:,2);
z_vals = vals(:,3);

% plot
figure;
plot3(x_vals, y_vals, z_vals, 'r') % first component
hold on;

title("Lorenz Equations")
xlabel("x(t)");
ylabel("y(t)");
zlabel("z(t)");
hold off;