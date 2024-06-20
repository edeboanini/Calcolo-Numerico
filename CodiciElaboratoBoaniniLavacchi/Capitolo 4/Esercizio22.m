
nn=1:100;
%costante di Lebesgue per ascisse di Chebyshev
cheb1 = lebesgue(0, 1, nn, 1);
cheb2 = lebesgue(-5, 8, nn, 1);
%costante di Lebesgue per ascisse equidistanti
leb1 = lebesgue(0, 1, nn, 0);
leb2 = lebesgue(-5, 8, nn, 0);

% Grafico Equidistante aintervallo [0,1]
figure;
plot(nn, leb1, 'b.');
title('Equidistante- Intervallo [0,1]');
xlabel('Grado del polinomio');
ylabel('Costante di Lesbegue');
grid on;
set(gca, 'XMinorGrid', 'on');
set(gca, 'YMinorGrid', 'on');

% Grafico Equidistante intervallo [-5,8]
figure;
plot(nn, leb2, 'b.');
title('Equidistante- Intervallo [-5,8]');
xlabel('Grado del polinomio');
ylabel('Costante di Lesbegue');
grid on;
set(gca, 'XMinorGrid', 'on');
set(gca, 'YMinorGrid', 'on');

% Grafico Chebyshev intervallo [0,1]
figure;
plot(nn, cheb1, 'r.');
title('Chebyshev- Intervallo [0,1]');
xlabel('Grado del polinomio');
ylabel('Costante di Lesbegue');
grid on;
set(gca, 'XMinorGrid', 'on');
set(gca, 'YMinorGrid', 'on');

% Grafico Chebyshev intervallo [-5,8]
figure;
plot(nn, cheb2, 'r.');
title('Chebyshev- Intervallo [-5,8]');
xlabel('Grado del polinomio');
ylabel('Costante di Lesbegue');
grid on;
set(gca, 'XMinorGrid', 'on');
set(gca, 'YMinorGrid', 'on');