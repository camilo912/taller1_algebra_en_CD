function J = calcular_dispersion(X, idx, centroides)
J = 0;
for i=1:size(idx,1)
    J = J + norm(X(i,:)-centroides(idx(i)), 2);
end
end