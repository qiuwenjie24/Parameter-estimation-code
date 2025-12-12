%% partial derivative of measurement probability for theta
%state matrix-A, measurement strength-gamma, particle number-N 
%fn_Cor_pd、fn_OverLap_pd假设初始A0是单位矩阵，且At是直接归一化
function res = fn_P_pd(A, gamma, N)

[L, ~] = size(A);  %length

temp1 = fn_Cor_pd(A, L, N);          %1*L
temp2 = transpose( diag(fn_Cor(A,N)) );  %1*L
temp3 = fn_OverLap_pd(A, L, N);         %1*1
temp4 = fn_OverLap(A, A, N);

density_pd = temp1./temp4 - temp2.*temp3./( (temp4).^2);

vP_pd = ( (exp(-gamma)-1)* density_pd )/( L + (exp(-gamma) - 1)*N );
vP_pd = real(vP_pd);
res = vP_pd;

end
