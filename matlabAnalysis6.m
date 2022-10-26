%living script used for analysis. 

%declare lens matrices as anon fcns
T = @(d) [1,d;0,1];
R = @(n,r) [1,0; -(n(2)-n(1))/(r*n(2)), n(1)/n(2)];

%n = [n_initial, n_final]
%Objective convex lens parameters b
RObj(1) = 227.16;
RObj(2) = -174.83;
nObj(1) = 1;
nObj(2) = 1.5667;
tObj = 8;
ra = 24.5
%distance between surfaces of doublet
dDoub = 0.01; %glue layer thickness unknown
ng =  1.56;

%Objective doublet lens params
RDoub(1) = -174.83;
RDoub(2)= -571.49;
nDoub(1) =  1.7283;
tDoub = 4;

%crown
Lo = R([1.56,1.7283],RObj(2))*T(tObj)*R([1,1.5667],RObj(1)); 

%flint
Ld = R([1.7283,1],RDoub(2))*T(tDoub)*R([1.56,1.7283],RDoub(1)); 

%distance to eyepiece lens
dT = 344.243-39.7;%500.00-25; 

%travel matrix
Td = T(dDoub);

%eyepiece lens params
Re(1) = -41.520;
Re(2) = 41.520;
te = 2;
ne(1) = 1;
ne(2) =  1.51633;
re = 12.7; %eyepiece semi-diameter
Reye =  R(flip(ne),Re(2))*T(te)*R(ne,Re(1))
e
Tm = T(dT);

%Compute system matrix M
M = Reye*Tm*Ld*Td*Lo


%Entrance aperture clear semi-diameter
yi = 24.5
theta_i1 = 0;
theta_i2 = (pi/180)*5;

m_o1 = Ld*Td*Lo*[yi;theta_i1] 
m_o2 = Ld*Td*Lo*[yi;theta_i2] 

%translate to eyepiece

m_o3 = Td*m_o1
m_o4 = Td*m_o2

%inverse of matrix to find max height in entrance aperture
S_inv = Ld*Td*Lo^-1
y_max = 12.7;
max_height_at_entrance_aperture = S_inv*[12.7;0]

%test

T(dT)*Ld*Td*Lo*[15;0]

%swep through input angles and 

%find ray height at eyepiece as a function of input angle incident at
%entrance aperture edge
theta = [0.1:6]*pi/180;
for i=1:length(theta)
    OutNeg(:,i) = T(dT)*Ld*Td*Lo*[ra;-theta(i)];
    
end


for i=1:length(theta)
    OutPos(:,i) = T(dT)*Ld*Td*Lo*[-ra;theta(i)];
    
end

%section of code allows output to be set to 0 if ray is vignetted
% for i= 1:length(theta)
%     if abs(Out(1,i)) > re %if output height is larger than eyepiece diameter, the ray is vignetted
%         Out(1,i) = 0;
%     end
% end

figure
hold on
plot(-theta*180/pi,OutNeg(1,:))
plot(theta*180/pi,OutPos(1,:))
line(-theta*180/pi,-re*ones(length(OutNeg(1,:))))
line(theta*180/pi,re*ones(length(OutNeg(1,:))))
hold on
title('Ray Height at Eyepiece as a function of angle of incidence on Entrance Aperture Edge')
xlabel('Angle of incidence at objective lens')
ylabel('Ray Height at Eyepice')

%Calculations to determine if the FoV is an appropriate size for viewing a 2m object
%600m away 

%angular span of 2m object 600m away is given by:
-atan(2000/600000)

%Determine if the extremal rays of 2 m Object at 600m away make it into the
%eyepiece
Reye*T(dT)*Ld*Td*Lo*T(600000)*[2000;-atan((2000)/600000)]
Reye*T(dT)*Ld*Td*Lo*T(600000)*[2;atan((ra)/600000)]

Reye*T(dT)*Ld*Td*Lo*T(600000)*[2;atan((2-ra)/600000)]
Reye*T(dT)*Ld*Td*Lo*T(600000)*[2;atan((2+ra)/600000)]

Reye*T(dT)*Ld*Td*Lo*T(600000)*[2;atan(ra/600000)]

T(dT)*Ld*Td*Lo*T(600000)*[0;atan((ra)/600000)]


%Determine the location of the exit pupil by 

Ep(:,1) = Reye*T(dT)*[24.5;atan(-(24.5-12.7)/(dT))]
Ep(:,2) = Reye*T(dT)*[24.5;atan(-(24.5-5)/(dT))]
Ep(:,3) = Reye*T(dT)*[24.5;atan(-(24.5-2)/(dT))]
Ep(:,4) = Reye*T(dT)*[24.5;atan(-(24.5-8)/(dT))]
(Ep(1,1)-Ep(1,2))/(Ep(2,1)-Ep(2,2))
(Ep(1,2)-Ep(1,3))/(Ep(2,2)-Ep(2,3))
(Ep(1,3)-Ep(1,4))/(Ep(2,3)-Ep(2,4))

MagAng = M(2,2);

%D_ex = 

%Some back of the enveloppe calculations

%compare with thin lenses for sanity check

fd = 350;
fe = -39.7; 
Ldp = [1,0;-1/fd,1]
Lep = [1,0;-1/fe,1]


Mp = Lep*T(350-39.7)*Ldp

2*ra/Mp(2,2)

350/(24.5*2)



