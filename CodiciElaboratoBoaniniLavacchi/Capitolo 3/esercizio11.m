% Inizializza il vettore per il condizionamento
condizionamento = ones(15, 1);

% Intestazione della tabella
fprintf('%-12s %-20s %-20s\n', 'Dimensione', 'Condizionamento', 'Soluzione');
fprintf('%-12s %-20s %-20s\n', '-----------', '---------------', '---------------');


% Ciclo per n da 1 a 15
for n = 1:15
    % Inizializza la matrice A come vuota
    A = [];

    % Costruisci la matrice A
    for riga = 1:n
        nuova_riga = ones(1, n);  % Crea una nuova riga di 1
        for colonna = 1:n
            if riga > colonna
                nuova_riga(colonna) = 10^(riga - colonna);
            end
        end
        A = [A; nuova_riga];  % Aggiungi la nuova riga alla matrice A
    end

    % Inizializza il vettore b
    b = ones(n, 1);
    for riga = 1:n
        b(riga) = (n - riga) + ((10^riga) - 1) / 9;
    end

    % Risolvi il sistema utilizzando la funzione mialu
    solSistema = mialu(A, b);

    % Calcola il condizionamento della matrice A
    condizionamento(n) = cond(A);

    % Stampa la riga della tabella
    fprintf('%-12d %-20.4e %-20.4f\n', n, condizionamento(n), solSistema(n));
end