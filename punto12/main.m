p='fro';
% p=inf;
% query = nombre de imagen de la persona
query = "1A";
tam = 256;
carp = "./fotos_interactiva/";
names = dir(carp);
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
        % img = rgb2gray(imread(strcat(names(i).name)));
        img = rgb2gray(imread(strcat(carp, names(i).name)));
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
img = rgb2gray(imread(strcat(carp, names(idx).name)));
hAxes = axes( figure );
hImage = imshow( img, 'Parent', hAxes );
title( hAxes,  names(idx).name);

%%
% vecindad de 5

lista = [distances, (1:n)'];
lista = sortrows(lista, 1);
lista = lista(2:6, 2);

for i=1:5
    subplot(1,5,i);
    img = rgb2gray(imread(strcat(carp, names(lista(i)).name)));
    imshow(img);
end