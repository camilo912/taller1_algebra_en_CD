%COVARIANZA HABITUAL
x = rand(100,3)*10;
covarianza1 = cov(x);
icov1 = inv(covarianza1);
xmean1 = mean(x);
x_minus_m1 = (x-xmean1);
distancia1 = (x_minus_m1)*icov1*(x_minus_m1)';
mahal1 = sqrt(diag(distancia1))
a = sqrt(mahal(x,x))
cond(covarianza1)
%%
%COVARIANZA BAJO SHRINKAGE
x = rand(100,3)*10;
[res1, res2] = cov1para(x);
icov2 = inv(res1);
xmean = mean(x);
x_minus_m = (x-xmean);
distancia2 = (x_minus_m)*icov2*(x_minus_m)';
mahal2 = sqrt(diag(distancia2))

%%
%VECTOR DE MEDIA ROBUSTO
x = rand(100,3)*10;
[idx,dm,mm,Ss,wval0,ndir] =kur_main(x);
icov3 = inv(Ss);
xmean = mm;
x_minus_m = (x-xmean);
distancia3 = (x_minus_m)*icov3*(x_minus_m)';
mahal3 = sqrt(diag(distancia3))