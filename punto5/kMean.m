function [centroids, idx, J, c] = kMean(X, initial_centroids, max_iters, p, plot_b)
%KMEAN ejecucci�n del algoritmo de kMeans en la matrix de datos, donde cada
%de X es un muestra.
%   Usando los centroides iniciales, el num�ro m�ximo de iteraciones y
%   plot, la variable graficar el progreso.

% para controlar la grafica del algoritmo.
if ~exist('plot_b', 'var') || isempty(plot_b)
    plot_b = false;
end

if plot_b
    figure;
    hold on;
end

%inicializaciones iniciales
[m , ~] = size(X);
K = size(initial_centroids, 1);
centroids = initial_centroids;
previous_centroids = centroids;
J = zeros(max_iters, 1);
c = max_iters;
c_b = false;
for i = 1:max_iters
    idx = zeros(m, 1);
    fprintf('K-Means iteraci�n %d/%d...\n', i, max_iters);
    drawnow('update')
    
    % para computar los centroides m�s cercanos
%     idx = findClosestCentroids(X, centroids, p);

    for j=1:m
        idx(j) = encontrarCentroide(j, X, centroids, p);
        centroids(idx(j), :) = calcularCentroide(X(idx == idx(j), :));
    end
    
    % para controlar la gr�fica del progreso de kmean
    if plot_b
        plotKMeans(X, centroids, previous_centroids, idx, K, i);
        previous_centroids = centroids;
        fprintf('Press enter to continue.\n');
        pause;
    end
    
    %
    % para computar nuevos centroides
%     centroids = computeCentroids(X, idx, K);

    J(i) = calcular_dispersion(X,idx, centroids);
    
    if i > 1
        if J(i-1)-J(i) <= J(i-1)*0.003 && not(c_b)
            c=i-1;
            c_b = true;
        end
    end
end

if plot_b
    hold off;
    rang = [1:max_iters];
    plot(rang', J);
    pause;
end
end
