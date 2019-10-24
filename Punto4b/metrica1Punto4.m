X=rand(10000,1)
xmean = mean(X)
I=X ~= xmean
dx = (ones(10000,1)*2 - X - xmean).*I
percenti90=prctile(dx,90)
Iraros=[find(dx(:,1) >= percenti90(1))]
plot(X,'o')
hold on;
plot(X(Iraros,1),'or')
    
