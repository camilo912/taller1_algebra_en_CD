function [DP, DJ, DD] = binary_dist_calc(t_mat,p_mat, X)
%BINARY_DIST_CALC Realiza el cálculo de las distancias binarias, dado la
%   la matríx verdadera t_mat vs la predicción p_mat y los datos X.

n_portafolios = size(X,2);
%Pearson 1926
distPearson = zeros(n_portafolios,1);
%Jaccard 1908
distJaccard = zeros(n_portafolios,1);
%Dice 1945
distDice = zeros(n_portafolios,1);

for i = 1:n_portafolios
    
    % sacar la matriz de confusión
    conf_mat = confusionmat(t_mat(:,i), p_mat);
    
    % falsos negativos (FN)
    d = conf_mat(1,1);
    % falsos positivos (FP)
    b = conf_mat(2,1);
    % verdaderos negativos (TN)
    c = conf_mat(1,2);
    % verdaderos positivos (TP)
    a = conf_mat(2,2);
    
    %calculo de las distancias.
    distPearson(i) = ((a * d) - (b * c)) / ...
        sqrt((a + c)*(b + d)*(a + b)*(c + d));
    
    distJaccard(i) = a / (a+b+c);
    
    distDice(i) = (2 * a) / ((2 * a) + b + c);
end

DP = distPearson;
DJ = distJaccard;
DD = distDice;

end
