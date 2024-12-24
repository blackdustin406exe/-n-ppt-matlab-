function KQ = FuncTichPhan_XY(x, y, pp)
    % Kiểm tra độ dài của x và y
    if length(x) ~= length(y)
        error('X và Y phải có cùng độ dài.');
    end

    % Kiểm tra khoảng cách đều giữa các điểm x
    tol = 1e-5; % Đặt ngưỡng sai số
    dx = diff(x);
    if any(abs(dx - mean(dx)) > tol)
        error('Khoảng cách giữa các điểm X phải đều.');
    end

    % Tính toán tích phân theo phương pháp được chọn
    switch pp
        case 'Hình thang'
            h = x(2) - x(1);
            KQ = (h/2) * (y(1) + y(end) + 2 * sum(y(2:end-1)));

        case 'Simpson 1/3'
            if mod(length(y)-1, 2) ~= 0
                error('Số lượng phân đoạn cho Simpson 1/3 phải là số chẵn.');
            end
            h = x(2) - x(1);
            KQ = (h/3) * (y(1) + y(end) + 4 * sum(y(2:2:end-1)) + 2 * sum(y(3:2:end-2)));

        case 'Simpson 3/8'
            if mod(length(y)-1, 3) ~= 0
                error('Số lượng phân đoạn cho Simpson 3/8 phải chia hết cho 3.');
            end
            h = x(2) - x(1);
            KQ = (3*h/8) * (y(1) + y(end) + 3 * sum(y(2:3:end-1)) + 3 * sum(y(3:3:end-2)) + 2 * sum(y(4:3:end-3)));
    end
end
