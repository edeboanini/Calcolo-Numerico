function p = newtonCotes(n)
%
%   c = newtonCotes(n);
%   Funzione che calcola i valori dei pesi per la formula di Newton-Cotes di grado n.
%
%   Input: n - grado della formula
%   Output: p - vettore dei pesi risultante
%
    if nargin < 1
        error('Errore: parametri in ingresso insufficienti');
    elseif n < 1
        error('Errore:Parametri in ingresso sbagliati');
    end
    
    k = n+1:-1:1;
    p = zeros(1,n+1);
    for i=0:n
        d = [0:i-1 i+1:n];
        den = prod(i - d);
        alpha = poly(d);
        alpha = [alpha ./ k 0];
        p(i+1) = polyval(alpha,n) / den;
    end
return