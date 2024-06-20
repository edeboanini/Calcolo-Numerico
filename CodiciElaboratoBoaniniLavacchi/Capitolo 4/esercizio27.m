rng(0);
xi = linspace(0, 2*pi, 101);
yi = sin(xi) + rand(size(xi)) * 0.05;

% Calcolo dei coefficenti del polinomio di grado 3
grado_polinomio = 3;
coefficenti_minimi_quadrati = polyfit(xi, yi, grado_polinomio);

% Mostra i coefficienti calcolati
disp('Coefficenti del polinomio di approssimazione:');
disp(coefficenti_minimi_quadrati);

% Valutazione del polinomio nei punti xi
yi_polyval = polyval(coefficenti_minimi_quadrati, xi);

% Grafico dei dati e del polinomio di approssimazione
figure;
plot(xi, yi, 'm-', 'LineWidth', 1.5, 'DisplayName', 'Dati perturbati');
hold on;
plot(xi, yi_polyval, 'k-', 'LineWidth', 2, 'DisplayName', 'Polinomio di approssimazione');
xlabel('x');
ylabel('y');
title('Approssimazione ai minimi quadrati di grado 3');
legend('show', 'Location', 'northwest');
grid on;