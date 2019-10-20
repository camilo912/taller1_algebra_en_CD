function [R3] = dist_robust(X)
%DIST_ROBUST Distancia de Mahalanobis usando metodos robustos

% vector de medias robustos obtenida bajo el método de mínima curtosis
[~,~,mm,Ss,~,~] = kur_main(X);
S3 = Ss;
S3_inv = inv(S3);
kurt_mu = mm;
kurt_centrados = X - kurt_mu;

% Distancia de Mahalanobis bajo método Rubusto.
KDist = sqrt(kurt_centrados * S3_inv * kurt_centrados');
R3 = KDist;

end

