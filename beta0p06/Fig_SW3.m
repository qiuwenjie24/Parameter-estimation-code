%% 
close all
clear
lambda = 10;

%% S
beta = 0.06;
Flie_num = 9;
FileName = ['th0\estimate3'];
load(FileName,'th_sim','th')
col_num = size(th_sim,2);
th_sim_all = zeros(1,col_num*Flie_num);

for jj1 = 1:Flie_num
    FileName = ['th',num2str(jj1-1),'\estimate3'];
    load(FileName,'th_sim')
    temp_col = [col_num*(jj1-1)+1 :1: col_num*jj1];
    th_sim_all(1,temp_col) = th_sim;
end

th_sim_all_aver = zeros(1,col_num*Flie_num);
th_sim_all_std = zeros(1,col_num*Flie_num);
th_sim_all_mse = zeros(1,col_num*Flie_num);
for jj2 = 1:col_num*Flie_num
    th_sim_all_aver(jj2) = mean(th_sim_all(1:jj2),'all');
    th_sim_all_std(jj2) = std(th_sim_all(1:jj2),0);
    
    temp1 = 2*ones(1,jj2);   %real value of th=2
    th_sim_all_mse(jj2) = mse(th_sim_all(1:jj2),temp1);
end

MSE_th_S = th_sim_all_mse;
th_sim_all_S = th_sim_all;
th_sim_all_aver_S = th_sim_all_aver;
th_sim_all_std_S = th_sim_all_std;
Var_th_S = th_sim_all_std.^2;
leg_S = ['$\beta=$',num2str(beta)];

X = 1:col_num*Flie_num;
% save('Fig_SW3.mat','th_sim_all_aver_S','Var_th_S','MSE_th_S','leg_S','X')

%% Expected value E(th)
figure
plot(1:col_num*Flie_num,abs(th_sim_all_aver_S),'-','DisplayName',leg_S,'LineWidth',3)
hold on 
plot( [1,col_num*Flie_num], [2,2],'--k','DisplayName',['$\theta=2$'],'LineWidth',2)
xlabel('sample size n')
ylabel('average estimator $\bar{\theta}_{es}(n)$','interpret','latex')
title(['$\lambda =$',num2str(lambda)],'interpret','latex')

legend
legend('Location','northeast','interpreter','latex','FontSize',14)

%% Variance Var(th) 样本方差
figure
plot(1:col_num*Flie_num,Var_th_S,'-','DisplayName',leg_S,'LineWidth',3)
xlabel('sample size n')
ylabel('Sample Variance $Var(\theta)$','interpret','latex')
title(['$\lambda =$',num2str(lambda)],'interpret','latex')

legend
legend('Location','northeast','interpreter','latex','FontSize',14)

%% MSE 均方误差  MSE(th)
figure
plot(1:col_num*Flie_num,MSE_th_S,'-','DisplayName',leg_S,'LineWidth',3)
xlabel('sample size n')
ylabel('$MSE(\{\theta_{es}\},n)$','interpret','latex')
title(['$\lambda =$',num2str(lambda)],'interpret','latex')

legend
legend('Location','northeast','interpreter','latex','FontSize',14)

%% Distribution of th
figure
edges = [-0.85:0.1:3.75];
hs = histogram(th_sim_all_S, edges, 'Normalization','probability');
xlabel('$\theta_{es}$','interpret','latex')
ylabel('Probability')
title('S--$\lambda = 10,\beta = 0.005$','interpret','latex')
