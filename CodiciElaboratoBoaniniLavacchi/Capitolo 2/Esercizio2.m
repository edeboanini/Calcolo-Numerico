% Definisci i limiti del tuo intervallo x
x1 = 1; x2 = 4/3 - 0.01; % Intervallo a sinistra dell'asintoto
x3 = 4/3 + 0.01; x4 = 5/3; % Intervallo a destra dell'asintoto
% Usa linspace per generare i valori x
x=linspace(x1,x4,100001);
% Calcola i corrispondenti valori y
y= 1 + x.^2 + (log(abs(3*(1 - x) + 1)))/80;
%calcolo i valori dei limiti della funzione in 4/3
x_sx=1 + x2.^2 + (log(abs(3*(1 - x2) + 1)))/80
x_dx=1 + x3.^2 + (log(abs(3*(1 - x3) + 1)))/80
% Crea il grafico
figure
plot(x,y,'b')
hold on
title('Grafico di f(x) = 1 + x^2 + log(|3(1 - x) + 1|)/80')
xlabel('x')
ylabel('f(x)')
grid on
% Trovare il minimo della funzione
[min_val, min_idx] = min(y);
min_x = x(min_idx);

plot(min_x,min_val,'bo')
text(min_x, min_val, ' minimo','VerticalAlignment','top', 'HorizontalAlignment','left', 'FontSize',10,'Color','b');
fprintf('Il minimo della funzione si ottiene per x = %f, dove f(x) = %f\n', min_x, min_val);
fprintf('Limite sinistro:%f',x_sx);
fprintf('Limite destro:%f',x_dx);