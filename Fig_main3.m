%% 
close all
clear
lambda = 10;

%% Expected value E(th)
figure
% load('.\beta0p001\Fig_SW3.mat')
% plot(X, abs(th_sim_all_aver_S-2),'-','DisplayName',leg_S,'LineWidth',3)
% hold on
load('.\beta_0p005and0p1\Fig_SW3.mat')
plot(X, abs(th_sim_all_aver_S-2),'-','DisplayName',leg_S,'LineWidth',3)
Y = abs(th_sim_all_aver_S-2);
xlswrite(['.\data_origin\Fig_Mean_Y_0.005.xlsx'],Y);

hold on
load('.\beta0p02\Fig_SW3.mat')
plot(X, abs(th_sim_all_aver_S-2),'-','DisplayName',leg_S,'LineWidth',3)
Y = abs(th_sim_all_aver_S-2);
xlswrite(['.\data_origin\Fig_Mean_Y_0.02.xlsx'],Y);

hold on
load('.\beta0p04\Fig_SW3.mat')
plot(X, abs(th_sim_all_aver_S-2),'-','DisplayName',leg_S,'LineWidth',3)
Y = abs(th_sim_all_aver_S-2);
xlswrite(['.\data_origin\Fig_Mean_Y_0.04.xlsx'],Y);

hold on
load('.\beta0p06\Fig_SW3.mat')
plot(X, abs(th_sim_all_aver_S-2),'-','DisplayName',leg_S,'LineWidth',3)
Y = abs(th_sim_all_aver_S-2);
xlswrite(['.\data_origin\Fig_Mean_Y_0.06.xlsx'],Y);

hold on
load('.\beta_0p005and0p1\Fig_SW3.mat')
plot(X, abs(th_sim_all_aver_W-2),'-','DisplayName',leg_W,'LineWidth',3)
Y = abs(th_sim_all_aver_W-2);
xlswrite(['.\data_origin\Fig_Mean_Y_0.1.xlsx'],Y);
xlswrite(['.\data_origin\Fig_Mean_X.xlsx'],X);

% hold on 
% plot( [1,max(X)], [0,0],'--k','DisplayName',['$\theta=2$'],'LineWidth',2)


xlabel('sample size n')
ylabel('$\| \bar{\theta}_{es}(n)- {\theta}_{true}\|$','interpret','latex')
title(['$\lambda =$',num2str(lambda)],'interpret','latex')

legend
legend('Location','northeast','interpreter','latex','FontSize',14)
% set(gca,'XScale','log')
xlim([1000 9000])
ylim([0.02 0.1])

%% Variance Var(th) 样本方差
figure
% load('.\beta0p001\Fig_SW3.mat')
% plot(X, Var_th_S,'-','DisplayName',leg_S,'LineWidth',3)
% hold on
load('.\beta_0p005and0p1\Fig_SW3.mat')
plot(X, Var_th_S,'-','DisplayName',leg_S,'LineWidth',3)
xlswrite(['.\data_origin\Fig_Var_Y_0.005.xlsx'],Var_th_S);

hold on
load('.\beta0p02\Fig_SW3.mat')
plot(X, Var_th_S,'-','DisplayName',leg_S,'LineWidth',3)
xlswrite(['.\data_origin\Fig_Var_Y_0.02.xlsx'],Var_th_S);

hold on
load('.\beta0p04\Fig_SW3.mat')
plot(X, Var_th_S,'-','DisplayName',leg_S,'LineWidth',3)
xlswrite(['.\data_origin\Fig_Var_Y_0.04.xlsx'],Var_th_S);

hold on
load('.\beta0p06\Fig_SW3.mat')
plot(X, Var_th_S,'-','DisplayName',leg_S,'LineWidth',3)
xlswrite(['.\data_origin\Fig_Var_Y_0.06.xlsx'],Var_th_S);

hold on
load('.\beta_0p005and0p1\Fig_SW3.mat')
plot(X, Var_th_W,'-','DisplayName',leg_W,'LineWidth',3)
xlswrite(['.\data_origin\Fig_Var_Y_0.1.xlsx'],Var_th_W);
xlswrite(['.\data_origin\Fig_Var_X.xlsx'],X);

xlabel('sample size n')
ylabel('Sample Variance $Var(\theta)$','interpret','latex')
title(['$\lambda =$',num2str(lambda)],'interpret','latex')
legend
legend('Location','northeast','interpreter','latex','FontSize',14)
% set(gca,'XScale','log')
xlim([1000 9000])
ylim([0.28 0.45])


%% MSE 均方误差  MSE(th)
figure
% load('.\beta0p001\Fig_SW3.mat')
% plot(X, MSE_th_S,'-','DisplayName',leg_S,'LineWidth',3)
% hold on
load('.\beta_0p005and0p1\Fig_SW3.mat')
plot(X, MSE_th_S,'-','DisplayName',leg_S,'LineWidth',3)
xlswrite(['.\data_origin\Fig_MSE_Y_0.005.xlsx'],MSE_th_S);

hold on
load('.\beta0p02\Fig_SW3.mat')
plot(X, MSE_th_S,'-','DisplayName',leg_S,'LineWidth',3)
xlswrite(['.\data_origin\Fig_MSE_Y_0.02.xlsx'],MSE_th_S);

hold on
load('.\beta0p04\Fig_SW3.mat')
plot(X, MSE_th_S,'-','DisplayName',leg_S,'LineWidth',3)
xlswrite(['.\data_origin\Fig_MSE_Y_0.04.xlsx'],MSE_th_S);

hold on
load('.\beta0p06\Fig_SW3.mat')
plot(X, MSE_th_S,'-','DisplayName',leg_S,'LineWidth',3)
xlswrite(['.\data_origin\Fig_MSE_Y_0.06.xlsx'],MSE_th_S);

hold on
load('.\beta_0p005and0p1\Fig_SW3.mat')
plot(X, MSE_th_W,'-','DisplayName',leg_W,'LineWidth',3)
xlswrite(['.\data_origin\Fig_MSE_Y_0.1.xlsx'],MSE_th_W);
xlswrite(['.\data_origin\Fig_MSE_X.xlsx'],X);

xlabel('sample size n')
ylabel('$MSE(\theta_{es},n)$','interpret','latex')
title(['$\lambda =$',num2str(lambda)],'interpret','latex')
legend
legend('Location','northeast','interpreter','latex','FontSize',14)
% set(gca,'XScale','log')
xlim([1000 9000])
ylim([0.28 0.45])

