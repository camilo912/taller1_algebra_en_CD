function binary_dist_plot(DP,DJ,DD)
%BINARY_DIST_PLOT grafica los elementos en histograma y comparacion de los
%   mismos.

figure(1);
histogram(DP);
title("Pearson");

figure(2);
histogram(DJ);
title("Jaccard");

figure(3);
histogram(DD);
title("Dice");

figure(4);
title("Pearson vs Jaccard vs Dice");
hold on
histogram(DP);
histogram(DJ);
histogram(DD);
hold off

end
