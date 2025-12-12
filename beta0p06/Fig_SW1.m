%% Shanon entropy and Fisher information
close all
clear

%% S
Flie_num = 9;
FileName = ['th0\estimate1'];
load(FileName,'vE_sh_all','Tnum')
row_num = size(vE_sh_all,1);
col_num = size(vE_sh_all,1);
vE_sh_all_all = zeros(row_num*Flie_num,col_num);
vE_vn_all_all = zeros(row_num*Flie_num,col_num);
vF_all_all = zeros(row_num*Flie_num,col_num);

for jj1 = 1:Flie_num
    FileName = ['th',num2str(jj1-1),'\estimate1'];
    load(FileName,'vE_sh_all','vE_vn_all','vF_all','beta')
    temp_row = [row_num*(jj1-1)+1 :1: row_num*jj1];
    vE_sh_all_all(temp_row,:) = vE_sh_all;
    vE_vn_all_all(temp_row,:) = vE_vn_all;
    vF_all_all(temp_row,:) = vF_all;
end

vE_sh_aver = mean(vE_sh_all_all, 1);
vE_vn_aver = mean(vE_vn_all_all, 1);
vF_aver = mean(vF_all_all, 1); 




vF_sum = zeros(1,col_num);
for jj1=1:col_num
    vF_sum(jj1) = sum(vF_aver(1:jj1));
end

vF_sum_S = vF_sum;
vE_sh_S = vE_sh_aver;
vE_vn_S = vE_vn_aver;
vF_S = vF_aver;
leg_S = ['$\beta=$',num2str(beta)];

save('Fig_SW1.mat','vF_S','vE_sh_S','vE_vn_S','leg_S','Tnum')

%% figure Shanon Entropy
figure
plot((0:Tnum-1),vE_sh_S, '-','DisplayName',leg_S,'LineWidth',3);
xlabel('$t/\beta$','interpreter','latex','FontSize',14);
ylabel('$S_\textrm{sh}(\beta,t)$','interpreter','latex','FontSize',14);

legend
legend('Location','northwest','interpreter','latex','FontSize',14)

%% figure Shanon Entropy
figure
plot((0:Tnum-1),real(vE_vn_S), '-','DisplayName',leg_S,'LineWidth',3);
xlabel('$t/\beta$','interpreter','latex','FontSize',14);
ylabel('$S_\textrm{vn}(\beta,t)$','interpreter','latex','FontSize',14);

legend
legend('Location','northwest','interpreter','latex','FontSize',14)

%% figure Fisher information
figure
plot((0:Tnum-1),vF_S, '-','DisplayName',leg_S,'LineWidth',3);
xlabel('$t/\beta$','interpreter','latex','FontSize',14);
ylabel('$F(\beta,t)$','interpreter','latex','FontSize',14);

legend
legend('Location','northeast','interpreter','latex','FontSize',14)

%% figure Sum of Fisher information
figure
plot((0:Tnum-1),vF_sum_S, '-','DisplayName',leg_S,'LineWidth',3);
xlabel('$t/\beta$','interpreter','latex','FontSize',14);
ylabel('$\int_0^{t/\beta} F(x)dx$','interpreter','latex','FontSize',14);

legend
legend('Location','southeast','interpreter','latex','FontSize',14)