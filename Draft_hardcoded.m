% Initialise communications

pioneer_init(sp); % wtf is sp???
% Sair da sala

turns_cnt = 0;
while(turns_cnt <= 3)
    
    sonars = pioneer_read_sonars();
    while(sonars(4) > 5000 || sonars(5) > 5000)
    % while front_distance > *value_front* && right_distance < *value_rigth* go front
    % *value_front* deverá ser medido med«smo antes da esquina, porque assim, ele só vai virar quando chegar ao fim do corredor.
    % *value_rigth* mede-se qual é o valor medido na esquina e mete-se menos.
        [lv,av] = path_control(rpos,rsonar,gpos,gsonar);
        
        check = sonars(3:6) < 1000;
        while(sum(check) > 0)
            % obstacle!!!!!!
            % rodar at� n�o aparecer o obst�culo
            sonars = pioneer_read_sonars();
            check = sonars(3:6) < 1000;
        end
        % dentro do while tem de haver o controlo do robot (uma função que faz o controlo para cada ciclo)
        % Usar mistura de odometria e sonar, se conseguirmos.
        
        pioneer_set_controls(sp, lv, av);
    % Fazer isto dentro de uma função não era mau pensado xD

        % contar o número de vezes que ele vira, ao fim de 3 vira à esquerda em vez de à direita - pode ser input da função de cima.
    end
    turns_cnt = turns_cnt + 1;
end

% "estacionar" o robot - condição final para ele saber que chegou ao fim (odometria possivelmente).
% odometria dá x, y e orientação em relação ao mundo, considera-se que o ponto inicial é a origem do referencial do mundo.
% Pode-se fazer quando o ponto onde ele está é igual ao inicial por exemplo.