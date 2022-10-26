function [rayF,x1,x2] = ray_trace(ray,M,R,a,dx)
%ray vector
%ray transformation matrix
rayF = M*ray;
x1 = lens_edge(ray(1),R(1),a(1));
x2 =  lens_edge(rayF(1),R(2),a(2));
plot([x1,x2],[ray(1),rayF(1)],'g')
end

