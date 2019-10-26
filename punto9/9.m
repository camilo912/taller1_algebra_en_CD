data = read_data();
data_b = data >= 0;
medias = mean(data_b);
medias_b = medias >= 0;
dist = zeros(size(data, 1), 1);
for i=1:size(data, 1)
    dist(i) = 1 - sum(data_b(i, :) & medias_b) / sum(data_b(i, :) | medias_b);
end
l = prctile(dist, 95);
out = find(dist>=l);

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
