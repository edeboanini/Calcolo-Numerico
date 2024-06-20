function dd = differenzeDivise(x, f)
% dd = differenzeDivise(x, f)
% 
% function che calcola le differenze divise in (x_i, f_i)
%
% Input: x - vettore delle ascisse
%        f - vettore delle ordinate
%
% Output: dd - vettore delle differenze divise
%
% Numero di dati nel vettore x
k = length(x);
if length(f) ~= k
    error('I vettori x e f devono avere la stessa dimensione');
end

k = k - 1;

% Inizializza il vettore delle differenze divise con i valori di f
dd = f;

% Calcola le differenze divise
for j = 1:k
    for i = k+1:-1:j+1
        % Formula per calcolare le differenze divise
        dd(i) = (dd(i) - dd(i-1)) / (x(i) - x(i-j));
    end 
end