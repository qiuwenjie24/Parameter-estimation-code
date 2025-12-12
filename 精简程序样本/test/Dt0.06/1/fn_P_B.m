%% measurement probability
%state matrix-B（QR归一化）, measurement strength-gamma, particle number-N 
function res = fn_P_B(B, gamma, N)

[L, ~] = size(B);  %length

% Cor_matrix = fn_Cor(A,N);  %L*L
% temp_Cor = transpose( diag(Cor_matrix));  %1*L
% particle_density = temp_Cor ./ real(fn_OverLap(A,A,N));  %normalization
%--particle_density,若矩阵是幺正的，使用下面方式，否则使用上面通用的方式--
Cor_matrix = transpose(B(:,1:N) * B(:,1:N)');
particle_density = transpose( diag(Cor_matrix));

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