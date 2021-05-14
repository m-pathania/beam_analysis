% Returns the load and stiffness matrix
% This does not contain the Integrand
% stiff_mat(conn,cord,xi,wi)
function [K, F] = stiff_mat(conn,cord,xi,wi)
pt = length(xi);
ne = size(conn,1);
K = zeros(size(cord,1)*2);
F = zeros(size(cord,1)*2,1);

for ii=1:ne
    kele = zeros(4,4);
    fele = zeros(4,1);
    x = [cord(conn(ii,2),2) cord(conn(ii,3),2)].';
    for jj = 1:pt
        kele = kele + Stiff(xi(jj),x)*wi(jj);
        fele= fele + Load(xi(jj),x)*wi(jj);
    end
    n1 = conn(ii,2);
    n2 = conn(ii,3);
    gdof = [2*n1-1 2*n1 2*n2-1 2*n2];
    K(gdof,gdof) = K(gdof,gdof) + kele;
    F(gdof) = F(gdof) + fele;
end
end

