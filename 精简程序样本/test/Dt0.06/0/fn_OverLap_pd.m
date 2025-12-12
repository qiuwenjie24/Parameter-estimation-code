%partial_th <Psi_A| Psi_A>
%现在态At，总长度L, 粒子数N
%假设初始A0是单位矩阵，A0=eye(L)，且At是直接归一化
function res = fn_OverLap_pd(At, L, N)

B0 = eye(L);       %matrix of initial state
B0(:,[N,N+1]) = B0(:,[N+1,N]);
Bt = At*B0;

[Q,R] = qr(At);
temp1 = diag(R);  %N*1
tempA = prod( temp1(1:N) ,'all'); 

C = Q'*Bt;

OverLap_pd1 = (1j)*tempA*conj(det(C(1:N,1:N)));  %<Bt|At>
OverLap_pd2 = conj(OverLap_pd1);                %<At|Bt>

res = OverLap_pd1 + OverLap_pd2;
end




