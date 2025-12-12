%% Fig5
clear
figure
%% (a)
subplot(3,1,1)
Mean_X = xlsread('Fig_Mean_X.xlsx');
for ii = [0.005, 0.02, 0.04, 0.06, 0.1]
    FileName = ['Fig_Mean_Y_',num2str(ii),'.xlsx'];
    Mean_Y = xlsread(FileName);
    
    leg_beta = ['$\beta =$', num2str(ii)];
    h1 = plot(Mean_X, Mean_Y, '-','DisplayName',leg_beta,'LineWidth',3);
    hold on
    set(h1,'markerfacecolor',get(h1,'color'));
end

% legend
% legend('Location','northwest','interpreter','latex','FontSize',14)
set(gca,'FontSize',12,'linewidth',1.5)
% set(gca,'XScale','log')
% xlabel('sample size n')
ylabel('$\|\bar{\theta}_{es}(n) - {\theta}_{tr} \|$','interpret','latex')
xlim([1000 9000]); %ylim([0.02 0.1])
text(500,0.09,'(a)','FontSize',14)

%% (b)
subplot(3,1,2)
Var_X = xlsread('Fig_Var_X.xlsx');
for ii = [0.005, 0.02, 0.04, 0.06, 0.1]
    FileName = ['Fig_Var_Y_',num2str(ii),'.xlsx'];
    Var_Y = xlsread(FileName);
    
    leg_beta = ['$\beta =$', num2str(ii)];
    h1 = plot(Var_X, Var_Y, '-','DisplayName',leg_beta,'LineWidth',3);
    hold on
    set(h1,'markerfacecolor',get(h1,'color'));
end

% legend
% legend('Location','northwest','interpreter','latex','FontSize',14)
set(gca,'FontSize',12,'linewidth',1.5)
% set(gca,'XScale','log')
% xlabel('sample size n')
ylabel('Var $\theta_{es}(n)$','interpret','latex')
xlim([1000 9000])
text(500,0.44,'(b)','FontSize',14)

%% (c)
subplot(3,1,3)
MSE_X = xlsread('Fig_MSE_X.xlsx');
for ii = [0.005, 0.02, 0.04, 0.06, 0.1]
    FileName = ['Fig_MSE_Y_',num2str(ii),'.xlsx'];
    MSE_Y = xlsread(FileName);
    
    leg_beta = ['$\beta =$', num2str(ii)];
    h1 = plot(Var_X, MSE_Y, '-','DisplayName',leg_beta,'LineWidth',3);
    hold on
    set(h1,'markerfacecolor',get(h1,'color'));
end

legend
legend('Location','northwest','interpreter','latex','FontSize',14)
set(gca,'FontSize',12,'linewidth',1.5)
% set(gca,'XScale','log')
xlabel('sample size n')
ylabel('MSE $\theta_{es}(n)$','interpret','latex')
xlim([1000 9000])
text(500,0.44,'(c)','FontSize',14)