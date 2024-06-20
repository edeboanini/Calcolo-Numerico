% Tolleranze
toll=[1e-3;1e-6;1e-9;1e-12];

% Funzione
f=@(x) exp(x) - cos(x) + sin(x) - x*(x+2);

% Derivata della funzione
f1=@(x) exp(x) + sin(x) + cos(x) -2*x -2;

% Intervallo confidenza per metodo bisezione
a=-0.1;
b=1;

% Approssimazioni iniziali
x0=1;
x1=0.9;

% Molteplicità della radice m=5
%Vettori di appoggio
radici=ones(4,1);
iterazioni=ones(4,1);

%Metodo Secanti
disp("Metodo Secanti");
for i=1:length(toll)
    [x_sec,it_sec]=sec(x0,x1,f,toll(i),1000);    
    radici(i)=x_sec;
    iterazioni(i)=it_sec;
end
t=table(radici,iterazioni,toll,'VariableNames',{'Radici','Iterazioni','Tolleranza'});
disp(t);

%Metodo Bisezione
disp("Metodo Bisezione");
for i=1:length(toll)
    [x_b,it_b]=bise(a,b,f,toll(i));
    radici(i)=x_b;
    iterazioni(i)=it_b;
end
t=table(radici,iterazioni,toll,'VariableNames',{'Radici','Iterazioni','Tolleranza'});
disp(t);
     
%Metodo Newton
disp("Metodo Newton");
for i=1:length(toll)
    try
        [x_n, it_n]=newtonZeri(x0,f,f1,toll(i),1000);
        radici(i)=x_n;
        iterazioni(i)=it_n;
    catch ME
        % Stampa il messaggio di errore
        disp(['Errore: ', ME.message]);
        radici(i) = NaN; 
        iterazioni(i) = NaN;
    end
end
t=table(radici,iterazioni,toll,'VariableNames',{'Radici','Iterazioni','Tolleranza'});
disp(t);

%Metodo Newton Modificato
disp("Metodo Newton Modificato");
for i=1:length(toll)
    try
        [x_nm,it_nm]=newtonModificato(x0,f,f1,5,toll(i),1000);
        radici(i)=x_nm;
        iterazioni(i)=it_nm;
    catch ME
        % Stampa il messaggio di errore
        disp(['Errore: ', ME.message]);
        radici(i) = NaN; 
        iterazioni(i) = NaN; 
    end
 end
 t=table(radici,iterazioni,toll,'VariableNames',{'Radici','Iterazioni','Tolleranza'});
 disp(t);