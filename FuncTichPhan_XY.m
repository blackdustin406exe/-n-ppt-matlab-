

function KQ = FuncTichPhan_XY(x,y,pp)
    % if(length(x) ~= length(y))
    %     fprintf('x và y BẮT BUỘC phải cùng độ dài');
    % end
    switch(pp)
        case 'Hình thang'
            h = x(2) - x(1);
            KQ = (h/2)*(y(1)+y(length(y))+2*sum(y(2:length(y)-1)));

        case 'Simpson 1/3'
            if mod(length(y)-1, 2) == 0
            h = x(2) - x(1);
            KQ = (h/3)*(y(1)+y(length(y))+4*sum(y(2:2:length(y)-1))+2*sum(y(3:2:length(y)-2)));
         
            else
            fprintf('số tử của x và y phải là chẵn');
            end
            

        case 'Simpson 3/8'
            if mod(length(y)-1, 3) == 0
            h = x(2) - x(1);
            KQ = (3*h/8)*(y(1)+y(length(y)+3*sum(y(2:3:length(y)-1)))+3*sum(y(3:3:length(y)-2))+2*sum(y(4:3:length(y)-3)));
            else
            fprintf('số tử của x và y phải là chẵn');
            end
            
    end
end