%% figure-3
close all
clear

%% average value of all th 
clear
FileName = ['estimate3'];
load(FileName)

th_sim_new = th_sim_best;
% th_sim_new(th_sim_new<-1+0.0001)=[];  %排除过于偏离范围的估计值
% th_sim_new(th_sim_new>3-0.0001)=[];
num_new = max(size(th_sim_new));
th_sim_aver_new = zeros(1,num_new);

for jj2 = 1:num_new
    th_sim_aver_new(jj2) = mean(th_sim_new(1:jj2),'all');
end

figure
plot(1:num_new,th_sim_aver_new,'o-')
hold on 
plot( [1,num_new], [1,1],'--k','LineWidth',2)
xlabel('average number n')
ylabel('average estimator $\bar{\theta}_{es}(n)$','interpret','latex')
