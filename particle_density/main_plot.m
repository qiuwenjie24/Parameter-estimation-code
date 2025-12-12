%% figure
clear
figure
% 创建4个子图,'TileSpacing','tight'子图之间紧密贴合, 'Padding','tight'子图紧贴图形边框
t = tiledlayout(2, 2, 'TileSpacing', 'tight', 'Padding', 'tight'); 
%% (d)
nexttile;
load('density_beta0.005.mat')
Aver_density = ( Aver_density(:,1:500) )';
x_custom = [1:size(Aver_density,2)];         % 横坐标
y_custom = [0:1:size(Aver_density,1)];    % 纵坐标
imagesc(x_custom, y_custom, (rot90(Aver_density, 0)) );      % 绘制热图
ylabel('$t/\Delta t$','interpreter','latex','FontSize',14); 
xlabel('$L$','interpreter','latex','FontSize',14);
set(gca, 'YDir', 'normal');
title('(d)')
set(gca,'FontSize',12,'linewidth',1.5)

%% (e)
nexttile;
load('density_beta0.02.mat')
Aver_density = ( Aver_density(:,1:500) )';
x_custom = [1:size(Aver_density,2)];         % 横坐标
y_custom = [0:1:size(Aver_density,1)];    % 纵坐标
imagesc(x_custom, y_custom, (rot90(Aver_density, 0)) );      % 绘制热图
ylabel('$\tau$','interpreter','latex','FontSize',14); 
xlabel('$L$','interpreter','latex','FontSize',14);
set(gca, 'YDir', 'normal');
title('(e)')
set(gca,'FontSize',12,'linewidth',1.5)

%% (f)
nexttile;
load('density_beta0.03.mat')
Aver_density = ( Aver_density(:,1:500) )';
x_custom = [1:size(Aver_density,2)];         % 横坐标
y_custom = [0:1:size(Aver_density,1)];    % 纵坐标
imagesc(x_custom, y_custom, (rot90(Aver_density, 0)) );      % 绘制热图
ylabel('$\tau$','interpreter','latex','FontSize',14); 
xlabel('$L$','interpreter','latex','FontSize',14);
set(gca, 'YDir', 'normal');
title('(f)')
set(gca,'FontSize',12,'linewidth',1.5)

%% (g)
nexttile;
load('density_beta0.04.mat')
Aver_density = ( Aver_density(:,1:500) )';
x_custom = [1:size(Aver_density,2)];         % 横坐标
y_custom = [0:1:size(Aver_density,1)];    % 纵坐标
imagesc(x_custom, y_custom, (rot90(Aver_density, 0)) );      % 绘制热图
ylabel('$\tau$','interpreter','latex','FontSize',14); 
xlabel('$L$','interpreter','latex','FontSize',14);
set(gca, 'YDir', 'normal');
colorbar;        % 显示颜色条
title('(g)')
set(gca,'FontSize',12,'linewidth',1.5)

% 添加共享颜色条（自动适应布局）
% colorbar('Layout', 'east'); % 颜色条放在右侧，子图均匀缩小