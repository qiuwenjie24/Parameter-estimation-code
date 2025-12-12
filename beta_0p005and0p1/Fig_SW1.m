%% Shanon entropy and Fisher information
close all
clear

%% W
Flie_num = 9;
FileName = ['New_Folder_Estimate_th0\estimate_W1'];
load(FileName,'vE_sh_all','Tnum')
row_num = size(vE_sh_all,1);
col_num = size(vE_sh_all,1);
vE_sh_all_all = zeros(row_num*Flie_num,col_num);
vE_vn_all_all = zeros(row_num*Flie_num,col_num);
vF_all_all = zeros(row_num*Flie_num,col_num);

for jj1 = 1:Flie_num
    FileName = ['New_Folder_Estimate_th',num2str(jj1-1),'\estimate_W1'];
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

vF_sum_W = vF_sum;
vE_sh_W = vE_sh_aver;
vE_vn_W = vE_vn_aver;
vF_W = vF_aver;
leg_W = ['$\beta=$',num2str(beta)];

%% S
Flie_num = 9;
FileName = ['New_Folder_Estimate_th0\estimate_S1'];
load(FileName,'vE_sh_all','Tnum')
row_num = size(vE_sh_all,1);
col_num = size(vE_sh_all,1);
vE_sh_all_all = zeros(row_num*Flie_num,col_num);
vE_vn_all_all = zeros(row_num*Flie_num,col_num);
vF_all_all = zeros(row_num*Flie_num,col_num);

for jj1 = 1:Flie_num
    FileName = ['New_Folder_Estimate_th',num2str(jj1-1),'\estimate_S1'];
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

save('Fig_SW1.mat','vF_S','vE_sh_S','vE_vn_S','leg_S','vF_W','vE_sh_W','vE_vn_W','leg_W','Tnum')

%% figure Shanon Entropy
figure
plot((0:Tnum-1),vE_sh_W, '-','DisplayName',leg_W,'LineWidth',3);
hold on 
plot((0:Tnum-1),vE_sh_S, '-','DisplayName',leg_S,'LineWidth',3);
xlabel('$t/\beta$','interpreter','latex','FontSize',14);
ylabel('$S_\textrm{sh}(\beta,t)$','interpreter','latex','FontSize',14);

legend
legend('Location','northwest','interpreter','latex','FontSize',14)


% xlswrite(['..\data_origin\Fig_Shanon_X','.xlsx'],(0:Tnum-1)');
% xlswrite(['..\data_origin\Fig_Shanon_Yw','.xlsx'],vE_sh_W');
% xlswrite(['..\data_origin\Fig_Shanon_Ys','.xlsx'],vE_sh_S');

%% figure vn Entropy
figure
plot((0:Tnum-1),real(vE_vn_W), '-','DisplayName',leg_W,'LineWidth',3);
hold on 
plot((0:Tnum-1),real(vE_vn_S), '-','DisplayName',leg_S,'LineWidth',3);
xlabel('$t/\beta$','interpreter','latex','FontSize',14);
ylabel('$S_\textrm{vn}(\beta,t)$','interpreter','latex','FontSize',14);

legend
legend('Location','northwest','interpreter','latex','FontSize',14)

%% figure Fisher information
figure
plot((0:Tnum-1),vF_W, '-','DisplayName',leg_W,'LineWidth',3);
hold on 
plot((0:Tnum-1),vF_S, '-','DisplayName',leg_S,'LineWidth',3);
xlabel('$t/\beta$','interpreter','latex','FontSize',14);
ylabel('$F(\beta,t)$','interpreter','latex','FontSize',14);

legend
legend('Location','northeast','interpreter','latex','FontSize',14)


% xlswrite(['..\data_origin\Fig_Fisher_X','.xlsx'],(0:Tnum-1)');
% xlswrite(['..\data_origin\Fig_Fisher_Yw','.xlsx'],vF_W');
% xlswrite(['..\data_origin\Fig_Fisher_Ys','.xlsx'],vF_S');

%% figure Sum of Fisher information
figure
plot((0:Tnum-1),vF_sum_W, '-','DisplayName',leg_W,'LineWidth',3);
hold on 
plot((0:Tnum-1),vF_sum_S, '-','DisplayName',leg_S,'LineWidth',3);
xlabel('$t/\beta$','interpreter','latex','FontSize',14);
ylabel('$\int_0^{t/\beta} F(x)dx$','interpreter','latex','FontSize',14);

legend
legend('Location','southeast','interpreter','latex','FontSize',14)