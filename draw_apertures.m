function  draw_apertures(x,D,w)
%UNTITLED13 Summary of this function goes here
%   Detailed explanation goes here


plot([x,x+w],[D/2,D/2],'r')
plot([x,x],[D/2,D/2+w],'r')
plot([x+w,x+w],[D/2,D/2+w],'r')

plot([x,x+w],-[D/2,D/2],'r')
plot([x,x],-[D/2,D/2+w],'r')
plot([x+w,x+w],-[D/2,D/2+w],'r')


end

