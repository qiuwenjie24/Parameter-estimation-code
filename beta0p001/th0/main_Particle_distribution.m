% particle probility, measurement probility, and some checks
% A采用直接归一, B直接qr分解的归一
% small time interval or strong measurement strength
clear
%% parameter
N = 40;       %total length 
M = N/2;      %total particle number
Dis_str = 0;  %disorder strength
Cp = 1;       %coupling constant
th = 3.0;     %estimated parameter 
lambda = 10.00;  %measurement strength

%beta = 0.001测量主导，beta = 0.1演化主导
beta = 0.1;  %time interval

Tnum = 201;  %time number
Time = Tnum*beta;
% Num_aver = 1;  %average times of random

%% Hamitonian and evolution operator
[~, H_op] = fn_AAH(N, Cp, Dis_str);
H = H_op;

[H_s,H_d] = eig(H);   %norm(H - H_s* H_d *H_s' )
F1 = diag(H_d);
F2 = exp(-1i*beta*F1); F3 = diag(F2); 
F4 = exp(-1i*th*F1); F5 = diag(F4); 

U_be = H_s*F3*H_s';   %evolutin operator beta
U_th = H_s*F5*H_s';   %encoding operator theta

%% effective measure matrix
Mea = cell(1, N);
norm_tmp = sqrt( N + (exp(-lambda) - 1)*M );   %归一化系数后面作用时再加进去
for n = 1:N
   tmp = eye(N);
   tmp(n, n) = exp(-lambda/2);     %对第n个格点的弱测量
   Mea{n} = tmp;
end


%% ------------------parfor--------------------------------
    
% dis_vP = zeros(N, tnum);  
ind_p = zeros(1, Tnum);    
vF = zeros(1, Tnum);       
vE_sh = zeros(1, Tnum);
vE_vn = zeros(1, Tnum); 
vE_vn_B = zeros(1, Tnum); 

A = eye(N);       %matrix of initial state 
B = eye(N);
A_p = eye(N);  lr=1e-6;
for jj1=1:Tnum
    
    if jj1>=2
        A = U_be*A;       %time evolutin
        B = U_be*B;
        A_p = U_be*A_p;
    else
        A = U_th*A;       %encoding
        B = U_th*B; 
        A_p = H_s*diag(exp(-1j*(th+lr)*F1))*H_s'*A_p;
    end
    
    
    vP = fn_P(A, lambda, M);           %probability 1*N
    vP_B = fn_P(B, lambda, M);

    vP_pd = fn_P_pd(A, lambda, M);  %derivative of probability 1*N
    jj1
    fn_Fisher(vP, vP_pd)
    vF(jj1) = fn_Fisher(vP, vP_pd);    %classical fisher information
    vE_sh(jj1) = fn_Sh_Entropy(vP);    %shanon entropy 
    vE_vn(jj1) = fn_vN_Entropy(A,M);   %von Neumann entropy
    vE_vn_B(jj1) = fn_vN_Entropy(B,M);

    p = fn_rand_ind(vP);              %result index p
    ind_p(jj1) = p;                   %index of measurement result
    A = Mea{p}*A./( norm_tmp^(1/M) ); %matrix after measurement
    A = A./( (sqrt(vP(p))).^(1/M) );   %simple normalization
    
    B = Mea{p}*B./( norm_tmp^(1/M) );
    [Q,R] = qr(B);                    %qr normalization
    B = Q;
    
    A_p = Mea{p}*A_p./( norm_tmp^(1/M) );
    A_p = A_p./( (sqrt(vP(p))).^(1/M) );
    

    figure(8); 
    plot(vP,'-bo'); 
    hold on; 
    plot(p, vP(p), 'r*'); 
    hold off;
    xlabel('position [1,...,N]')
    ylabel('measurement probability $[P_1,...,P_N]$','interpret','latex')
%     title('t=0')
    title(['t=',num2str(beta*(jj1-1)),',  $\beta$=',num2str(beta)],...
           'interpret','latex')
%     axis([0 N 0 0.05])
    
    Cor_ada = (vP* (N + (exp(-lambda)-1)*M) - 1 )/(exp(-lambda)-1);  %<a+ a>
    Cor_ada(abs(Cor_ada)<1e-8) = 0;
    Cor_ada(abs(Cor_ada-1)<1e-8) = 1;
    figure(9); 
    plot(Cor_ada,'-bo'); 
    xlabel('position [1,...,N]')
    ylabel('particle probability','interpret','latex')
%     title('t=0')
    title(['t=',num2str(beta*(jj1-1)),',  $\beta$=',num2str(beta)],...
           ['$t/\beta$=',num2str((jj1-1))],'interpret','latex')
    axis([0 N 0 1])
%     pause(0.0001);
    

end


% figure; 
% plot(vE_vn,'-bo'); 
% figure; 
% plot(vE_vn_B,'-bo'); 
