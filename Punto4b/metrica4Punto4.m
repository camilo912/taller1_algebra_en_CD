X = randi([1 100],10000,1)
xmean = mean(X)
I=X ~= xmean
dxy = (ones(10000,1)+(ones(10000,1)./(X + xmean))).*I
percenti90=prctile(dxy,90)
Iraros1 = find(dxy(:,1) >= percenti90(1)) 
plot(X(:,1),'o')
hold on;
plot(X(Iraros1,1),'or')

