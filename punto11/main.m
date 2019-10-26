p='fro';
% p=inf;
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
        img = rgb2gray(imread(strcat(carp, names(i).name)));
        img = single(imresize(img, [tam, tam]));
        imgs(i, :, :) = img;
    end
    i = i+1;
end

distances = zeros(n,n) + inf;
means = zeros(n, 1);
for i=1:n
    for j=1:n
        if j~=i
            t = reshape(imgs(i,:,:)-imgs(j, :, :), tam, tam);
            distances(i,j) = norm(t, p);
        end
    end
    means(i) = mean([distances(i, 1:i-1), distances(i, i+1:n)]);
end

idx = find(means == min(means));
img = imread(strcat(carp, names(idx).name));
imshow(img)

% imshow(reshape(imgs(idx, :, :), tam, tam))
% imshow(reshape(imgs(1, :, :), tam, tam))

% enconrtar vecinos mas cercanos
%for i=1:n
%    idx = find(distances(i, :) == min(distances(i, :)));
%    disp(strcat(strcat(names(i).name, ":"), names(idx).name))
%end

%I1=imread('jamsha.jfif');
%IG=rgb2gray(I1);
%IGR = imresize(IG, [256, 256]);

%I2 = imread('daddy_yankee.jpg');
%IG2 = rgb2gray(I2);
%IGR2 = imresize(IG2, [256, 256]);
%t = single(IGR-IGR2);
%d1 = norm(t, p)

%I3 = imread('jose_10.jpg');
%IG3 = rgb2gray(I3);
%IGR3 = imresize(IG3, [256, 256]);
%t = single(IGR2-IGR3);
%d2 = norm(t, p)

%t = single(IGR3-IGR);
%d3 = norm(t, p)