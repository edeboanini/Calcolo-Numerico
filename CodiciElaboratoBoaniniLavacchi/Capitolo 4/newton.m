function pn = newton(X, Y, XQ)
% pn = newton(X, Y, XQ)
%
% function che implementa la forma di Newton del polinomio 
% interpolante una funzione
%
% Input: X - vettore delle ascisse
%        Y - vettore dei valori della funzione
%        XQ - vettore dei punti in cui calcolare il polinomio
%
% Output: pn - polinomio interpolante in forma di Newton
%
if length(X) ~= length(Y) || length(X) <= 0
    error('Dati non corretti');
end 

% Verifica che i valori in X siano distinti
if length(unique(X)) ~= length(X)
    error('I valori di X devono essere distinti');
end

% Calcola le differenze divise usando la function differenzeDivise
dd = differenzeDivise(X, Y);
n = length(dd) - 1;

pn = dd(n+1) * ones(size(XQ));

% Costruisci il polinomio interpolante di Newton
for i = n:-1:1
    pn = pn.*(XQ- X(i)) + dd(i);
end
return
end