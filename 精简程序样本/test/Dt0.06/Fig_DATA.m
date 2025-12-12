%% Shanon entropy and Fisher information
close all
clear

%% 整合
Flie_num = 5;
FileName = ['0\estimate1'];
load(FileName,'vE_sh_all','Tnum')
row_num = size(vE_sh_all,1);
col_num = size(vE_sh_all,2);
vE_sh_all_all = zeros(row_num*Flie_num,col_num);
vF_all_all = zeros(row_num*Flie_num,col_num);

for jj1 = 1:Flie_num
    FileName = [num2str(jj1-1),'\estimate1'];
    load(FileName,'vE_sh_all','vF_all','gamma','Dt')
    temp_row = [row_num*(jj1-1)+1 :1: row_num*jj1];
    vE_sh_all_all(temp_row,:) = vE_sh_all;
    vF_all_all(temp_row,:) = vF_all;
end

vE_sh = mean(vE_sh_all_all, 1);
vF = mean(vF_all_all, 1); 
leg = ['$\Delta t=$',num2str(Dt)];

save('Fig_DATA.mat','vF','vE_sh','leg','Tnum','gamma','Dt')

%% figure Shanon Entropy
figure
plot((0:Tnum-1),vE_sh, '-','DisplayName',leg,'LineWidth',3);
xlabel('$t/\Delta t$','interpreter','latex','FontSize',14);
ylabel('$S_\textrm{sh}(t)$','interpreter','latex','FontSize',14);

legend
legend('Location','northwest','interpreter','latex','FontSize',14)

%% figure Fisher information
figure
plot((0:Tnum-1),vF, '-','DisplayName',leg,'LineWidth',3);
xlabel('$t/\Delta t$','interpreter','latex','FontSize',14);
ylabel('$F(t)$','interpreter','latex','FontSize',14);
set(gca,'XScale','log')
legend
legend('Location','northeast','interpreter','latex','FontSize',14)
