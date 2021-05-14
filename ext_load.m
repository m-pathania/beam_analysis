% Applies the external loads and moments at specified GDOF
% ext_load(Load_Vector, External_Point_Load, External_Moment)

function F = ext_load(F,P,M) 
for ii = 1:size(P,1)
    if(P(ii,2)~=0)
    n1 = P(ii,1);
    F(2*n1-1) = F(2*n1-1) + P(ii,2);
    end
end
for ii = 1:size(M,1)
    if(M(ii,2)~=0)
    n1 = M(ii,1);
    F(2*n1) = F(2*n1) + M(ii,2);
    end
end
end

