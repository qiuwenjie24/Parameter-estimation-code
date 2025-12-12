%% correlation matrix <At|c+(i) c(j)|At>
%态At，总长度L, 粒子数N
function res = fn_Cor(At, N)

[Q,R] = qr(At);
tempQ = transpose(Q(:,1:N) * Q(:,1:N)');

temp1 = diag( R .* conj(R) );
tempR = prod( temp1(1:N) ,'all'); 

res = tempQ .* tempR;      %L*L

end


