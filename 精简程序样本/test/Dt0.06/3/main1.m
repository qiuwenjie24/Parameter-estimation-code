%% estimate1
clear
% diary main1.out %开启日志记录

%% parameter
gamma = 10;   %measurement strength

L = 40;       %total length 
th = 2.0;     %estimated parameter 
aver_num = 2000; %average number
Dt = 0.06;   %small time interval

Tnum = 1000;   %time number
Time = Dt*Tnum; 

tic  
[vF_all, vE_sh_all, ind_p_all, A_fin_all, B_fin_all] = fn_measure(th, L, gamma, Dt, Tnum, aver_num); 

endtime = toc()
FileName = ['estimate1'];
save(FileName)


% diary off %关闭日志记录