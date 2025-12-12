%% 合并Fig_W1,Fig_S1,
close all
clear

%% W1
FileName = ['estimate_W1'];
load(FileName)
vE_sh_aver = mean(vE_sh_all, 1);
vF_aver = mean(vF_all, 1); 

vE_sh_W1 = vE_sh_aver;
vF_W1 = vF_aver;
leg_W = ['$\beta=$',num2str(beta)];

%% S1
FileName = ['estimate_S1'];
load(FileName)
vE_sh_aver = mean(vE_sh_all, 1);
vF_aver = mean(vF_all, 1); 

vE_sh_S1 = vE_sh_aver;
vF_S1 = vF_aver;
leg_S = ['$\beta=$',num2str(beta)];

%% figure Shanon Entropy
figure
plot((0:Tnum-1),vE_sh_W1, '-','DisplayName',leg_W,'LineWidth',3);
hold on 
plot((0:Tnum-1),vE_sh_S1, '-','DisplayName',leg_S,'LineWidth',3);
xlabel('$t/\beta$','interpreter','latex','FontSize',14);
ylabel('$S_\textrm{sh}(\beta,t)$','interpreter','latex','FontSize',14);

legend
legend('Location','northeast','interpreter','latex','FontSize',14)

%% figure Fisher information
figure
plot((0:Tnum-1),vF_W1, '-','DisplayName',leg_W,'LineWidth',3);
hold on 
plot((0:Tnum-1),vF_S1, '-','DisplayName',leg_S,'LineWidth',3);
xlabel('$t/\beta$','interpreter','latex','FontSize',14);
ylabel('$F(\beta,t)$','interpreter','latex','FontSize',14);

legend
legend('Location','northeast','interpreter','latex','FontSize',14)