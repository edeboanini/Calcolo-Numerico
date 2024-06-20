function x = mialdl(A,b)
%
% x = mialdl(A,b)
%
% Dati in ingresso una matrice sdp A ed un vettore b, calcolare la
% soluzione del corrispondente sistema lineare utilizzando la
% fattorizzazione LDL^t
%
% input: - A: matrice dei coefficienti
%        - b: vettore dei termini noti
%
% output: x - soluzione del sistema Ax=b
%
[m,n] = size(A);
if m~=n
   error('La matrice A deve essere quadrata. Verifica le dimensioni di A');
end
if m~=length(b)
   error('Le dimensioni della matrice A e del vettore b non sono compatibili');
end
if A(1,1)<=0
   error('La matrice A deve essere simmetrica e definita positiva');
end
% Fattorizzazione LDL^t
A(2:n,1)=A(2:n,1)/A(1,1);
for i=2:n
   v= (A(i,1:i-1).').* diag(A(1:i-1,1:i-1));
   A(i,i) = A(i,i) - A(i,1:i-1)*v;
   if A(i,i)<=0
       error('La matrice A deve essere simmetrica e definita positiva');
   end
   A(i+1:n,i) = (A(i+1:n,i)- A(i+1:n,1:i-1)*v)/A(i,i);
end
%Risoluzione del sistema lineare
x=b;
for i=1:n
   x(i+1:n) = x(i+1:n)-(A(i+1:n,i)*x(i));
end
x = x ./ diag(A);
for i=n:-1:2
   x(1:i-1) = x(1:i-1)-A(i,1:i-1).'*x(i);
end
end
