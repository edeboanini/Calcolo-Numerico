function x = mialu(A, b)
    % x=mialu(A,b) Metodo di fattorizzazione LU con pivoting paarziale
    % Input: -A: matrice nxn
    %        -b: vettore dei termini noti
    % Output: -x: soluzione del sistema Ax=b

    %vari controlli
    [m,n]=size(A);
    if m~=n, error('La matrice deve essere quadrata'), end;
    if length(b)~=n, error('Dimensione del vettore b sbagliata'), end;

    for i=1:n-1
        if A(i,i) == 0
            error('Matrice singolare');
        end
        A(i+1:n,i) = A(i+1:n,i) / A(i,i);
        A(i+1:n,i+1:n) = A(i+1:n,i+1:n) - A(i+1:n,i) * A(i,i+1:n);
    end
    
    x = b(:);
    % Risoluzione per L
    for i=2:n
        x(i:n) = x(i:n) - A(i:n,i-1) * x(i-1);
    end
    
    % Risoluzione per U
    for i=n:-1:1
        x(i) = x(i) / A(i,i);
        x(1:i-1) = x(1:i-1) - A(1:i-1,i) * x(i);
    end

end
