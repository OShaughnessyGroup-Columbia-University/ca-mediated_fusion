tau=1e-4;
Aves0=1200;

x=t;
xi = 0:tau:30; 



y=gamma;
yi = interp1(x,y,xi); 
gamma=yi;

y=Ahd;
yi = interp1(x,y,xi); 
Ahd=yi;

Aves=Aves0-Ahd;
gammahd=2*gamma*cos(asin((2*(Ahd./Aves0)^.5)));
