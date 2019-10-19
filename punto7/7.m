%leer datos
x = read_data();
%%
%COVARIANZA TRADICIONAL
covarianza1 = cov(x);
icov1 = inv(covarianza1);
xmean1 = mean(x);
x_minus_m1 = (x-xmean1);
distancia1 = (x_minus_m1)*icov1*(x_minus_m1)';
mahal1 = sqrt(diag(distancia1));
cond(covarianza1);
C=prctile(mahal1,95);
I=find(mahal1>=C);
%%
%SHRINKAGE
[res1, res2] = cov1para(x);
icov2 = inv(res1);
xmean = mean(x);
x_minus_m = (x-xmean);
distancia2 = (x_minus_m)*icov2*(x_minus_m)';
mahal2 = sqrt(diag(distancia2));
C2=prctile(mahal2,95);
I2=find(mahal2>=C);
%%
% covarianza y media robustas
[idx,dm,mm,Ss,wval0,ndir] =kur_main(x);
M_dist = (x-mm)*inv(Ss)*(x-mm)';
mahal = sqrt(diag(M_dist));
C = prctile(mahal, 95);
I3 = find(mahal >= C);
%%
% salida idx
[idx,dm,mm,Ss,wval0,ndir] =kur_main(x);
I4 = find(idx==1);