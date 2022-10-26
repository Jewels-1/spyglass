function [x] = lens_edge(y,R,a)
%y range over which solution is computed
%radius of curvature
%offset along x axis
%et,eb top and bottom lines
if R >0
    x = a-(R^2-y.^2).^0.5
elseif R<0
    x =a+(R^2-y.^2).^0.5
end

