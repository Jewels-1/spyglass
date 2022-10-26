function [raymatrix,z_front,z_optaxis,zmax] = plano_convex(n,radius,thickness,dz,y)
 power = (n-1)/radius; %lens power
 f = 1/power; %paraxial focal length
 zmax = floor(f+.1*f); %end of z-axis
 z_front = 0:dz:thickness-dz; %z-axis back of plane surface
 z_back = thickness:dz:zmax-dz; %z-axis front of plane surface
 z_optaxis = [z_front,z_back]; %total optical axis
 y(y==0)=10^-10;
 raymatrix = zeros(length(y),length(z_optaxis));

 %Ray tracing
 for i = 1:length(y)

 %Refraction at spherical surface
 [ray_lens, slope, x_lens] = sphere_refract_ray(y(i),radius,thickness,n,dz);
 %Refraction at plane surface
 [ray_air] = plane_refract_ray(ray_lens(end),slope,thickness,n,z_back);
 %Incoming ray
 x_front_air = 0:dz:x_lens(1)-dz;
 ray_front_air = y(i)*ones(1,length(x_front_air));
 %Create matrix of rays (adjust length if
 if length(ray_lens)+length(ray_air)+length(x_front_air) <= length(z_optaxis)
 raymatrix(i,:) = [ray_front_air,ray_lens,ray_air];
 else
 raymatrix(i,:) = [ray_front_air, ray_lens(1:length(ray_lens)-1), ray_air];
 end
 end
end