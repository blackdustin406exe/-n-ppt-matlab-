function poly = NewtonInterpolation(xa, ya)
    % Chuyển đổi các giá trị đầu vào thành số chính xác cao
    xa = vpa(xa);
    ya = vpa(ya);
    n = length(xa);
    d = ya;  % Khởi tạo d với giá trị ya ban đầu
    for i = 2:n
        for j = n:-1:i
            d(j) = vpa((d(j) - d(j-1)) / (xa(j) - xa(j-i+1)));
        end
    end

    syms x;
    poly = d(n);  % Hệ số cao nhất
    for i = n-1:-1:1
        poly = poly * (x - xa(i)) + d(i);
    end
    poly = expand(poly);  % Mở rộng và đơn giản hóa đa thức
end
