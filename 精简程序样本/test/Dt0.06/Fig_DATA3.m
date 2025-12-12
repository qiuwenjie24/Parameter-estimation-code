%% parameter estimate
% close all
clear

%% 整合
Flie_num = 5;
FileName = ['0\estimate4'];
load(FileName,'th_sim_best')
col_num = size(th_sim_best,2);
th_sim_best_all = zeros(1,col_num*Flie_num);

for jj1 = 1:Flie_num
    FileName = [num2str(jj1-1),'\estimate4'];
    load(FileName,'th_sim_best','th')
    temp_col = [col_num*(jj1-1)+1 :1: col_num*jj1];
    th_sim_best_all(1,temp_col) = th_sim_best;
end

load('0\estimate1.mat','Dt','gamma')
leg = ['$\Delta t=$',num2str(Dt)];

%% average value, Variance, Mean Square Error
num_best = max(size(th_sim_best_all));
th_sim_aver = zeros(1,num_best);
th_sim_var = zeros(1,num_best);
th_sim_mse = zeros(1,num_best);

for jj2 = 1:num_best
    th_sim_aver(jj2) = mean(th_sim_best_all(1:jj2),'all');
    th_sim_var(jj2) = std(th_sim_best_all(1:jj2),0) ^2;
    real_th = th*ones(1,jj2);   %real value of th=1
    th_sim_mse(jj2) = mse(th_sim_best_all(1:jj2),real_th);
end

save('Fig_DATA3.mat','th_sim_best_all','num_best','th','leg','gamma','Dt',...
     'th_sim_aver','th_sim_var','th_sim_mse')

%% Fig
figure
% subplot(3,1,1);
plot(1:num_best,abs(th_sim_aver-th),'-','LineWidth',3)
xlabel('sample size n')
ylabel('average estimator $\bar{\theta}_{es}(n)$','interpret','latex')
xlim([1000 9000])

figure
% subplot(3,1,2);
plot(1:num_best,th_sim_var,'-','LineWidth',3)
xlabel('sample size n')
ylabel('Sample Variance $Var(\theta)$','interpret','latex')
xlim([1000 9000])

figure
% subplot(3,1,3);
plot(1:num_best,th_sim_mse,'-','LineWidth',3)
xlabel('sample size n')
ylabel('$MSE(\{\theta_{es}\},n)$','interpret','latex')
title(['$\gamma =$',num2str(gamma)],'interpret','latex')
xlim([1000 9000])