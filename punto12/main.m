% p='fro';
p=inf;
% query = nombre de imagen de la persona
query = "camilo";
tam = 256;
names = dir("*");
n = size(names);
n = n(1);
imgs = single(zeros(n, tam, tam));
i = 1;
while i<=n
    if(isempty(strfind(names(i).name, '.jpg')) && isempty(strfind(names(i).name, '.PNG')) && isempty(strfind(names(i).name, '.jfif')))
        names = [names(1:i-1); names(i+1:n)];
        n = n-1;
        i = i-1;
    else
        img = rgb2gray(imread(names(i).name));
        img = single(imresize(img, [tam, tam]));
        imgs(i, :, :) = img;
    end
    i = i+1;
end

distances = zeros(n,1);
for i=1:n
    if ~(isempty(strfind(names(i).name, query)))
        idx = i;
        break
    end
end
distances(idx) = inf;
for i=1:n
    if isempty(strfind(names(i).name, query))
        distances(i) = norm(reshape(imgs(idx, :, :) - imgs(i, :, :), tam, tam), p);
    end
end

idx = find(distances == min(distances));
img = imread(names(idx).name);
hAxes = axes( figure );
hImage = imshow( img, 'Parent', hAxes );
title( hAxes,  names(idx).name);

%%
% vecindad de 5

lista = [distances, (1:n)'];
lista = sortrows(lista, 1);
lista = lista(1:5, 2);

for i=1:5
    img = imread(names(lista(i)).name);
    hAxes = axes( figure );
    hImage = imshow( img, 'Parent', hAxes );
    title( hAxes,  names(lista(i)).name);
end