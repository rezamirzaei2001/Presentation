function [tx_signal, constellation] = Reza_PSK(data, m)

    k = log2(m);
    symbolLen = floor(length(data) / k);
    data = data(1 : symbolLen * k);

    indices = 0 : m-1;
    % نقاط مرجع
    constellation = exp(1j * 2 * pi * indices / m);  

    symbols = zeros(1, symbolLen);

    for n = 1:symbolLen
        
        %پیمانه های m بیتی
        bits_group = data((n-1)*k + 1 : n*k);

        % bit -> 0 m-1 in decimal map
        for b = 1:k
            symbols(n) = symbols(n) + bits_group(b) * 2^(k - b);
        end
    end

    % symbol index constellation
    tx_signal = constellation(symbols + 1);
end