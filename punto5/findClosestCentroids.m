function idx = findClosestCentroids(X, initial_centroids, p)
%FINDCLOSESTCENTROIDS Computa los centroides en base a cada dato y devuelve
%los más cercanos en el vector idx para un dataset X, donde cada fila es
%un dato.

%para tomar la cantidad de centroides.
K = size(initial_centroids, 1);

% la cantidad de datos.
m = size(X,1);

% para la prealocación en memoria de la respuesta.
idx = zeros(m,1);

for i = 1:m
    minJ = zeros(K,1);
    
    % por cada centroide
    for j = 1:K
        a = X(i,:);
        b = initial_centroids(j,:);
        distance = calc_p_distance(a, b, p, X);
        minJ(j) = distance;
    end
    
    [~, row] = min(min(minJ,[],2));
    
    idx(i) = row;
end
