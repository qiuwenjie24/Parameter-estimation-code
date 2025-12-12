%% 
close all
clear

%% Shanon Entropy
figure
% load('.\beta0p001\Fig_SW1.mat','Tnum','vE_sh_S','leg_S')
% plot((0:Tnum-1),vE_sh_S, '-','DisplayName',leg_S,'LineWidth',3);
% hold on 
load('.\beta_0p005and0p1\Fig_SW1.mat','Tnum','vE_sh_S','leg_S')
plot((0:Tnum-1),vE_sh_S, '-','DisplayName',leg_S,'LineWidth',3);
xlswrite(['.\data_origin\Fig_Shanon_Y_0.005.xlsx'],vE_sh_S);

hold on 
load('.\beta0p02\Fig_SW1.mat','Tnum','vE_sh_S','leg_S')
plot((0:Tnum-1),vE_sh_S, '-','DisplayName',leg_S,'LineWidth',3);
xlswrite(['.\data_origin\Fig_Shanon_Y_0.02.xlsx'],vE_sh_S);

hold on 
load('.\beta0p04\Fig_SW1.mat','Tnum','vE_sh_S','leg_S')
plot((0:Tnum-1),vE_sh_S, '-','DisplayName',leg_S,'LineWidth',3);
xlswrite(['.\data_origin\Fig_Shanon_Y_0.04.xlsx'],vE_sh_S);

hold on 
load('.\beta0p06\Fig_SW1.mat','Tnum','vE_sh_S','leg_S')
plot((0:Tnum-1),vE_sh_S, '-','DisplayName',leg_S,'LineWidth',3);
xlswrite(['.\data_origin\Fig_Shanon_Y_0.06.xlsx'],vE_sh_S);
hold on 

load('.\beta_0p005and0p1\Fig_SW1.mat','Tnum','vE_sh_W','leg_W')
plot((0:Tnum-1),vE_sh_W, '-','DisplayName',leg_W,'LineWidth',3);
xlswrite(['.\data_origin\Fig_Shanon_Y_0.1.xlsx'],vE_sh_W);

X = (0:Tnum-1);
xlswrite(['.\data_origin\Fig_Shanon_X.xlsx'],X);
xlabel('$t/\beta$','interpreter','latex','FontSize',14);
ylabel('$S_\textrm{sh}(\beta,t)$','interpreter','latex','FontSize',14);

legend
legend('Location','northwest','interpreter','latex','FontSize',14)

%% Fisher information
figure
% load('.\beta0p001\Fig_SW1.mat','Tnum','vF_S','leg_S')
% plot((0:Tnum-1),vF_S, '-','DisplayName',leg_S,'LineWidth',3);
% hold on 
load('.\beta_0p005and0p1\Fig_SW1.mat','Tnum','vF_S','leg_S')
plot((0:Tnum-1),vF_S, '-','DisplayName',leg_S,'LineWidth',3);
xlswrite(['.\data_origin\Fig_Fisher_Y_0.005.xlsx'],vF_S);

hold on 
load('.\beta0p02\Fig_SW1.mat','Tnum','vF_S','leg_S')
plot((0:Tnum-1),vF_S, '-','DisplayName',leg_S,'LineWidth',3);
xlswrite(['.\data_origin\Fig_Fisher_Y_0.02.xlsx'],vF_S);

hold on 
load('.\beta0p04\Fig_SW1.mat','Tnum','vF_S','leg_S')
plot((0:Tnum-1),vF_S, '-','DisplayName',leg_S,'LineWidth',3);
xlswrite(['.\data_origin\Fig_Fisher_Y_0.04.xlsx'],vF_S);

hold on 
load('.\beta0p06\Fig_SW1.mat','Tnum','vF_S','leg_S')
plot((0:Tnum-1),vF_S, '-','DisplayName',leg_S,'LineWidth',3);
xlswrite(['.\data_origin\Fig_Fisher_Y_0.06.xlsx'],vF_S);

hold on 
load('.\beta_0p005and0p1\Fig_SW1.mat','Tnum','vF_W','leg_W')
plot((0:Tnum-1),vF_W, '-','DisplayName',leg_W,'LineWidth',3);
xlswrite(['.\data_origin\Fig_Fisher_Y_0.1.xlsx'],vF_W);

X = (0:Tnum-1);
xlswrite(['.\data_origin\Fig_Fisher_X.xlsx'],X);
xlabel('$t/\beta$','interpreter','latex','FontSize',14);
ylabel('$F(\beta,t)$','interpreter','latex','FontSize',14);
set(gca,'XScale','log')
legend
legend('Location','northeast','interpreter','latex','FontSize',14)

%% Entanglement Entropy
figure
% load('.\beta0p001\Fig_SW1.mat','Tnum','vE_vn_S','leg_S')
% plot((0:Tnum-1),real(vE_vn_S), '-','DisplayName',leg_S,'LineWidth',3);
% hold on 
load('.\beta_0p005and0p1\Fig_SW1.mat','Tnum','vE_vn_S','leg_S')
plot((0:Tnum-1),real(vE_vn_S), '-','DisplayName',leg_S,'LineWidth',3);
hold on 
load('.\beta0p02\Fig_SW1.mat','Tnum','vE_vn_S','leg_S')
plot((0:Tnum-1),real(vE_vn_S), '-','DisplayName',leg_S,'LineWidth',3);
hold on 
load('.\beta0p04\Fig_SW1.mat','Tnum','vE_vn_S','leg_S')
plot((0:Tnum-1),real(vE_vn_S), '-','DisplayName',leg_S,'LineWidth',3);
hold on 
load('.\beta0p06\Fig_SW1.mat','Tnum','vE_vn_S','leg_S')
plot((0:Tnum-1),real(vE_vn_S), '-','DisplayName',leg_S,'LineWidth',3);
hold on 

load('.\beta_0p005and0p1\Fig_SW1.mat','Tnum','vE_vn_W','leg_W')
plot((0:Tnum-1),real(vE_vn_W), '-','DisplayName',leg_W,'LineWidth',3);

xlabel('$t/\beta$','interpreter','latex','FontSize',14);
ylabel('$S_\textrm{vn}(\beta,t)$','interpreter','latex','FontSize',14);

legend
legend('Location','northwest','interpreter','latex','FontSize',14)

