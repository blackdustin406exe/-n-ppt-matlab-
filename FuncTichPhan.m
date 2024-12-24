function KQ = FuncTichPhan(fx, N, a, b, pp)
    try
        % Chuyển đổi chuỗi thành hàm số
        fx_func = matlabFunction(str2sym(fx));

        % Chọn phương pháp tích phân
        switch pp
            case 'Hình thang'
                h = (b - a) / N;
                KQ = (h/2)*(fx_func(a) + fx_func(b) + 2*sum(fx_func(a + h:h:b - h)));

            case 'Simpson 1/3'
                if mod(N, 2) ~= 0
                    error('Số lượng phân đoạn cho Simpson 1/3 phải là số chẵn');
                end
                h = (b - a) / N;
                x = a + (0:N) * h;
                fx_vals = feval(fx_func, x);
                KQ = (h/3)*(fx_vals(1) + fx_vals(end) + 4*sum(fx_vals(2:2:end-1)) + 2*sum(fx_vals(3:2:end-2)));

            case 'Simpson 3/8'
                if mod(N, 3) ~= 0
                    error('Số lượng phân đoạn cho Simpson 3/8 phải chia hết cho 3');
                end
                h = (b - a) / N;
                x = a + (0:N) * h;
                fx_vals = feval(fx_func, x);
                KQ = (3*h/8)*(fx_vals(1) + fx_vals(end) + 3*sum(fx_vals(2:3:end-1)) + 3*sum(fx_vals(3:3:end-2)) + 2*sum(fx_vals(4:3:end-3)));
        end
    catch e
        % Xử lý ngoại lệ và thông báo lỗi phù hợp
        error('Error in FuncTichPhan: %s', e.message);
    end
end
