%% Fig3
clear
figure
% 创建4个子图,'TileSpacing','tight'子图之间紧密贴合, 'Padding','tight'子图紧贴图形边框
t = tiledlayout(2, 4, 'TileSpacing', 'tight', 'Padding', 'tight'); 

%% dynamic of particle density
% (a)
nexttile;
load('..\particle_density\density_beta0.005.mat')
Aver_density = ( Aver_density(:,1:500) )';
x_custom = [1:size(Aver_density,2)];         % 横坐标
y_custom = [0:1:size(Aver_density,1)];    % 纵坐标
imagesc(x_custom, y_custom, (rot90(Aver_density, 0)) );      % 绘制热图
ylabel('$t/\Delta t$','interpreter','latex','FontSize',15); 
xlabel('$L$','interpreter','latex','FontSize',15);
set(gca, 'YDir', 'normal');
text(-5, 550, '(a)','FontSize',15)
text(3, 400, '$\Delta t=0.005$','interpreter','latex','FontSize',15)
set(gca,'FontSize',15,'linewidth',1.5)
title('  ')

% (b)
nexttile;
load('..\particle_density\density_beta0.02.mat')
Aver_density = ( Aver_density(:,1:500) )';
x_custom = [1:size(Aver_density,2)];         % 横坐标
y_custom = [0:1:size(Aver_density,1)];    % 纵坐标
imagesc(x_custom, y_custom, (rot90(Aver_density, 0)) );      % 绘制热图
ylabel('$t/\Delta t$','interpreter','latex','FontSize',15); 
xlabel('$L$','interpreter','latex','FontSize',15);
set(gca, 'YDir', 'normal');
text(-5, 550, '(b)','FontSize',15)
text(3, 400, '$\Delta t=0.02$','interpreter','latex','FontSize',15)
set(gca,'FontSize',15,'linewidth',1.5)

% (c)
nexttile;
load('..\particle_density\density_beta0.03.mat')
Aver_density = ( Aver_density(:,1:500) )';
x_custom = [1:size(Aver_density,2)];         % 横坐标
y_custom = [0:1:size(Aver_density,1)];    % 纵坐标
imagesc(x_custom, y_custom, (rot90(Aver_density, 0)) );      % 绘制热图
ylabel('$t/\Delta t$','interpreter','latex','FontSize',15); 
xlabel('$L$','interpreter','latex','FontSize',15);
set(gca, 'YDir', 'normal');
text(-5, 550, '(c)','FontSize',15)
text(3, 400, '$\Delta t=0.03$','interpreter','latex','FontSize',15)
set(gca,'FontSize',15,'linewidth',1.5)

% (d)
nexttile;
load('..\particle_density\density_beta0.04.mat')
Aver_density = ( Aver_density(:,1:500) )';
x_custom = [1:size(Aver_density,2)];         % 横坐标
y_custom = [0:1:size(Aver_density,1)];    % 纵坐标
imagesc(x_custom, y_custom, (rot90(Aver_density, 0)) );      % 绘制热图
ylabel('$t/\Delta t$','interpreter','latex','FontSize',15); 
xlabel('$L$','interpreter','latex','FontSize',15);
set(gca, 'YDir', 'normal');
colorbar;        % 显示颜色条
text(-5, 550, '(d)','FontSize',15)
text(3, 400, '$\Delta t=0.04$','interpreter','latex','FontSize',15)
set(gca,'FontSize',15,'linewidth',1.5)

% 添加共享颜色条（自动适应布局）
% colorbar('Layout', 'east'); % 颜色条放在右侧，子图均匀缩小

%% particle distribution
% (e)
nexttile;
PD_Y = xlsread('PD_Y.xlsx');
plot(PD_Y,'-ok','markerfacecolor','k');
set(gca,'FontSize',12,'linewidth',1.5)
xlabel('lattice site','FontSize',15)
ylabel('particle probability','FontSize',15)
axis([0 40 0 1])
text(-5,1.05,'(e)','FontSize',15)

% (f)
nexttile;
PD_Yw = xlsread('PD_Yw.xlsx');
plot(PD_Yw,'-ok','markerfacecolor','k');
set(gca,'FontSize',12,'linewidth',1.5)
xlabel('lattice site','FontSize',15)
ylabel('particle probability','FontSize',15)
axis([0 40 0 1])
text(-5,1.05,'(f)','FontSize',15)

% (g)
nexttile;
PD_Ys = xlsread('PD_Ys.xlsx');
plot(PD_Ys,'-ok','markerfacecolor','k');
set(gca,'FontSize',15,'linewidth',1.5)
xlabel('lattice site','FontSize',15)
ylabel('particle probability','FontSize',15)
axis([0 40 0 1])
text(-5,1.05,'(g)','FontSize',15)

%% Fisher
% (h)
nexttile;
F_X = xlsread('Fig_Fisher_X.xlsx');

for ii = [0.005, 0.02, 0.04, 0.06, 0.1]
    FileName = ['Fig_Fisher_Y_',num2str(ii),'.xlsx'];
    F_Y = xlsread(FileName);
    
    leg_beta = ['$\Delta t =$', num2str(ii)];
    h1 = plot(F_X, F_Y, '-','DisplayName',leg_beta,'LineWidth',3);
    hold on
    set(h1,'markerfacecolor',get(h1,'color'));
end

set(gca,'FontSize',15,'linewidth',1.5)
set(gca,'XScale','log')
xlabel('$t/\Delta t$','interpreter','latex','FontSize',20);
ylabel('$F(t)$','interpreter','latex','FontSize',20);
text(0.5, 0.095,'(h)','FontSize',15)
axis([1 1000 0 0.09])

legend
legend('Location','northeast','interpreter','latex','FontSize',15)