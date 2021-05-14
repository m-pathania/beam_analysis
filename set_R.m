% return table showing rection force and moment at each node.
% set_R(R_vector,data_of_nodes(cord),decimal_place_to_ignore(Default_9))
function out = set_R(x,coord,c)
if nargin == 2
    c = 9;
end
out = zeros(size(coord,1),4);
for ii=1:size(coord,1)
    out(ii,:) = [coord(ii,:) x(2*(ii-1)+1) x(2*ii)];
end
out = imp(out,c);
out = array2table(out,'VariableNames',{'Node','Location','Load_Reaction','Moment_Reaction'});
end