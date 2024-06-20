%tolleranze
toll=[1e-3;1e-6;1e-9;1e-12];
%funzione
f=@(x) exp(x) - cos(x);
%derivata della funzione
f1=@(x) exp(x) +sin(x);
%intervallo confidenza per metodo bisezione
a=-0.1;
b=1;
%approssimazioni iniziali
x0=1;
x1=0.9;

for i=1:length(toll)
    [x_b,count_b]=bise(a, b, f, toll(i));
    [x_n, count_n]=newtonZeri(x0,f,f1,toll(i),1000);
    [x_s,count_s]=sec(x0,x1,f,toll(i),1000);
    
    radici=[x_s;x_b;x_n];
    countazioni=[count_s;count_b;count_n];
    disp("tolleranza = "+toll(i));
    metodo=["secanti";"bisezione";"newton"];
    
    t=table(metodo,radici,countazioni);
    disp(t);
end