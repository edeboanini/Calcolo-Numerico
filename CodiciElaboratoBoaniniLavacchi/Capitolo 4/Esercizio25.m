f = @(x) 1 ./ (1 + x.^ 2);
a = -10;
b = 10;
x = linspace(a, b, 10001);
fx = f(x);
errKnot = zeros(1, 200); 
errNaturali = zeros(1, 200); 
h = zeros(1, 200);

index = 1; 
for n = 4:4:800
    xi = linspace(a, b, n+1); % Ascisse equidistanti
    fi = f(xi);
    
    % calcolo le spline e i loro rispettivi errori massimi
    splineKnot = spline(xi, fi, x);
    splineNat = spline0(xi, fi, x);
    
    errKnot(index) = max(abs(fx - splineKnot));
    errNaturali(index) = max(abs(fx - splineNat));
    h(index) = 20 / n;
    index = index + 1;
end

%Grafico gli errori
figure;
loglog(h, errKnot, 'g.-',h, errNaturali, 'r--' );
xlabel('h');
ylabel('Errore massimo');
title('Errore massimo di approssimazione usando spline naturali e not-a-knot');
legend('Naturale', 'Not-A-Knot');
grid on;
