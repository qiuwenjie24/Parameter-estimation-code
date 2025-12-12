%% measurement probability
%state matrix-A, measurement strength-gamma, particle number-N 
function res = fn_P(A, gamma, N)

[L, ~] = size(A);  %length

% particle_density
Cor_matrix = fn_Cor(A,N);  %L*L
temp_Cor = transpose( diag(Cor_matrix));  %1*L
particle_density = temp_Cor ./ real(fn_OverLap(A,A,N));  %normalization

% probability
vP = (1 + (exp(-gamma)-1)* particle_density)/(L + (exp(-gamma)-1)*N);
vP = real(vP);   %sum(vP)=1

if abs(sum(vP)-1)>1*1e-8
   fprintf('Error of vP is %d \n',abs(sum(vP)-1));
end

% vP(abs(vP)<1e-10) = 0;
vP = vP/sum(vP);
res = vP;

end