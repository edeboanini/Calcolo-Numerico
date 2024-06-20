% Funzione di Runge
funzione_runge = @(x) 1./(1+x.^2);

% Intervallo di interesse
inizio_intervallo = -5;
fine_intervallo = 5;

punti_equispaziati = 10001;
xq = linspace(inizio_intervallo, fine_intervallo, punti_equispaziati);
gradi_polinomio = 2:2:100;

% Memorizzare gli errori
errori = struct('Lagrange', zeros(size(gradi_polinomio)), 'Newton', zeros(size(gradi_polinomio)));

% Calcolo dei valori esatti della funzione di Runge
valori_esatti = funzione_runge(xq);

% Ciclo per calcolare gli errori
for i = 1:length(gradi_polinomio)
    n = gradi_polinomio(i);

    % Calcolo delle ascisse di Chebyshev
    ascisse = chebyshev(n, inizio_intervallo, fine_intervallo);

    % Calcolo dei valori approssimati usando l'interpolazione di Lagrange e Newton con ascisse di Chebyshev
    val_lagrange = lagrange(ascisse, funzione_runge(ascisse), xq);
    val_newton = newton(ascisse, funzione_runge(ascisse), xq);

    % Calcolo dell'errore
    error_lagrange(i) = max(abs(valori_esatti - val_lagrange));
    error_newton(i) = max(abs(valori_esatti - val_newton));
end

% Grafico dell'errore in scala logaritmica
figure;

semilogy(gradi_polinomio, error_lagrange, '-r', 'LineWidth', 2);
hold on;
colore_verde = [0, 0.7, 0];
semilogy(gradi_polinomio, error_newton, '--', 'Color', colore_verde, 'LineWidth', 2);

xlabel('Grado del polinomio');
ylabel('Errore di interpolazione');
legend('Lagrange con Chebyshev', 'Newton con Chebyshev');
title('Interpolazione Lagrange e Newton con ascisse di Chebyshev');

grid on;
hold off;