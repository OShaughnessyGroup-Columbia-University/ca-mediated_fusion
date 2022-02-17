%gamma=[8 7 6 5];
%t=[0 1 2 3];
%Ahd=[0 .5 .75 1];

%load hemifusion_data

%hemifusion_data=hemifusion_data_2mM;

x=hemifusion_data(:,1);
xi = 0:tau:maxtime; 
t=xi;

y=hemifusion_data(:,2);
yi = interp1(x,y,xi); 
Ahd=yi;

y=hemifusion_data(:,3);
yi = interp1(x,y,xi); 
gamma=yi;

y=hemifusion_data(:,4);
yi = interp1(x,y,xi); 
gammahd=yi;

y=hemifusion_data(:,5);
yi = interp1(x,y,xi); 
Aflat=yi;

y=hemifusion_data(:,6);
yi = interp1(x,y,xi); 
theta=yi;

y=hemifusion_data(:,7);
yi = interp1(x,y,xi); 
Avestotal=yi;

y=hemifusion_data(:,8);
yi = interp1(x,y,xi); 
Aves=yi;

y=hemifusion_data(:,9);
yi = interp1(x,y,xi); 
volume=yi;

hootie=length(gamma);

%original section before running into problems with leak rate apparently
%ignoring adhesion buffering of tension
for i=2:length(gamma)-1
    
    if gamma(i+1)-gamma(i)>-0.0001
       gamma(i)=gamma(i-1)*exp(-(t(i)-t(i-1))/tauleak);
       gammahd(i)=gammahd(i-1)*exp(-(t(i)-t(i-1))/tauleak);
       %volume(i)=volume(i-1)- kleak * 8 * pi * R0 * gamma(i)*(t(i)-t(i-1));
    end
    
    volume(i)=volume(i-1)- kleak * 8 * pi * R0 * gamma(i)*(t(i)-t(i-1));
    
end

%function[rhostar,tension,Aflat,theta,A,Aves]=calculate_rhostar_strong_adhesion(gamma0,kdelta,kbar,Aves0,Ahd,epsiloncat,Wvv,volume)


for i=2:length(gamma)-1
    
%volume=4/3*3.14*R0^3;
    [rhostar1,gamma(i+1),Aflat(i+1),theta(i+1),Avestotal(i+1),Aves(i+1)]=calculate_rhostar_strong_adhesion(gamma0,kdelta,kbar,Aves1,Ahd(i+1),epsiloncat,Wvv,volume(i));
   % should above say gamm(i+1) or tension(i+1) as originally stated?
end


gammahd=2*gamma.*cos(theta);

gamma(hootie-2)=gamma(hootie-3);
gamma(hootie-1)=gamma(hootie-3);
gamma(hootie)=gamma(hootie-3);

gammahd(hootie-2)=gammahd(hootie-3);
gammahd(hootie-1)=gammahd(hootie-3);
gammahd(hootie)=gammahd(hootie-3);
