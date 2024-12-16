load price_data.mat
% load column vectors times and prices

% use this to plot polynomial approximations
t_plot = linspace(times(1), times(end), 1000);

% price is based on time
% so times is our x
% and prices is our y

n = length(times);
A_1 = ones(n,2);
A_2 = ones(n,3);
A_5 = ones(n,6);

% compute the Vandermonde variables

% 5th degree polynomial
for i = 1: 5
    A_5(:, i) = times.^(6-i);
end

% 2nd degree polynomial
for j = 1: 2
    A_2(:, j) = times.^(3-j);
end

% 1st degree polynomial
for k = 1: 1
    A_1(:, k) = times.^(2-k);
end

% find coefficients - could i use polyfit for this??
coeffs_1 = A_1\prices;
coeffs_2 = A_2\prices;
coeffs_5 = A_5\prices;


% compute coefficients and best time

% max value of t is -b/2a  so -0.5*(b/a)
best_time = -0.5*(coeffs_2(2)/coeffs_2(1));

best_price = polyval(coeffs_2, best_time);


% finish plot commands
plotA1 = polyval(coeffs_1, t_plot);
plotA2 = polyval(coeffs_2, t_plot);
plotA5 = polyval(coeffs_5, t_plot);

plot(times, prices, 'b.', 'MarkerSize', 20)
hold on;
plot(best_time, best_price, 'r.', 'MarkerSize', 20);
% *use t_plot to plot polynomials*
hold on;
% plot 1st degree polynomial approximation here
plot(t_plot, plotA1, 'r', 'LineWidth', 1);
hold on;
% plot 2nd degree poly. here
plot(t_plot, plotA2, 'g', 'LineWidth', 1);
hold on;
% plot 5th degree poly here
plot(t_plot, plotA5, 'c', 'LineWidth', 1);

legend('Price Data', 'Best Time/Price', 'Degree 1 Fit', 'Degree 2 Fit',...
    'Degree 5 fit')
% label the axes
xlabel('Times (Days)', 'FontSize',15)
ylabel('Prices (Dollars)', 'FontSize', 15)

hold off;