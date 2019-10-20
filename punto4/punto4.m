function [R, D, max_valores, media] = punto4(n, show)
%PUNTO4 Simulación de valores aleatorios
%   de una distribución normal bivariante.
%   donde n es el número de valores aleatorios y show
%   es un boleano para ver el gráfico de los datos.

% el vector de medias inicial.
mu = [2 3];

% la matriz de inicial covarianza.
sigma = [1 1.5; 1.5 3];

% generación de aleatoria.
R = mvnrnd(mu, sigma, n);
x = R(:,1);
y = R(:,2);

% calcular las distancias de cada dato a su media.
media = mean(R);

% calcular distancia de cada a la media
D = (R - media).^2;
%D = max(abs(x),abs(y));
%D = (abs(R) + abs(media)).^2;

% calcular el epsilon del 10% de las mayores distancias
p_length = (length(D) * 0.1);
[max_valores, indices] = maxk(D,p_length);

% obtener los puntos de la informacion principal que tienen mas distancia.
r = R(indices,:);
x1 = r(:,1);
y1 = r(:,2);

if(show == true)
    figure
    % para graficar los datos iniciales
    plot(x, y,'bo');
    hold on
    % para graficar la ubicación de la media.
    plot(media(:,1),media(:,2),'g+','MarkerSize',10);
    
    % para graficar los outlayers.
    plot(x1, y1, 'ro');
    
    hold off
    
    pause   
    close
end

end
