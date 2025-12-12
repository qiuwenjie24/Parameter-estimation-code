%partial_th <c+(i) c(i)>
%现在态At，总长度L, 粒子数N
%假设初始A0是单位矩阵，且At是直接归一化
function res = fn_Cor_pd(At, L, N)

B0 = eye(L);       %matrix of initial state
B0(:,[N,N+1]) = B0(:,[N+1,N]);
Bt = At*B0;

[Q,R] = qr(At);
temp1 = diag(R);   %N*1
tempA = prod( temp1(1:N) ,'all');

C = Q'*Bt;
Q_p = Q';

Cor_pd1 = zeros(1,L);
for jj2 = 1:N
    
    for jj1 = [jj2, N+1: L]
        
        if jj1==jj2
            vm = 1:N;
            Cof = 1;
        else
            vm = [1:N,jj1];
            vm(vm==jj2) = [];
            Cof = (-1)^(N-jj2);
        end
        
        for n = 1:L
            temp2 = Q_p(jj1,n)*Q(n,jj2)*Cof*conj(det(C(vm,1:N)))*tempA;
            Cor_pd1(n) = Cor_pd1(n) + temp2;
        end
        
    end
end

Cor_pd1 = (1j)*Cor_pd1;    %<Bt|c+(i) c(i)|At>
Cor_pd2 = conj(Cor_pd1);   %<At|c+(i) c(i)|Bt>
res = Cor_pd1 + Cor_pd2;

end


