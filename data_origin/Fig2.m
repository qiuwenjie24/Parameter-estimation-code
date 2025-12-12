%% Fig2
clear
figure
%% (a)
subplot(1,2,1);
SN_X = xlsread('Fig_SN_X.xlsx');
for ii = [0.001, 0.005, 0.02, 0.04, 0.05, 0.06, 0.08, 0.1]
    FileName = ['Fig_SN_Y_',num2str(ii),'.xlsx'];
    SN_Y = xlsread(FileName);
    
    leg_beta = ['$\Delta t =$', num2str(ii)];
    if ii == 0.001
        h1 = plot(SN_X, SN_Y, 'o-k','DisplayName',leg_beta,'LineWidth',1);
    else 
        h1 = plot(SN_X, SN_Y, 'o-','DisplayName',leg_beta,'LineWidth',1);
    end
    hold on
    set(h1,'markerfacecolor',get(h1,'color'));
end
    
legend
legend('Location','northwest','interpreter','latex','FontSize',14)
xlabel('$L$','interpreter','latex','FontSize',14)
ylabel('$S_\textrm{vn}(L/2,L)$','interpreter','latex','FontSize',14)
set(gca,'linewidth',1.5,'FontSize',14)
% set(gca,'XScale','log')
xlim([10 100])
xticks([10,50,100])
text(7.0,7.5,'(a)','FontSize',14)

%% (b)
subplot(1,2,2)
SH_X = xlsread('Fig_Shanon_X.xlsx');

for ii = [0.005, 0.02, 0.04, 0.06, 0.1]
    FileName = ['Fig_Shanon_Y_',num2str(ii),'.xlsx'];
    SH_Y = xlsread(FileName);
    
    leg_beta = ['$\Delta t =$', num2str(ii)];
    h1 = plot(SH_X, SH_Y, '-','DisplayName',leg_beta,'LineWidth',3);
    hold on
    set(h1,'markerfacecolor',get(h1,'color'));
end

legend
legend('Location','northwest','interpreter','latex','FontSize',14)
xlabel('$t/\Delta t$','interpreter','latex','FontSize',14);
ylabel('$S_\textrm{sh}(t)$','interpreter','latex','FontSize',14);
set(gca,'linewidth',1.5,'FontSize',14)
text(-150,5.26,'(b)','FontSize',14)