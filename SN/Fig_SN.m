%% Fig S-N
clear
N_num = 15;
load('data_SN_beta1.mat')
Ts = Tnum*0.7;   %saturation

figure
for jj1 = 1:beta_num
   
    FileName = ['data_SN_beta',num2str(jj1)];
    load(FileName,'SN_beta','beta','N_all')
   
    SN_beta_mean = zeros(N_num,1);
    for jj2 = 1:N_num
        temp1 = SN_beta{jj2};
        temp2 = real(temp1(:,Tnum-Ts+1:Tnum));
        temp3 = mean(temp2,'all');
        SN_beta_mean(jj2) = temp3;
    end
    
    leg_beta = ['$\beta =$', num2str(beta)];
    h1 = plot(N_all, SN_beta_mean, 'o-','DisplayName',leg_beta);
    hold on
    set(h1,'markerfacecolor',get(h1,'color'));
    
    DATA_filename = ['..\data_origin\Fig_SN_Y_',num2str(beta)];
    xlswrite([DATA_filename,'.xlsx'],SN_beta_mean);
end
xlswrite(['..\data_origin\Fig_SN_X','.xlsx'],N_all');

legend
legend('Location','northwest','interpreter','latex','FontSize',14)
xlabel('N','FontSize',14)
ylabel('$S_\textrm{vn}(N/2,N)$','interpreter','latex','FontSize',14)
% set(gca,'XScale','log')
xlim([10 100])
% title(['$\lambda=$',num2str(lambda)],'interpreter','latex','FontSize',14)



%%
clear
FileName = ['data_SN_beta1'];
load(FileName,'SN_beta','beta','N_all')
temp1 = SN_beta{23};
temp2 = temp1(1,:);
figure, plot(temp2)
% 
FileName = ['data_SN_beta8'];
load(FileName,'SN_beta','beta','N_all')
temp1 = SN_beta{23};
temp2 = temp1(1,:);
figure, plot(temp2)