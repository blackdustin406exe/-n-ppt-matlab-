function result = NewtonInterpolation(xa, ya, x)
% Bước 1: Tính sai phân chia
    n = length(xa);
    d = ya; % Khởi tạo d với giá trị ya ban đầu
    for i = 2:n
        for j = n:-1:i
            d(j) = (d(j) - d(j-1)) / (xa(j) - xa(j-i+1));
        end
    end
    
% Bước 2: Tính giá trị nội suy theo công thức Newton
    result = d(n); % Hệ số cao nhất
    for i = n-1:-1:1
        result = result * (x - xa(i)) + d(i);
    end
end

