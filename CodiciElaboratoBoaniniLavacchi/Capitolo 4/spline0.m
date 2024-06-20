function yy = spline0(x, y, xq)
% 
% yy = spline0(x, y, xq)
%funzione che calcola la spline cubica naturale nei punti di interpolazione
%
% input: x-vettore delle x
%       y- valori che prende la funzione nelle x
%       xq- vettore dei punti in cui va calcolato il polinomio
% output: yy-valori della spline nei punti xq
if nargin < 3
    error('parametri in ingresso insufficienti');
end
n = length(x);
if n ~= length(y)
    error('parametri in ingresso errati');
end
n = n - 1;
h = zeros(1, n);
for i = 1:n
    h(i) = x(i+1) - x(i);
end
dd = y;
% calcolo differenze divise
for j = 1:2
    for i = n+1:-1:j+1
        dd(i) = (dd(i)- dd(i-1)) / (x(i) - x(i - j));
    end
    if j == 1
        dd1f = dd(2:end); 
        % dd1f contiene le differenze divise f[x(k-1),x(k)], k = 2:n
    end
end
phi = h(2:n-1) ./ (h(2:n-1) + h(3:n));
csi = h(2:n-1) ./ (h(1:n-2) + h(2:n-1));
a(1:n-1) = 2;
m = zeros(1, n + 1);
m(2:n) = trilu(a, phi, csi, 6 * dd(3:end));
yy = zeros(1,length(xq));
for j = 1:length(xq)
    if xq(j) >= x(1) && xq(j) <= x(n+1)
        for k=2:n+1
            if xq(j) <= x(k)
                i = k-1;
                break
            end
        end
        ri = y(i) - (h(i) ^ 2) / 6 * m(i);
        qi = dd1f(i) - h(i) / 6 * (m(i+1) - m(i));
        yy(j) = ((xq(j) - x(i)) ^ 3 * m(i+1) + (x(i+1) - xq(j)) ^ 3 * m(i)) ...
            / (6 * h(i)) + qi * (xq(j) - x(i)) + ri;
    end
end
return