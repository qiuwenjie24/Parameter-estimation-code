%% 合并Fig_W3,Fig_S3,
close all
clear

%% W3 
FileName = ['estimate_W3'];
load(FileName)

th_sim_new = th_sim;
num_new = max(size(th_sim_new));
th_sim_aver_new = zeros(1,num_new);

for jj2 = 1:num_new
    th_sim_aver_new(jj2) = mean(th_sim_new(1:jj2),'all');
end

th_sim_W3 = th_sim_new;
th_sim_aver_W3 = th_sim_aver_new;
beta = 0.1;
leg_W = ['$\beta=$',num2str(beta)];

%% S3 
FileName = ['estimate_S3'];
load(FileName)

th_sim_new = th_sim;
num_new = max(size(th_sim_new));
th_sim_aver_new = zeros(1,num_new);

for jj2 = 1:num_new
    th_sim_aver_new(jj2) = mean(th_sim_new(1:jj2),'all');
end

th_sim_S3 = th_sim_new;
th_sim_aver_S3 = th_sim_aver_new;
beta = 0.005;
leg_S = ['$\beta=$',num2str(beta)];

%%
figure
plot(1:num_new,abs(th_sim_aver_W3),'-','DisplayName',leg_W,'LineWidth',3)
hold on 
plot(1:num_new,abs(th_sim_aver_S3),'-','DisplayName',leg_S,'LineWidth',3)
hold on 
plot( [1,num_new], [2,2],'--k','DisplayName',['$\theta=2$'],'LineWidth',2)
xlabel('average number n')
ylabel('average estimator $\bar{\theta}_{es}(n)$','interpret','latex')
title('$\lambda = 10$','interpret','latex')

legend
legend('Location','northeast','interpreter','latex','FontSize',14)


%%
figure
edges = [-0.9:0.2:3.7];
hw = histogram(th_sim_W3, edges, 'Normalization','probability');
xlabel('$\theta_{es}$','interpret','latex')
ylabel('Probability')
title('W--$\lambda = 10,\beta = 0.1$','interpret','latex')

figure
hs = histogram(th_sim_S3, edges, 'Normalization','probability');
xlabel('$\theta_{es}$','interpret','latex')
ylabel('Probability')
title('S--$\lambda = 10,\beta = 0.005$','interpret','latex')
