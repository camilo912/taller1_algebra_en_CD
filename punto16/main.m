n_iter = 12;
ns = zeros(n_iter, 1);
dets = zeros(n_iter, 1);
conds = zeros(n_iter, 1);


for n=1:n_iter
    vandermonde = zeros(n, n);
    for i=1:n
        for j=1:n
            vandermonde(j,i) = (i+1)^(j-1);
        end
    end
    ns(n) = n;
    % [vandermonde, shrink] = cov1para(vandermonde, 2);
    conds(n) = cond(vandermonde);
    dets(n) = det(vandermonde);
end

% plot(ns, conds, 'b')
% plot(ns, dets, 'r')

x = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12];
cond(vandermonde)
vandermonde = vandermonde + eye(12) * 1.00000001;
cond(vandermonde)
b = vandermonde*x;
x = inv(vandermonde)*b