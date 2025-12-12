%% 计算平均粒子数密度
clear
% aver_num = 50;  %average trajectory numbers
% for beta = [0.005, 0.04, 0.06, 0.1]
%     beta
%     Aver_density = fn_Particle_density(beta, aver_num);
%     FileName = ['density_beta',num2str(beta),'.mat'];
%     save(FileName,'beta','aver_num','Aver_density')
% end

%% new
aver_num = 50;  %average trajectory numbers
for beta = [0.01, 0.02, 0.03]
    beta
    Aver_density = fn_Particle_density(beta, aver_num);
    FileName = ['density_beta',num2str(beta),'.mat'];
    save(FileName,'beta','aver_num','Aver_density')
end