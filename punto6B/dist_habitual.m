function [R1] = dist_habitual(X)
%DIST_HABITUAL Cálculo de la distancia de Mahalanobis con covarianza
%   habitual. Siendo X los datos.

% sigmas habitual S1 y bajo el shrinkage de Ledoit and Wolf S2.
S1 = cov(X);
S1_inv = inv(S1);

% Distancia de Mahalabonis bajo covarianza habitual con vector de medias
% habitual
mu = mean(X);
x_centrados = X - mu;

Dm_hab = sqrt(x_centrados * S1_inv * x_centrados');
R1 = Dm_hab;

end

