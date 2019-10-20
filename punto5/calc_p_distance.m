function [ pdist ] = calc_p_distance(point, centroids, p, X)
%CALCPDISTANCE calculo de la distancia dado un p, se asume que p=0 es la
%   distancia de Mahalanobis, cualquier otro p es la norma p del p.
K = size(centroids,1);
pdist = zeros(1,K);

if p == 0
    % usando algoritmo entregado por profesor.
    S = cov1para(X);
    
    for i =1:K
        pdist(1,i)=(point-centroids(i,:))/inv(S)*(point-centroids(i,:))';
    end
    
else
    for i = 1:K
        pdist(1,i) = norm(point-centroids(i,:),p);
    end
end

end
