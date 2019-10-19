z = zeros(1,100)
bindata = x1 >= z
covarianza3 = cov(bindata)
icov3 = inv(covarianza3)
xmean3 = mean(bindata)
binMean = xmean3 >= 0.5
x_minus_m3 = (bindata-binMean)
distancia3 = (x_minus_m3)*icov3*(x_minus_m3)'
mahal3 = sqrt(diag(distancia3))
C3=prctile(mahal3,95)
Ibin=find(mahal3>=C3);
