function [x1, n] = tieptuyen(fx, a, b, saiso)
    % fx: Hàm cần tìm nghiệm (dưới dạng hàm ẩn danh)
    % a: Điểm khởi đầu (giá trị gần nghiệm)
    % b: Không cần dùng cho phương pháp này (có thể bỏ qua)
    % saiso: Sai số cho phép
    % x1: Nghiệm gần đúng tìm được
    % n: Số lần lặp

    syms x;                  % Khai báo biến x để tính đạo hàm
    f_prime = matlabFunction(diff(fx(x)));  % Tính đạo hàm của hàm fx
    
    x0 = a;                  % Điểm khởi đầu
    n = 0;                   % Đếm số lần lặp
    while(1)
        % Tính giá trị tiếp theo theo công thức Newton-Raphson
        x1 = x0 - fx(x0) / f_prime(x0);
        
        % Kiểm tra điều kiện dừng
        if abs(x1 - x0) < saiso
            break;
        end
        
        % Cập nhật giá trị cho lần lặp tiếp theo
        x0 = x1;
        n = n + 1;
    end
end


