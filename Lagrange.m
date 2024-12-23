function poly = Lagrange(xa, ya)
    n = length(xa);
    syms x;
    L = sym(zeros(1, n));
    for i = 1:n
        L(i) = 1;
        for j = 1:n
            if i ~= j
                L(i) = L(i) * (x - xa(j)) / (xa(i) - xa(j));
            end
        end
    end
    poly = expand(sum(ya .* L));  % Tạo và mở rộng đa thức Lagrange
end
