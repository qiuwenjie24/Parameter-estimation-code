%% shanon entropy
%probability-vP
function res = fn_Sh_Entropy(vP)

vP = real(vP);
% vP = vP/sum(vP);
vP(vP<eps) = eps;

res = -sum(vP.*log2(vP));

end