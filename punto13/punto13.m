function punto13(X)
%PUNTO13 Summary Cálcula el número condicion de la matríz de covarianzas
% de los datos del portafolio, e implementa alternativas para mejorarlo.

%n_portafolios = size(X,2);
%n_datos = size(X,1);

% inicial
n_cond = cond(cov(X));
fprintf('#condición inicial: %6.4f \n', n_cond);

% usando "discrete inverse theory", con el Marquardt-Levenberg coefficient
% donde multiplicamos un escalar a la diagonal, 
% intentando bajar el número condición. La vuelve más invertible,
% aunque si el c es muy grande, se puede alejar, de la verdadera solución.
c = 150;
X_new = X + c*eye(size(X));
n_disc_cond = cond(cov(X_new));
fprintf('#condición Marquardt-Levenberg: %6.4f \n', n_disc_cond);

% usando algorithm de Ledoit y Wolf Shrinkage
[r_mat, ~] = cov1para(X);
n_cond_lw = cond(r_mat);
fprintf('#condición Ledoit-wolf: %6.4f \n', n_cond_lw);

%usando PCA dimensional reduction
%PCA encuentra una nueva cantidad de columnas o dimensiones tal que todas
% las dimensiones sean ortogonales (linearmente independientes) y rankeadas
% seg'un la varianza de los datos.
M = pca(X);
disp(M);
n_cond_pca = cond(cov(X*M));
fprintf('#condición PCA: %6.4f \n', n_cond_pca);

end
