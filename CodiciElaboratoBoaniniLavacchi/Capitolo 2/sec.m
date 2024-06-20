function [x,count] = sec(x0,x1,f,tol,itmax)
%
% [x,it] = sec(x0,x1,f,tol,itmax)
% funzione che ricerca gli zeri della funzione f tramite il metodo delle secanti con le approssimazioni iniziale x0 e x1.
%
% input:x0- approssimazione iniziale della radice
%       x1- seconda approssimazione radice
%       f- funzione per cui si ricercano gli zeri
%       tol- tolleranza
%       itmax- massimo numero di iterazioni
%
% output:x- radice
%        count- numero iterazioni
%
if nargin~=5,error("input errato"),end;
if tol<=0,error("tolleranza non adeguata"),end;
if itmax<=0,error("num it non adeguato"),end;
count=0;
fx0=feval(f,x0);
fx1=feval(f,x1);

for i=1:itmax
    if fx1==fx0
        error("approssimazione errata");
    end
    x=(fx1*x0-fx0*x1)/(fx1-fx0);
    count=count+1;
    if abs(x-x1)<=tol
        break
    elseif i<itmax
        x0=x1;
        fx0=fx1;
        x1=x;
        fx1=feval(f,x1);
    end
end
if abs(x-x1)>tol
    error("tolleranza non rispettata");
end

return
end