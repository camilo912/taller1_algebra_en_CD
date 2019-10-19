iters = 50;
ns = zeros(iters, 1);
conds = zeros(iters, 1);
dets = zeros(iters, 1);
for n=1:iters
    Hn = zeros(n,n);
    for i=1:n
        for j=1:n
            Hn(i,j) = 1/(i+j-1);
        end
    end
    ns(n) = n;
    [Hn, shrink] = cov1para(Hn, 5);
    conds(n) = cond(Hn);
    dets(n) = det(Hn);
end

%plot(ns, conds, 'b')
plot(ns, dets, 'r')