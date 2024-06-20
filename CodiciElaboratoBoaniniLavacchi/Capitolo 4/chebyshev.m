function x = chebyshev(n,a,b)
% x = chebyshev(n,a,b)
% funzione per il calcolo delle ascisse di Chebyshev
%
% input: n- grado del polinomio
%       [a,b]- estremi dell'intervallo
% output: x- vettore contenente le ascisse di chebyshev

if(a>=b)
    error('valori di intervallo errati');
end;
if(n<0)
    error('grado del polinomio errato');
end;
x = (a+b)/2+((b-a)/2)*cos(pi*(2*(n:-1:0)+1)./(2*(n+1)));
end