format long
n = 50;
x0 =zeros(n,1);
toll = [1e-3, 1e-8, 1e-13];
c = ['r', 'b', 'g'];
L = zeros(50, 3);
for i = 1:length(toll)
    [x,nit] = newton(@fun, x0, toll(i),1000);
    figure;
    plot(1:n, x, '-', Color=c(i));
    title('Tolleranza',num2str(toll(i)));
    xlabel('Indice radice');
    ylabel('Valore di x');
    L(:,i) =x;
end
disp(L);