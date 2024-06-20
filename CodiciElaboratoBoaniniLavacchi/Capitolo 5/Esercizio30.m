f = @(x) exp(3 * x);
F = @(x) exp(3 * x) / 3;
a = 0;
b = 1;
IntEsatto = F(b) - F(a);  % Valore esatto dell'integrale
format long
k = [1, 2, 3, 6];
n = 12;

If = zeros(size(k));
err = zeros(size(k));
% Calcolo l'integrale usando il metodo di Newton-Cotes composito per ciascun k
for i = 1:length(k)
    [If(i), err(i)] = composita(f, a, b, k(i), n);
end

disp('Valore esatto:');
disp(IntEsatto);
err1 = (IntEsatto - If);

T = table(k', If', err', err1', ...
          'VariableNames', {'k', 'Integr_Approx', 'Errore_Stimato', 'Errore_Effettivo'});
disp(T);