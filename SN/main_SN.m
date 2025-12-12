%% S-N for beta
%beta = 0.01测量主导S，beta = 0.1演化主导W
clear
N_all = [10:4:100];
beta_all = [0.001, 0.005, 0.02, 0.04, 0.05, 0.06, 0.08, 0.10];
N_num = max(size(N_all));
beta_num = max(size(beta_all));

%注： time number--Tnum；average number--Num_aver 要确定好
%% parameter
th = 2.0;     %estimated parameter 
lambda = 10.00;   %measurement strength
Num_aver = 200; %average number 
Tnum = 5000;   %time number  


for jj1 = 1:beta_num
    beta = beta_all(jj1);   %evolution time interval
    Time = beta*Tnum;
    
    tic
    jj1
    SN_beta = cell(N_num,1);
    for jj2 = 1:N_num
        N = N_all(jj2);       %total length 

        [vE_vn_t,~,~] = fn_Svn_t(N,th,lambda,beta,Time,Num_aver); 
        
        SN_beta{jj2} = vE_vn_t;
        fprintf('jj1-jj2 = %d - %d \n', jj1,jj2)
    end
    
    endtime = toc()
    FileName = ['data_SN_beta',num2str(jj1)];
    save(FileName,'N_all','beta','th','lambda','Num_aver','Tnum',...
     'SN_beta','endtime','beta_num','N_num')
end
