function [R1, R2, R3] = punto6(X)
%PUNTO6 Mahalanobis utilizando la covarianza habital, luego la covarianza 
%   bajo el shrinkage de Ledoit and Wolf. (cov1para:m), y la covarianza y 
%   vector de medias robustos obtenida bajo el metodo de minima curtosis 
%   (kurmain:m). Siendo X los datos.

R1 = dist_habitual(X);

R2 = dist_shrinkage(X);

R3 = dist_robust(X);

end

