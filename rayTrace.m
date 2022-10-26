function [rayF,x2] = ray_trace(ray,M,R,a,dx)
%ray vector
%ray transformation matrix
rayF = M*ray;
x1 = lens_edge(ray(1),R(1),a);
x2 =  lens_edge(rayf(1),R(2),a);
ray1x = [x1:dx:x2];
ray1y = ray(1)+0*[x1:dx:x2];

plot([-x1,x2],[ray(1),rayF(1)])
end

