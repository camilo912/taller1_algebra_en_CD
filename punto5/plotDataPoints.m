function plotDataPoints(X, idx, K)
%PLOTDATAPOINTS para graficar cada dato con un color respectivo.

% Create paleta
palette = hsv(K + 1);
colors = palette(idx, :);

% Plot datos via scatter
scatter(X(:,1), X(:,2), 15, colors);

end

