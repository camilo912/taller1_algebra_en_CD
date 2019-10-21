function [maxPDP,minPDP, maxPDJ, minPDJ, maxPDD,minPDD] ...
    = binary_dist_parecidos(DP, DJ, DD, n)
%BINARY_DIST_ calcula los elementos más parecidos según cada distancia
%   binaria. Siendo n el numero de valores mas parecidos o distintos.

[maxPDP, ~] = maxk(DP, n);
[minPDP, ~] = mink(DP, n);

[maxPDJ, ~] = maxk(DJ, n);
[minPDJ, ~] = mink(DJ, n);

[maxPDD, ~] = maxk(DD, n);
[minPDD, ~] = mink(DD, n);

end
