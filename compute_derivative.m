function result = compute_derivative(func_str, x_val, h, method)
    % Hàm tính đạo hàm dựa trên chuỗi hàm số
    % func_str: Chuỗi hàm số (ví dụ: 'x^2 + sin(x)')
    % x_val: Điểm cần tính đạo hàm
    % h: Bước nhảy
    % method: Phương pháp ('forward', 'backward', 'central')
    
    % Chuyển chuỗi thành hàm số
    syms x;
    func = str2func(['@(x) ' func_str]);
    
    % Tính toán đạo hàm dựa trên phương pháp
    switch method
        case 'forward'
            result = (func(x_val + h) - func(x_val)) / h; % Xấp xỉ tiến
        case 'backward'
            result = (func(x_val) - func(x_val - h)) / h; % Xấp xỉ lùi
        case 'central'
            result = (func(x_val + h) - func(x_val - h)) / (2 * h); % Trung tâm
        otherwise
            error('Phương pháp không hợp lệ');
    end
end
