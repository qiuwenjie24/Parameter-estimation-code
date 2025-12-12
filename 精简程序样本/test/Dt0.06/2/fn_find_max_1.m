%% find th of maximum probability
%通过不断比较邻近点找到似然概率最大值
%state matrix-A=Af*U_th, particle number-N
function res = fn_find_max_1(Af, N, H_s, vep, th0)

th = th0;   %given inital th
lr = 1e-4;  %learing rate

while 1
    U_th = H_s* diag( exp(-1i*th*vep) ) *H_s';   %encoding operator theta
    A_th = Af*U_th;
    
    %-------------near points------------
    %----[th_M2,th_M,th,th_P,th_P2]-----
    U_th_P = H_s* diag( exp(-1i*(th+lr)*vep) ) *H_s';
    A_th_P = Af*U_th_P;
    U_th_P2 = H_s* diag( exp(-1i*(th+lr+lr)*vep) ) *H_s';
    A_th_P2 = Af*U_th_P2;
    U_th_M = H_s* diag( exp(-1i*(th-lr)*vep) ) *H_s';
    A_th_M = Af*U_th_M;
    U_th_M2 = H_s* diag( exp(-1i*(th-lr-lr)*vep) ) *H_s';
    A_th_M2 = Af*U_th_M2;
    %-------------near points------------
    
    OverLap = fn_OverLap(A_th,A_th,N);
    OverLap_P = fn_OverLap(A_th_P,A_th_P,N);
    OverLap_P2 = fn_OverLap(A_th_P2,A_th_P2,N);
    OverLap_M = fn_OverLap(A_th_M,A_th_M,N);
    OverLap_M2 = fn_OverLap(A_th_M2,A_th_M2,N);
    
%     fprintf('th = %f, OverLap = %f, OverLap_M = %f, OverLap_P = %f \n',...
%         th,OverLap,OverLap_M,OverLap_P);
    
    tep1 = [OverLap_M2, OverLap_M, OverLap, OverLap_P, OverLap_P2];
    tep1 = real(tep1);
    [~,tep2] = max(tep1);  %= find(tep1 == max(tep1));
    
    if tep2 < 3
        th = th - lr;
    elseif tep2 > 3
        th = th + lr;
    elseif tep2 == 3
        break;
    end
    
    
end

res = th;

end