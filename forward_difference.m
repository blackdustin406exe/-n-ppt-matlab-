function result = forward_difference(x, y, h, order)
    if order == 1
        result = diff(y) ./ diff(x);
    elseif order == 2
        result = (y(3:end) - y(1:end-2)) ./ (2 * h);
    else
        error('Chỉ chọn O(h) hoặc O(h^2).');
    end
end