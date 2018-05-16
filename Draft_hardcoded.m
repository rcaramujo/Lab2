% Initialise communications

pioneer_init(sp); % wtf is sp???

turns_cnt = 0;
while(turns_cnt <= 3)
    % while front_distance > *value_front* && right_distance < *value_rigth* go front
    % *value_front* deverá ser medido med«smo antes da esquina, porque assim, ele só vai virar quando chegar ao fim do corredor.
    % *value_rigth* mede-se qual é o valor medido na esquina e mete-se menos.

        % dentro do while tem de haver o controlo do robot (uma função que faz o controlo para cada ciclo)
        % Usar mistura de odometria e sonar, se conseguirmos.

    % Fazer isto dentro de uma função não era mau pensado xD

        % contar o número de vezes que ele vira, ao fim de 3 vira à esquerda em vez de à direita - pode ser input da função de cima.
        turns_cnt = turns_cnt + 1;
end

% "estacionar" o robot - condição final para ele saber que chegou ao fim (odometria possivelmente).
% odometria dá x, y e orientação em relação ao mundo, considera-se que o ponto inicial é a origem do referencial do mundo.
% Pode-se fazer quando o ponto onde ele está é igual ao inicial por exemplo.