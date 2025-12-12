%% find th of maximum probability by Gradient Descent
%state matrix-A=Af*U_th, particle number-N 
function res = fn_find_max_GD(Af, N, H_s, vep, th0)

th = th0;   %given inital th
lr = 1e-6;  %learing rate

L = max(size(Af));
while 1
    U_th = H_s* diag( exp(-1i*th*vep) ) *H_s';   %encoding operator theta
    A_th = Af*U_th;
    
    dth = fn_OverLap_pd(A_th, L, N);
    if abs(dth)<1e-7
        break;
    end
    th = th + lr*dth;

end

res = th;

end