data = read_data();
data_b = data >= 0;
medias = mean(data_b);
medias_b = medias >= 0;
S = cov(data_b);
dm = sqrt(diag((data_b-medias_b)*inv(S)*(data_b-medias_b)'));
l = prctile(dm, 95);
out = find(dm>=l);

%%
% comparar con outliers del punto7, para esto es necesario tener cargado en
% el workspace los resultados del punto 7
mismos = zeros(4, 1);
% calcular iguales para I
for j=1:size(out,1)
    if(ismember(out(j), I))
        mismos(1) = mismos(1)+1;
    end
end

% calcular iguales para I2
for j=1:size(out,1)
    if(ismember(out(j), I2))
        mismos(2) = mismos(2)+1;
    end
end

% calcular iguales para I3
for j=1:size(out,1)
    if(ismember(out(j), I3))
        mismos(3) = mismos(3)+1;
    end
end

% calcular iguales para I4
for j=1:size(out,1)
    if(ismember(out(j), I4))
        mismos(4) = mismos(4)+1;
    end
end
%%
% z = zeros(1,100)
% bindata = x1 >= z
% covarianza3 = cov(bindata)
% icov3 = inv(covarianza3)
% xmean3 = mean(bindata)
% binMean = xmean3 >= 0.5
% x_minus_m3 = (bindata-binMean)
% distancia3 = (x_minus_m3)*icov3*(x_minus_m3)'
% mahal3 = sqrt(diag(distancia3))
% C3=prctile(mahal3,95)
% Ibin=find(mahal3>=C3);
