function [p, yfit, equation] = logarithmic_regression(x, y)
    p = polyfit(log(x), y, 1);
    yfit = p(1) * log(x) + p(2);
    equation = sprintf('y = %.2f log(x) + %.2f', p(1), p(2));
end
