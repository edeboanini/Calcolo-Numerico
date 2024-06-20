gradi = [1, 2, 3, 4, 5, 6, 7, 9];

fprintf('Grado  |  Pesi della quadratura\n');
for i = 1:length(gradi)
    fprintf('-------------------');
end
fprintf('\n');
for i = 1:length(gradi)
    g = gradi(i);
    if g == 8 || g>9
        fprintf('Grado %d non accettabile\n', g);
        continue;
    end
    
    pesi = newtonCotes(g);
    % Convertiamo i pesi in forma frazionaria
    pesifraz = rats(pesi);
    fprintf(' %d     |  ' , g);
    disp(pesifraz);
end