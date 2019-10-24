X = 5+randn(10000,2)*1000
xmean = mean(X)
I1=X(:,1).^2+X(:,2).^2 ~= xmean(1).^2+xmean(2).^2
I2=~I1%X(:,1).^2+X(:,2).^2 == xmean(1).^2+xmean(2).^2
dxy2 = sqrt((X(:,1)-xmean(1)).^2+(X(:,2)-xmean(2)).^2).*I2
dxy1 = (sqrt(X(:,1).^2+X(:,2).^2)+sqrt(xmean(1)^2+xmean(2)^2)).*I1
dxy = dxy1+dxy2
percenti90=prctile(dxy,90)
Iraros=[find(dxy(:,1) >= percenti90(1))]
plot(X(:,1),X(:,2),'o')
hold on;
plot(X(Iraros,1), X(Iraros,2),'or')
