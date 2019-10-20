function plotKMeans(X, centroids, previous, idx, K, i)
%PLOTKMEANS Función para graficar el progreso del algoritmo de kmeans.

% Graficar la muestra
plotDataPoints(X, idx, K);

plot(centroids(:,1), centroids(:,2), 'x', 'MarkerEdgeColor','k', ...
    'MarkerSize', 10, 'LineWidth', 3);

%para dibujar el historial de como se han movido los centroides con una
%linea

for j=1:size(centroids,1)
    p1 = centroids(j, :);
    p2 = previous(j, :);
    plot([p1(1) p2(1)], [p1(2) p2(2)]);
end

% Título
title(sprintf('Iteración # %d', i))

end

