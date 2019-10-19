%NORMA 1
I1=imread('IMG_2316.jpeg');
IG=double(rgb2gray(I1));
i = 1;
p = 1;
while 1
    if i > 1
        IP_a = IP;
    end
    IP=IG+1000/(i);
    if i <= 10 || i == 1000
        imshow(cast(IP, 'uint8'))
    end
    if i > 1
        diff = IP_a - IP;
        d = norm(double(diff), p);
        disp(d)
    end
    if i > 1 && d < 0.01
        imshow(cast(IP_a, 'uint8'))
        break
    end
    i = i+1;
end
%%
%NORMA 2
i=1;
p = 2;
while 1
    if i > 1
        IP_a = IP;
    end
    IP=IG+10/(i);
    if i <= 10 || i == 1000
        imshow(cast(IP, 'uint8'))
    end
    if i > 1
        diff = IP_a - IP;
        d = norm(double(diff), p);
        disp(d)
    end
    if i > 1 && d < 0.01
        imshow(cast(IP_a, 'uint8'))
        break
    end
    i = i+1;
end
%%
%NORMA INF
i=1;
p = inf;
while 1
    if i > 1
        IP_a = IP;
    end
    IP=IG+1000/(i);
    if i <= 10 || i == 1000
        imshow(cast(IP, 'uint8'))
    end
    if i > 1
        diff = IP_a - IP;
        d = norm(double(diff), p);
        disp(d)
    end
    if i > 1 && d < 0.01
        imshow(cast(IP_a, 'uint8'))
        break
    end
    i = i+1;
end
%%
%NORMA FROBENIUS
i=1;
p = 'fro';
while 1
    if i > 1
        IP_a = IP;
    end
    IP=IG+1000/(i);
    if i <= 10 || i == 1000
        imshow(cast(IP, 'uint8'))
    end
    if i > 1
        diff = IP_a - IP;
        d = norm(double(diff), p);
        disp(d)
    end
    if i > 1 && d < 0.01
        imshow(cast(IP_a, 'uint8'))
        break
    end
    i = i+1;
end