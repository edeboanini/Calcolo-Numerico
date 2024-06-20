function x = trilu(a, b, c, x)
% Risolve un sistema lineare tridiagonale fattorizzabile LU.
%
% x = trilu(a, b, c, x)
%
% Input: a- vettore degli elementi diagonali
%       b- vettore degli elementi sottodiagonali
%       c- vettore degli elementi sopradiagonali
%       x- vettore dei termini noti
%
% Output: x- soluzione
%
n = length(a);
for i = 1:n-1
b(i) = b(i)/a(i);
a(i+1) = a(i+1) - b(i)*c(i);
x(i+1) = x(i+1) - b(i)*x(i);
end
x(n) = x(n)/a(n);
for i = n-1:-1:1
x(i) = (x(i) - c(i)*x(i+1))/a(i);
end
return
end