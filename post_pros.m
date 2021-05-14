% This Function do post processing and Plots the result
% post_pros(No_of_Elements,un_vec,cord,conn)
function u_nn = post_pros(ne,un,cord,conn)
a = 20;
x_e = zeros(a*ne,1);
u_nn = zeros(a*ne,1);
xi = linspace(-1,1,a).';
Nx = [(1-xi)/2 (1+xi)/2];
for ii=1:ne
    n1 = conn(ii,2);
    n2 = conn(ii,3);
    gdof = [2*n1-1 2*n1 2*n2-1 2*n2];
    x = [cord(conn(ii,2),2) cord(conn(ii,3),2)].';
    Le = x(2) - x(1);
    u_n = un(gdof);
    N1 = (1/4)*((1-xi).^2).*(2+xi);
    N2 = (1/4)*((1-xi).^2).*(1+xi);
    N3 = (1/4)*((1+xi).^2).*(2-xi);
    N4 = (1/4)*((1+xi).^2).*(xi-1);
    N = [N1 (Le*N2/2) N3 (Le*N4/2)];
    x_e((a*(ii-1))+1:ii*a) = Nx*x;
    u_nn((a*(ii-1))+1:ii*a) = N*u_n;
end
figure(1)
plot(x_e,u_nn)
set(gca, 'YDir','reverse')
xlabel('x --->')
ylabel('Deflection (Downward Positive)')
title('Deflection vs Distance graph')
% for ii=1:length(u_nn)
%     if(rem(ii,2)==0)
%         u_s(ii) = u_nn(ii);
%         x_s(ii) = x_e(ii);
%     else
%         u_d(ii) = u_nn(ii);
%         x_d(ii) = x_e(ii);
%     end
% end
% u_s = u_s(u_s~=0);
% u_d = u_d(u_d~=0);
% x_d = x_d(x_d~=0);
% x_s = x_s(x_s~=0);
% hold on
% plot(x_d,u_d,'r+')
% plot(x_s,u_s,'b--')
% hold off
end

