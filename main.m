clear; clc;


xi = [0, sqrt(3/5), -sqrt(3/5)];
wi = [8/9, 5/9, 5/9];
%% Input Data

global E I L1 q0
E = 90e6;           % Young's Modulus (Pa)
I = 8.1e-6;         % Moment of Inertia
L1 = 0.8;           % length of beam (m)
q0 = 1e3;           % distibuted load (N/m)

% cord stores the coodinates of the nodes
% 1st column is node
% 2nd column is coordinate of the node
% cord = [[1:9].' linspace(0,L,9).'];
cord = [1 0;
    2 0.2;
    3 0.44;
    4 0.6];

% conn stores the nodes of the elements
% Ist column is element
% 2nd and 3rd Column are Nodes
% conn = zeros(size(cord,1)-1,3);
% for ii = 1:(size(cord,1)-1)
%     conn(ii,:) = [ii ii ii+1];
% end
conn = [1 1 2;
    2 2 3;
    3 3 4;];

% Point Loads and Moments
% 1st column is node
% 2nd column is value
P = [3 0e3;
    4 5e3];
M = [1 00e3
    4 00e3];

% Deflections and slopes (BCs)
% 1st column is node
% 2nd column is local DOF (1 = def, 2 = slope)
% 3rd column is value
U = [1 1 0;
    1 2 0];
%% Solution

% Stiffness and Load Vector before Boundary condition.
[K, F] = stiff_mat(conn,cord,xi,wi);

% Load Vector after imposing external load.
F = ext_load(F,P,M);

[un, R,Kred,Fred] = apply_BC(K,F,U,size(cord,1));
%% Postprocessing
R = set_R(R,cord);
u_data = set_u(un,cord);

% Printing Solution
fprintf("Coordinate Matrix\n    Node    Position\n");
disp(cord);

fprintf("Connection Mtarix :\nElement\tNode1\tNode2\n");
disp(conn);

fprintf("Global Stiffnes Matrix (%d, %d)\n",size(K,1),size(K,2));
disp(K);
fprintf("Global Load Vector (%d, %d)\n",size(F,1),size(F,2));
disp(F);

fprintf("Reduced Stiffnes Matrix (%d, %d)\n",size(Kred,1),size(Kred,2));
disp(Kred);
fprintf("Reduced Load Vector (%d, %d)\n",size(Fred,1),size(Fred,2));
disp(Fred);
fprintf("Deflection and slope\n");
disp(u_data);

fprintf("Reactions\n");
disp(R)

% Plot is negative of the displacement
unn = post_pros(size(conn,1),un,cord,conn);

fprintf("\nMaximum Deflection\n")
fprintf("%f\n", max(unn));