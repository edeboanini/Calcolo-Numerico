
function [x, nit] = newton(fun,x0,  tol, maxit)
%
% [x, nit] = newton(fun,xo, jacobian, tol, maxit)
%
% Metodo di newton per la risoluzione di sistemi di equazioni non lineari
% tramite il metodo di newton
%
% Input: fun-sistema di equazioni
%        x0- vettore valori iniziali
%       jacobian- matrice jacobiana del sistema
%       tol- tolleranza
%       maxit- numero massimo di iterazioni
%
% Output:X-soluzione del sistema
%       nit- numero di iterazioni eseguite
%Criterio d'arresto: |Xn+1 - Xn| <= tol * (1 + |Xn|)
% Controlli di consistenza
    if tol < 0
        error('Tolleranza non valida');
    end
    
    %Valori di default per i parametri in ingresso
    if nargin == 2
        tol = 1e-3;
        maxit = 1000;
    else if nargin == 3
        maxit = 1000;
    else if nargin<2
        error('numero di input errati');
    end;
    if maxit <= 0
        error('Numero di iterazioni non valido');
    end
    x = x0;
    for i=1:maxit
        x0 = x;
        [f,jacobiana]=feval(fun,x0);
        x = x0 + mialu(jacobiana, -f); % Fattorizzazione e aggiornamento di xn+1
        % controllo sul criterio di arresto
        if abs(x - x0) <= tol * (1 + abs(x0))
           
            break;
        end
    end
    nit = i;
    if abs(x - x0) > tol * (1 + abs(x0))
        disp('Tolleranza non raggiunta');
    end
    return
    end
end
