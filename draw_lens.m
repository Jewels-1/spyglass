function [topLine,botLine] =   draw_lens(x_l,x_r,y,dx)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here

topLine = [x_l(end):dx:x_r(end)]
botLine = [x_l(1):dx:x_r(1)]

line(x_l,y)
line(x_r,y)

line(topLine,max(y)+0*[x_l(end):dx:x_r(end)])
line(botLine,min(y)+0*[x_l(1):dx:x_r(1)])


end

