function ll = lebesgue( a, b, nn, type )
% 
% ll = lebesgue( a, b, nn, type)
%Funzione che approssima la costante di Lebesgue
%
% Input:a,b- estremi dell'intervallo, rispettivamente inferiore e superiore
%       nn- grado del polinomio
%       type- o 0 o 1, per il tipo di ascisse di interpolazione da usare
%
% Output:ll- approssimazione della costante di Lebesgue

if nn<= 0
    error('grado non valido');
end
if a>= b
    error('Estremi errati');
end
if type~=0 && type~=1
    error('Valore di type non corretto');
end
fi=linspace(a,b,10001);
ll= zeros(1, length(nn));
for i=1:length(nn)
    if type==0
        x = linspace (a,b, nn(i));
    else
        x=chebyshev(nn(i),a,b);
    end
    lan= zeros(1,length(fi));
    %calcolo del polinomio di lagrange
    for k=1:length(x)
        lin = ones(size(fi));

        for j=1:length(x)
            if k~=j
                lin = lin .*((fi-x(j))/(x(k)-x(j)));

            end
        end
    lan = lan + abs(lin);
    end
    %calcolo della costante di lebesgue
    ll(i) = max(lan);
end
end