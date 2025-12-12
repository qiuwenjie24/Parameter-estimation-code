%% estimate_W1  6.1h
% large time interval or weak measurement strength
clear

%% parameter
N = 40;       %total length 
th = 2.0;     %estimated parameter 
lambda = 10.00;   %measurement strength
Num_aver = 1000; %average number

%beta = 0.01测量主导，beta = 0.1演化主导
beta = 0.1;   %small time interval

Tnum = 1000;   %time number
Time = beta*Tnum; 

tic  
[vF_all, vE_sh_all, vE_vn_all, ind_p_all, A_fin_all, B_fin_all] = fn_measure(N,th,lambda,beta,Time,Num_aver); 

endtime = toc()
FileName = ['estimate_W1'];
save(FileName)


