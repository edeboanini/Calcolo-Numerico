ascisse=[0,2.5,5];
a=0;
b=5;
f = @(x) exp(x/2 + exp(-x));
df = @(x) exp(x/2 + exp(-x)) .* (1/2 - exp(-x));
d2f = @(x) exp(x/2 + exp(-x)) .* ((1/2 - exp(-x)).^2 + exp(-x));

%genero i valori di x nell'intervallo [a,b] e calcolo i valori delle
%funzioni
x = linspace(a,b, 10001);
y = f(x);
dy = df(x);
d2fi = d2f(ascisse);

fi=f(ascisse);
dfi=df(ascisse);
%calcolo l'interpolazioni
yy=hermite(ascisse,fi,dfi,x);

% Grafico di f(x)
figure;
plot(x, y, 'g', "LineWidth", 2);
hold on;
plot(x, yy, 'r-.', "LineWidth", 2);
set(gca, 'XMinorGrid', 'on');
set(gca, 'YMinorGrid', 'on');
%evidenzio i punti di interesse
scatter(ascisse, fi, 100, 'r', 'filled');
for i = 1:length(ascisse)
    text(ascisse(i), fi(i), sprintf('(%0.2f, %0.2f)', ascisse(i), fi(i)), ...
        'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
end
xlabel('x');
ylabel('f(x)');
title('Grafico di f(x) con interpolazione Hermite e punti interpolazione');
legend('f(x)', 'Interpolazione Hermite', 'Punti interpolazione');
grid on;
zoom on; 

% Grafico della derivata prima
figure;
plot(x, dy, "g", "LineWidth", 2);
hold on;
set(gca, 'XMinorGrid', 'on');
set(gca, 'YMinorGrid', 'on');
% Calcolo delle differenze divise per Hermite
coeff = repelem(fi, 2);
for i = 1:length(dfi)
    coeff(i*2) = dfi(i);
end
n = length(ascisse) - 1;
for j = (2*n+1):-2:3
    coeff(j) = (coeff(j) - coeff(j-2)) / (ascisse((j+1)/2) - ascisse((j-1)/2));
end
for j = 2:2*n+1
    for i = (2*n+2):-1:j+1
        coeff(i) = (coeff(i) - coeff(i-1)) / (ascisse(round(i/2)) - ascisse(round((i-j)/2)));
    end
end

ascHerm = repelem(ascisse, 2);

y1herm = horner(ascHerm, coeff, 0);
y2herm = horner(ascHerm, coeff, 2.5);
y3herm = horner(ascHerm, coeff, 5);
yherm = [y1herm, y2herm, y3herm];

fherm = hermite(ascisse, yherm, d2fi, x);

plot(x, fherm, "r-.", "LineWidth", 2);

% evidenzio i punti di interesse
scatter(ascisse, dfi, 100, 'r', 'filled');
for i = 1:length(ascisse)
    text(ascisse(i), dfi(i), sprintf('(%0.2f, %0.2f)', ascisse(i), dfi(i)), ...
        'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
end

xlabel('x');
ylabel('df(x)');
title('Grafico di df(x) con interpolazione Hermite e punti interpolazione');
legend('df(x)', 'Interpolazione di Hermite', 'Punti interpolazione');
grid on;
zoom on;