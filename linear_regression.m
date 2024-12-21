function [p, yfit, equation] = linear_regression(x, y)
    p = polyfit(x, y, 1);
    yfit = polyval(p, x);
    equation = sprintf('y = %.2fx + %.2f', p(1), p(2));
end