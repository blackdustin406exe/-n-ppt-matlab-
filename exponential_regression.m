function [p, yfit, equation] = exponential_regression(x, y)
    p = polyfit(x, log(y), 1);
    yfit = exp(p(1) * x + p(2));
    equation = sprintf('y = %.2fe^{%.2fx}', exp(p(2)), p(1));
end
