% shanon entropy, Fisher information, Final matrix of AAH
% A_fin_all采用qr分解的归一, B_fin_all直接归一
%限定初态矩阵是单位矩阵
function [vF_all, vE_sh_all, ind_p_all, A_fin_all, B_fin_all] = fn_measure(th, L, gamma, Dt, Tnum, aver_num)

%% fixed parameter
N = L/2;      %total particle number
Dis_str = 0;  %disorder strength
Cp = 1;       %coupling constant
% th = 2.0;     %estimated parameter
% Time = [0,1,2,...,Tnum-1]

%% Hamitonian and evolution operator
[~, H_op] = fn_AAH(L, Cp, Dis_str);
H = H_op;

[H_s,H_d] = eig(H);   %norm(H - H_s* H_d *H_s' )
F1 = diag(H_d);
F2 = exp(-1i*Dt*F1); F3 = diag(F2);
F4 = exp(-1i*th*F1); F5 = diag(F4);

U_Dt = H_s*F3*H_s';   %evolutin operator beta
U_th = H_s*F5*H_s';   %encoding operator theta


%% ------------------parfor--------------------------------
ind_p_all = zeros(aver_num, Tnum);
vF_all = zeros(aver_num, Tnum);
vE_sh_all = zeros(aver_num, Tnum);
A_fin_all = cell(aver_num, 1);
B_fin_all = cell(aver_num, 1);
parfor jj2=1:aver_num
    
    %--------------------effective measure matrix---------------------
    %放在并行内时为了避免Mea变成广播变量(每个循环体都调用)，造成不必要的通信开销
    Mea = cell(1, L);
    norm_tmp = sqrt( L + (exp(-gamma) - 1)*N );   %测量系数后面作用时再加进去
    for k = 1:L
        temp = eye(L);
        temp(k, k) = exp(-gamma/2);     %对第k个格点的弱测量
        Mea{k} = temp;
    end
    %--------------------effective measure matrix---------------------
    
    ind_p = zeros(1, Tnum);
    vE_sh = zeros(1, Tnum);
    vF = zeros(1, Tnum);
    
    % initial state
    A = eye(L);
    B = eye(L);
    
    % encoded state
    A = U_th*A;
    B = U_th*B;
    
    for jj1=1:Tnum
        
        vP = fn_P(A, gamma, N);         %probability 1*L
        vP_pd = fn_P_pd(A, gamma, N);     %derivative of probability 1*L
        
        r = fn_rand_ind(vP);              %result index r
        ind_p(jj1) = r;                   %index of measurement result
        
        % 物理量
        vE_sh(jj1) = fn_Sh_Entropy(vP);    %shanon entropy log2
        vF(jj1) = fn_Fisher(vP, vP_pd);    %classical fisher information
        
        % measurement
        A = Mea{r}*A./( norm_tmp^(1/N) );  %matrix after measurement
        B = Mea{r}*B./( norm_tmp^(1/N) );
        
        % normalization，归一化是必要的，否则矩阵会越来越小或越来越大
        A = A./( (sqrt(vP(r))).^(1/N) );   %simple normalization
        [Q,~] = qr(B);
        B = Q;    % qr normalization
        
        %time evolutin
        A = U_Dt*A;
        B = U_Dt*B;
        
    end
    
    A_fin_all{jj2} = A;
    B_fin_all{jj2} = B;
    ind_p_all(jj2, :) = ind_p;
    vF_all(jj2, :) = vF;
    vE_sh_all(jj2, :) = vE_sh;
    
    % fprintf('%d end \n',jj2)
end

end
