
function [centroids, idx] = punto5(K, max_iters, p, plot,randomK)
%PUNTO5 Ejecuta el algoritmo de k-means, siendo los inputs K: el número de
%grupos, p la distancia y max_iters, el número de iteraciones.

% X = load("egData.mat");
% data = X.X;
X1 = randn(1000, 2);
X2 = randn(1000, 2)+5;
X3 = randn(1000, 2)+10;
data = [X1; X2; X3];

% para la selección de los centroids iniciales quemados.
initial_centroids = [3 3; 6 2; 8 5];

% para la generación de centroides iniciales al azar.

if ~exist('randomK', 'var') || isempty(randomK)
    randomK = false;
end

if randomK
    rand_centroids = randperm(size(data, 1));
    initial_centroids = data(rand_centroids(1:K),:);
end

% para realizar el clustering de los datos a los centroides.
[centroids, idx] = kMean(data, initial_centroids, max_iters, p, plot);

% para cerrar la ventana de plot abierta.
close;

end
