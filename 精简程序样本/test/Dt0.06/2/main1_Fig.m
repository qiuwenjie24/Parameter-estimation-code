%% figure-1
close all
clear
FileName = ['estimate1'];
load(FileName)
%% figure Shanon Entropy
figure

%aver_num*Tnum  to  1*Tnum
vE_sh_aver = mean(vE_sh_all, 1);
% vE_sh_std  = std(vE_sh_all,0,1);

plot((0:Tnum-1),vE_sh_aver, '-o');
xlabel('$t/ \delta t$','interpret','latex');
ylabel('Shanon Entropy');
title(['$Dt$=',num2str(Dt),', $\gamma=$',num2str(gamma)],...
       'interpret','latex')

%% figure Fisher information
figure

%aver_num*Tnum  to  1*Tnum
vF_aver = mean(vF_all, 1); 
% vF_std = std(vF_all,0,1);

plot( (1:Tnum),vF_aver, '-o');
xlabel('$t/ \delta t$','interpret','latex');
ylabel('Fisher information');
title(['$Dt$=',num2str(Dt),', $\gamma=$',num2str(gamma)],...
       'interpret','latex')


