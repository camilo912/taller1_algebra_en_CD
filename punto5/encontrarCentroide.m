function c = encontrarCentroide(j, X, centroides, p)
m = size(centroides, 1);
dist = zeros(m, 1);
if(p == 0)
    n = size(X,2);
    % r = corr(X(:,1), X(:,2));
    % s = cov(X);
    [s, ~] = cov1para(X);
    r = s(1,2)/(s(1,1)*s(2,2));
    for i=1:m
        c = centroides(i,:);
        dist(i) = sqrt(1/(1-r^2)*((X(j,1)-c(1))^2/s(1,1)^2 + (X(j,2)-c(2))^2/s(2,2)^2 - 2*r*((X(j,1)-c(1))*(X(j,2)-c(2)))/s(1,1)*s(2,2)));
    end
else
    for i=1:m
        dist(i) = norm(X(j, :)-centroides(i), p);
    end
end
c = min(find(dist==min(dist)));
end