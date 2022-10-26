%draw lenses
dx=0.1;
%Doublet lens
y_a = [-ra-0.5:dx:ra+0.5];
%x_s1 = (RObj(1))-(RObj(1)^2-y_a.^2).^0.5;
%crown
a1 = RObj(1);
x_s1 = lens_edge(y_a,RObj(1),a1)
aa = RObj(2)+tObj
x_s2 = lens_edge(y_a,RObj(2),aa)
%flint
a2 = RObj(2)+ tObj +dDoub;
x_f1 =  lens_edge(y_a,RDoub(1),a2)
a3 = RDoub(2)+tDoub+tObj+ dDoub;
x_f2 =  lens_edge(y_a,RDoub(2),a3)
%eyepiece lens
y_e = [-re:0.1:re];
a4 = (tDoub+dDoub+tObj+dT)-abs(Re(1))
x_e1 =  lens_edge(y_e,Re(1),a4);
a5 = ((tDoub+dDoub+tObj+dT)+te)+abs(Re(2))
x_e2 = lens_edge(y_e,Re(2),a5);


figure
%draw doublet
[topLine,botLine]  = draw_lens(x_s1,x_s2,y_a,dx)
[topLine,botLine]  = draw_lens(x_f1,x_f2,y_a,dx)
%draw eyepiece
[topLine,botLine]  = draw_lens(x_e1,x_e2,y_e,dx)
axis([-10 400 -30 30])
hold on


%draw rays through the system
%draw top marginal ray
ray=[24.5;0]
[rayF,x1,x2] = ray_trace(ray,Lo,[RObj(1),RObj(2)],[a1,aa],dx)
plot([-5,x1],[24.5,ray(1)],'g')
[raye,x1,x2] = ray_trace(rayF,Td,[RObj(2),RDoub(1)],[aa,a2],dx)
[rayg,x1,x2] = ray_trace(raye,Ld,[RDoub(1),RDoub(2)],[a2,a3],dx)
[rayh,x1,x2] = ray_trace(rayg,Tm,[RDoub(2),Re(1)],[a3,a4],dx)
[rayi,x1,x2] = ray_trace(rayh,Reye,[Re(1),Re(2)],[a4,a5],dx)
rayj = T(39.7)*rayi
plot([x2,x2+39.7],[rayi(1),rayj(1)],'g')
%extend the rays backwards by the same amount
rayk = T(-39.7)*rayi
plot([x2,x2-39.7],[rayi(1),rayk(1)],'g')


%draw bottom marginal ray
ray=[-24.5;0]
[rayF,x1,x2] = ray_trace(ray,Lo,[RObj(1),RObj(2)],[a1,aa],dx)
plot([-5,x1],[-24.5,ray(1)],'g')
[raye,x1,x2] = ray_trace(rayF,Td,[RObj(2),RDoub(1)],[aa,a2],dx)
[rayg,x1,x2] = ray_trace(raye,Ld,[RDoub(1),RDoub(2)],[a2,a3],dx)
[rayh,x1,x2] = ray_trace(rayg,Tm,[RDoub(2),Re(1)],[a3,a4],dx)
[rayi,x1,x2] = ray_trace(rayh,Reye,[Re(1),Re(2)],[a4,a5],dx)
rayj = T(39.7)*rayi
plot([x2,x2+39.7],[rayi(1),rayj(1)],'g')

%extend the rays backwards by the same amount
rayk = T(-39.7)*rayi
plot([x2,x2-39.7],[rayi(1),rayk(1)],'g')



%draw other rays
ray=[-24.5;0.01]
[rayF,x1,x2] = ray_trace(ray,Lo,[RObj(1),RObj(2)],[a1,aa],dx)
plot([-5,x1],[-24.5,ray(1)],'g')
[raye,x1,x2] = ray_trace(rayF,Td,[RObj(2),RDoub(1)],[aa,a2],dx)
[rayg,x1,x2] = ray_trace(raye,Ld,[RDoub(1),RDoub(2)],[a2,a3],dx)
[rayh,x1,x2] = ray_trace(rayg,Tm,[RDoub(2),Re(1)],[a3,a4],dx)
[rayi,x1,x2] = ray_trace(rayh,Reye,[Re(1),Re(2)],[a4,a5],dx)
rayj = T(39.7)*rayi
plot([x2,x2+39.7],[rayi(1),rayj(1)],'g')

%extend the rays backwards by the same amount
rayk = T(-39.7)*rayi
plot([x2,x2-39.7],[rayi(1),rayk(1)],'g')



%draw other rays
ray=[24.5;-0.01]
[rayF,x1,x2] = ray_trace(ray,Lo,[RObj(1),RObj(2)],[a1,aa],dx)
plot([-5,x1],[24.5,ray(1)],'g')
[raye,x1,x2] = ray_trace(rayF,Td,[RObj(2),RDoub(1)],[aa,a2],dx)
[rayg,x1,x2] = ray_trace(raye,Ld,[RDoub(1),RDoub(2)],[a2,a3],dx)
[rayh,x1,x2] = ray_trace(rayg,Tm,[RDoub(2),Re(1)],[a3,a4],dx)
[rayi,x1,x2] = ray_trace(rayh,Reye,[Re(1),Re(2)],[a4,a5],dx)
rayj = T(39.7)*rayi
plot([x2,x2+39.7],[rayi(1),rayj(1)],'g')

%extend the rays backwards by the same amount
rayk = T(-39.7)*rayi
plot([x2,x2-39.7],[rayi(1),rayk(1)],'g')








