function out = Load(xi,x)
global q0 L1 q2
Le = x(2) - x(1);
Nx = [(1-xi)/2 (1+xi)/2];
N1 = (1/4)*((1-xi)^2)*(2+xi);
N2 = (1/4)*((1-xi)^2)*(1+xi);
N3 = (1/4)*((1+xi)^2)*(2-xi);
N4 = (1/4)*((1+xi)^2)*(xi-1);
N = [N1 (Le*N2/2) N3 (Le*N4/2)];
xe = Nx*x;
if (xe<=L1)
    q = q0*(((xe/L1)-1)^2);
else
    q = 0;
end
out = (N.')*(q*Le/2);
end
