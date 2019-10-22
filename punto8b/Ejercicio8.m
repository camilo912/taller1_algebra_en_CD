A = readmatrix('data.txt');
data =  A(:,2:101);
rowMean = (mean(data'))';
%% Datos Binarios

binMean = (rowMean > 0);
X = zeros(1,100);
binData = data > X;

%% Jaccard ejemplo
a = binMean.*binData;
aa = sum(a == ones(1,100));
b = binMean < binData;
bb = sum(b == ones(1,100));
c = binMean > binData;
cc = sum(c == ones(1,100));
d = (binMean+binData);
dd = sum(d == zeros(1,100));
result_jaccard = aa./(aa+bb+cc);
result_pearson = ((aa.*dd)-(bb.*cc))./sqrt(((aa+cc).*(bb+dd).*(aa+bb).*(cc+dd)));
result_dice = 2.*(aa)./(2.*aa+bb+cc);
%% se añaden las distancias con su correspondiente activo
jaccard_with_id = [];
pearson_with_id = [];
dice_with_id = [];
for i=1:100
    jaccard_with_id = [jaccard_with_id;[i result_jaccard(1,i)]];
    pearson_with_id = [pearson_with_id; [i result_pearson(1,i)]];
    dice_with_id = [dice_with_id; [i result_dice(1,i)]];
end
%% Activos mas parecidos
salida1 = sortrows(jaccard_with_id,2);
salida1(1:10,:)
salida2 = sortrows(pearson_with_id,2);
salida2(90:100,:)
salida3 = sortrows(dice_with_id,2);
salida3(1:10,:)
%% Activos menos parecidos
salida1(90:100,:)
salida2(1:10,:)
salida3(90:100,:)

