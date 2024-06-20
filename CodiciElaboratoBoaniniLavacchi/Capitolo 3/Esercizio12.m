
valori_n = 1:100;
figure;
for k = 1:length(valori_n)
    n = valori_n(k);
    A = ones(n);

    for i = 1:n
        for j = 1:n
            if (i ~= j)
                A(i,j) = -A(i,j);
            else
                A(i,j) = n;
            end
        end
    end
    A = mialdlt(A);
    diagonal_elements = diag(A);

    if  n==1||mod(n,1)==0
        plot(1:n, diagonal_elements,'.');
        hold on;
    end
end

xlabel('Indice dellla diagonale');
ylabel('Valore dei fattori di D');
title('Esercizio 12');

