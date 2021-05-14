function out = Stiff(xi,x)
global E I
Le = x(2) - x(1); 
B1 = (3/2)*xi;
B2 = (Le/4)*(3*xi-1);
B3 = (-3/2)*xi;
B4 = (Le/4)*(3*xi+1);
B = [B1 B2 B3 B4]*(4/Le^2);
out = (E*I*Le/2)*(B.'*B);
end

