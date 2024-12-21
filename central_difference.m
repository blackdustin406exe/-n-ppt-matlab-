function result = central_difference(x, y, h, order)
    % Xấp xỉ trung tâm
    if order == 2
        result = (y(3:end) - y(1:end-2)) ./ (2 * h);
    else
        error('Xấp xỉ trung tâm chỉ hỗ trợ O(h^2).');
    end
end
