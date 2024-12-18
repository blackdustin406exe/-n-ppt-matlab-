%Cau 1:
%a)
function [nghiem,soLanLap] = ChiaDoi(fx,a,b,e)
    % fx: Hàm cần tìm nghiệm (truyền dưới dạng hàm ẩn danh)
    % a, b: Khoảng phân li nghiệm
    % saiso: Sai số cho phép
    % c: Nghiệm gần đúng
    % n: Số lần lặp

    % Sử dụng trực tiếp hàm ẩn danh fx thay vì str2func
    soLanLap = 0;
    while(1)
        nghiem = (a + b) / 2;      % Tính giá trị giữa
        fac = fx(a) * fx(nghiem);  % Tính tích f(a) * f(c)
        
        % Kiểm tra điều kiện dấu để cập nhật khoảng [a, b]
        if fac < 0
           b = nghiem;
        else
           a = nghiem;
        end
        
        % Kiểm tra điều kiện dừng khi khoảng sai số nhỏ hơn sai số cho phép
        if abs(a - b) < e
            break;
        end
        
        soLanLap = soLanLap + 1;  % Tăng số lần lặp
    end
end
