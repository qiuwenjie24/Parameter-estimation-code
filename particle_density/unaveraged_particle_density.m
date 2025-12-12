%% particle density (未平均)
% A采用直接归一, B直接qr分解的归一
clear
%% adjustable parameter
%beta = 0.005测量主导，beta = 0.1演化主导
beta = 0.1;  %time interval 可调参数

%% fixed parameter
N = 40;       %total length
M = N/2;      %total particle number
Dis_str = 0;  %disorder strength
Cp = 1;       %coupling constant
th = 2.0;     %estimated parameter
lambda = 10.00;  %measurement strength

Tnum = 1001;  %time number
Time = Tnum*beta;

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


%%
ind_p = zeros(1, Tnum);
vE_sh = zeros(1, Tnum);

A = eye(N);       %matrix of initial state
B = eye(N);
for jj1=1:Tnum
    
    if jj1>=2
        A = U_be*A;       %time evolutin
        B = U_be*B;
    else
        A = U_th*A;       %encoding
        B = U_th*B;
    end
    
    vP = fn_P(A, lambda, M);           %probability 1*N
    vE_sh(jj1) = fn_Sh_Entropy(vP);    %shanon entropy
    
    p = fn_rand_ind(vP);              %result index p
    ind_p(jj1) = p;                   %index of measurement result
    
    % simple normalization
    A = Mea{p}*A./( norm_tmp^(1/M) ); %matrix after measurement
    A = A./( (sqrt(vP(p))).^(1/M) );   %simple normalization
    
    % qr normalization
    B = Mea{p}*B./( norm_tmp^(1/M) );
    [Q,R] = qr(B);                    %qr normalization
    B = Q;
    
    density = (vP* (N + (exp(-lambda)-1)*M) - 1 )/(exp(-lambda)-1);  %<a+ a>
    density(abs(density)<1e-8) = 0;
    density(abs(density-1)<1e-8) = 1;
    
    
    figure(7);
    plot(density,'-ok','markerfacecolor','k');
    set(gca,'FontSize',12,'linewidth',1.5)
    xlabel('lattice site','FontSize',15)
    ylabel('particle probability','FontSize',15)
    axis([0 N 0 1])
    title(['t=',num2str(beta*(jj1-1)),',  $\beta$=',num2str(beta)],...
        'interpret','latex')
    pause(0.0001);
    
%     if jj1==Tnum
%         FileName = ['..\data_origin\PD_Yw.xlsx']
%         xlswrite(FileName,Cor_ada')
%     end
end

