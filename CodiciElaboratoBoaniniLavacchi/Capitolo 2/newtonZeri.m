function [x,count] = newtonZeri(x0,f,df,tol,itmax)
%
% [x,it] = newtonZeri(x0,f,df,tol,itmax)
% funzione che ricerca gli zeri della funzione f tramite il metodo di Newton con approssimazione iniziale x0
%
% input: x0- approssimazione iniziale della radice
%        f- funzione per cui si ricercano gli zeri
%        df- derivata di f
%        tol- tolleranza
%        itmax- massimo numero di iterazioni
%
% output: x- radice
%         count- numero iterazioni
%
if nargin~=5,error("input errato"),end;
if tol<0,error('Errore tolleranza: la tolleranza deve essere maggiore di 0.'),end;
if itmax<=0
    error('Errore numero iterazioni: le iterazioni devono essere maggiori di 0.');
end;
count=0;
x = x0;

for i=1:itmax
    x0 = x;
    fx0 = feval(f,x0);
    dfx0 = feval(df,x0);
    count=count+1;
    if dfx0==0, error('Errore derivata prima uguale a 0'),end;
    x = x0-(fx0/dfx0);
    if abs(x-x0)<=tol
        break
    end
end
if abs(x-x0)>tol
    disp("Il metodo non converge");
end
return
end