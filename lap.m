function [x1,n] = lap(fx, fp, a, b, saiso)
    % fx: hàm cần tìm nghiệm (không sử dụng trong phương pháp lặp)
    % fp: hàm lặp (được truyền dưới dạng hàm ẩn danh)
    % a: giá trị khởi tạo (hoặc khoảng [a,b], thường chọn a)
    % saiso: sai số cho phép
    % x1: nghiệm gần đúng tìm được
    % n: số lần lặp

    x0 = a;  % Giá trị khởi tạo
    n = 0;   % Đếm số lần lặp
    max_iter = 100;  % Giới hạn số lần lặp để tránh chạy mãi

    while(1)
        x1 = fp(x0);  % Áp dụng hàm lặp

        % Kiểm tra điều kiện dừng: nếu độ chênh lệch giữa hai lần lặp nhỏ hơn sai số cho phép
        if abs(x1 - x0) < saiso
            break;
        end
        
        x0 = x1;  % Cập nhật giá trị cho vòng lặp tiếp theo
        n = n + 1;  % Tăng số lần lặp
        
        % Nếu vượt quá số lần lặp cho phép, dừng lại
        if n > max_iter
            disp('Quá số lần lặp tối đa, không hội tụ.');
            break;
        end
    end
end
