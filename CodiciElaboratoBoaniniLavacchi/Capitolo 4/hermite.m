function yy = hermite(xi,fi,f1i,xx)
% yy = hermite(xi,fi,f1i,xx)
% funzione che implementa la forma di hermite del polinomio interpolante una funzione
%
% input:xi- vettore delle coordinate x
%       fi- valori della funzione alle coordinate x
%       f1i- valori delle derivate della funzione nei punti x
%       xx- vettore dei punti in cui il polinomio interpolante va calcolato
%
% output:yy- polinomio interpolante in forma di Newton

n= length(xi);
if n~= length(fi) ||length(f1i)~= n || n<= 0
    error("Dimensioni dei dati in input errate");
end
if length(unique(xi))~=n
error("Valori delle ascisse non distint tra di loro");
end
fi = repelem (fi,2);
for i= 1: length(f1i)
    fi(i*2) = f1i(i);
end
%calcolo differenze divise
n=length(xi)-1;
for j=(2*n+1): -2: 3
    fi(j)= (fi(j)- fi(j-2))/(xi((j+1)/2) - xi((j-1)/2));
end
for j= 2: 2*n+1
    for i=(2*n+2): -1: j+1
        fi(i)=(fi(i)- fi(i-1)) / ( xi(round(i/2))-xi(round((i-j)/2)));
    end
end
%calcolo polinomio interpolante
n=length(fi)-1;
yy= fi(n+1)*ones(size(xx));
for i = n : -1:1
    yy= yy .*(xx- xi(round(i/2)))+fi(i) ;
end
return
end