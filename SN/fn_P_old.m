%% measurement probability
%state matrix-A, measurement strength-lambda, particle number-M
%require A'* A=1, unitary
function res = fn_P_old(A, lambda, M)

[N, ~] = size(A);  %length

% tep1 = fn_Cor(A,M);  %N*N   <a+_j a_i>
A_new = A(:,1:M);   %这种得到cor_D的方法只适用于A是幺正的情况
tep1= transpose(A_new*A_new');

tep2 = transpose( diag(tep1));  %1*N  <a+_i a_i>
Cor_ada = tep2./fn_OverLap(A,A,M);
% Cor_ada = Cor_ada.*M./sum(Cor_ada);
% sum(Cor_ada)

vP = (1 + (exp(-lambda)-1)* Cor_ada)/(N + (exp(-lambda)-1)*M);
vP = real(vP);  %probability sum(vP)=1

if abs(sum(vP)-1)>1e-8
   fprintf('Error of vP_old is %d \n',abs(sum(vP)-1));
%    pause(10)
end

vP = vP/sum(vP);
res = vP;
end