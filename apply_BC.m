% Applies BCs
% apply_BC(Stiffness_Mat,Load_Vec,U_BC_Data,No_of_Nodes)
function [un, R, K, F] = apply_BC(K,F,U,le)
Korg = K;
un = zeros(2*le,1);
sdof = un;
for ii= 1:size(U,1)
    n1 = U(ii,1);
    dof = U(ii,2);
    val = U(ii,3);
    gdof = 2*(n1-1) + dof;
    un(gdof) = U(ii,3);
    sdof(gdof) = gdof;
    if val~=0
        F = F-K(:,gdof)*val;
    end
end
rdof = 1:length(un);
rdof = rdof(sdof==0).';
sdof = sdof(sdof~=0);

sdof = sort(sdof);
for ii = 1:length(sdof)
    dof = sdof(ii);
    if dof == 1
        K = K(dof+1:end,dof+1:end);
        F = F(dof+1:end);
    elseif dof == 2*le
        K = K(1:dof-1,1:dof-1);
        F = F(1:dof-1);
    else
        K = K([1:dof-1,dof+1:end],[1:dof-1,dof+1:end]);
        F = F([1:dof-1,dof+1:end]);
    end
    
    if ii ~=length(sdof)
        sdof(ii+1:end) = sdof(ii+1:end) - 1;
    end
end


if nargout == 1
    un(rdof) = K\F;
elseif nargout ==2
    un(rdof) = K\F;
    R = Korg*un;
elseif nargout == 3
    un(rdof) = K\F;
    R = Korg*un;
elseif nargout ==4
    un(rdof) = K\F;
    R = Korg*un;
end
end