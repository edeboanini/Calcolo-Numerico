function [x, it] = newtonModificato(x0, f, f1, m, tolx, maxit)
%   
%  [x, it] = newtonModificato(x0, f, f1, m, tolx, maxit)
%  Funzione che implementa il metodo di Newton modificato per determinare
%  una approssimazione della radice
%   
%  Input: x0 - approssimazione iniziale della radice
%         f - funzione che implementa f(x)
%         f1 - funzione che implementa f'(x)
%         m - molteplicità della radice di f(x)
%         tolx - accuratezza richiesta (default = 1e-6)
%         maxit - numero massimo di iterazioni (default = 1000)
%
%  Output: x - approssimazione della radice di f(x);
%          it - num iterazioni
%    
    if nargin < 4
        error('Numero di parametri in ingresso errato');
    elseif nargin == 4
        tolx = 1e-6;
        maxit = 1000;
    elseif nargin == 5
        maxit = 1000;
    end
    if tolx < 0 || maxit <= 0
        error('Parametri in ingresso errati');
    end

    x = x0;
    for it = 1:maxit
        fx0  = feval(f, x);
        f1x0 = feval(f1, x);
        if f1x0 == 0
            error('La derivata prima si annulla');
        end
        x = x - m * (fx0 / f1x0);
        % Verifica della condizione di convergenza
        if abs(x - x0) <= tolx * (1 + abs(x0))
            break
        else
        x0 = x;
        end
        if it == maxit
            disp('Il metodo non converge.');
        end
    end
return