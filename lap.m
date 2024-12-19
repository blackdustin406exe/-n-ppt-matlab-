function [x1, n] = lap(fp, a, saiso)
    % fp: hàm lặp (được truyền dưới dạng hàm ẩn danh)
    % a: giá trị khởi tạo
    % saiso: sai số cho phép
    % x1: nghiệm gần đúng tìm được
    % n: số lần lặp

    x1 = a;  % Khởi tạo giá trị ban đầu
    n = 0;   % Đếm số lần lặp
    max_iter = 100;  % Giới hạn số lần lặp để tránh chạy mãi

    while true
        x_next = fp(x1);  % Áp dụng hàm lặp

        n = n + 1;  % Tăng số lần lặp
        % Kiểm tra điều kiện dừng
        if abs(x_next - x1) < saiso || n > max_iter
            if n > max_iter
                disp('Quá số lần lặp tối đa, không hội tụ.');
            end
            break;
        end
        
        x1 = x_next;  % Cập nhật giá trị cho vòng lặp tiếp theo
    end
end
