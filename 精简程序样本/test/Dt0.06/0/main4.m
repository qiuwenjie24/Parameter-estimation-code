%% estimate4  梯度下降法
clear
% diary main4.out %开启日志记录
tic

FileName = ['estimate1'];
load(FileName,'A_fin_all','th','L')

Cp = 1; Dis_str = 0; N = L/2;
%% Hamitonian

[~, H_op] = fn_AAH(L, Cp, Dis_str);
H = H_op;

[H_s,H_d] = eig(H);   %norm(H - H_s* H_d *H_s' )
vep = diag(H_d);
F4 = exp(-1i*th*vep); F5 = diag(F4); 
U_th = H_s*F5*H_s';   %encoding operator theta

%%

aver_num = max(size(A_fin_all));
% th_sim_GD = zeros(1,aver_num);
th_sim_1 = zeros(1,aver_num);

load('estimate2.mat','th_sim_0')
parfor jj1 = 1:aver_num

th0 = th_sim_0(jj1);  %initial value th from estimate_S2.mat

A = A_fin_all{jj1};
Af = A* U_th';

max_th_GD = fn_find_max_GD(Af, N, H_s, vep, th0);
% max_th_1 = fn_find_max_1(Af, N, H_s, vep, th0);
% fn_find_max_GD 是通过梯度下降找似然概率最大值
% fn_find_max_1 是通过不断比较邻近点找到似然概率最大值
% if abs(max_th_GD - max_th_1)>1e-3  %check fn_find_max_old
%     fprintf('error is %d \n',abs(max_th-max_th_old1))
% end

th_sim_GD(jj1) = max_th_GD;
% th_sim_1(jj1) = max_th_1;

fprintf('jj1 = %d, max_th = %d, time=%s \n',jj1, max_th_GD, datetime)
end

th_sim_best = th_sim_GD;
end_time = toc();
FileName = ['estimate4'];
save(FileName,'th','th_sim_best','end_time')


% diary off %关闭日志记录