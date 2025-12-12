%% overlap of Gussian states for <A|B>
%state matrix-A,B particle number-N 
function res = fn_OverLap(A, B, N)

[Q,R] = qr(A);

C = Q'*B; 
tempC = det( C( 1:N, 1:N) );

temp1 = diag(R);
tempR = prod( temp1(1:N) ,'all'); 

res = conj(tempR)*tempC;

end
