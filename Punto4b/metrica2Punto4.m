X = randn(10000,1);
xmean = mean(X);
I=X ~= xmean;
a=ones(10000,1)*rand()*10000;
dx = (abs(X+a)+abs(xmean + a)).*I;
percenti90=prctile(dx,90);
Iraros=[find(dx(:,1) >= percenti90(1))]
plot(X(:,1),'o')
hold on;
plot(X(Iraros,1),'or')
    