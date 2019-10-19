dim = 12;
Hn = zeros(dim,dim);
x = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12];
for i=1:dim
    for j=1:dim
        Hn(i,j) = 1/(i+j-1);
    end
end
[Hn, shrink] = cov1para(Hn, 2);
b = Hn*x;
x = inv(Hn)*b;