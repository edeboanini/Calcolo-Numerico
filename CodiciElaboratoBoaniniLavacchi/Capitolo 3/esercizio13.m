% Inizializzazione dei dati
A = [7 2 1; 8 7 8; 7 0 7; 4 3 3; 7 0 10];
b = [1; 2; 3; 4; 5];

% Vettore dei pesi 
omega = [0.5; 0.5; 0.75; 0.25; 0.25];

% Normalizzazione dei pesi in modo che la somma sia 1
omega = omega ./ 2.25;

% Calcolo della matrice dei pesi B
B = diag(sqrt(omega));

% Risoluzione del sistema utilizzando QR
[x, nr] = miaqr(B*A, B*b);

disp("Soluzione trovata per il sistema sovradeterminato:");
disp(x);

disp("Norma del vettore residuo:");
disp(nr);



