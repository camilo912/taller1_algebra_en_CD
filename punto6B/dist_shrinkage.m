function [R2] = dist_shrinkage(X)
%DIST_SHRINKAGE Distancia de Mahalanobis bajo Ledoit and Wolf (Shrinkage)

% usando metodo entregado por el profesor.
[S2 , ~] = cov1para(X);
S2_inv = inv(S2);

mu = mean(X);
x_centrados = X - mu;

Dm_shrink = sqrt(x_centrados * S2_inv * x_centrados');
R2 = Dm_shrink;

end
