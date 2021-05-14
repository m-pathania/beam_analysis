% It returns a table showing dispalcement and slope at node.
% set_u(un_vector,data_of_node(cord),decimal_place_to_ignore(Default_9))
function out = set_u(x,coord,c)
if nargin == 2
    c = 9;
end
out = zeros(size(coord,1),4);
for ii=1:size(coord,1)
    out(ii,:) = [coord(ii,:) x(2*(ii-1)+1) x(2*ii)];
end
out = imp(out,c);
out = array2table(out,'VariableNames',{'Node','Location','Difflection','slope'});
end