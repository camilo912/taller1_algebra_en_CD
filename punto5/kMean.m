function [centroids, idx] = kMean(X, initial_centroids, max_iters, p, plot)
%KMEAN ejecucción del algoritmo de kMeans en la matrix de datos, donde cada
%de X es un muestra.
%   Usando los centroides iniciales, el numéro máximo de iteraciones y
%   plot, la variable graficar el progreso.

% para controlar la grafica del algoritmo.
if ~exist('plot', 'var') || isempty(plot)
    plot = false;
end

if plot
    figure;
    hold on;
end

%inicializaciones iniciales
[m , ~] = size(X);
K = size(initial_centroids, 1);
centroids = initial_centroids;
previous_centroids = centroids;
idx = zeros(m, 1);

for i = 1:max_iters
    fprintf('K-Means iteración %d/%d...\n', i, max_iters);
    drawnow('update')
    
    % para computar los centroides más cercanos
    idx = findClosestCentroids(X, centroids, p);
    
    % para controlar la gráfica del progreso de kmean
    if plot
        plotKMeans(X, centroids, previous_centroids, idx, K, i);
        previous_centroids = centroids;
        fprintf('Press enter to continue.\n');
        pause;
    end
    
    %
    % para computar nuevos centroides
    centroids = computeCentroids(X, idx, K);
end

if plot
    hold off;
end

end
