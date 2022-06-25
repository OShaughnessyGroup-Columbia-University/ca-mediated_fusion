function[rhostar]=calculate_rhostar(gamma0,kdelta,kbar,Aves,W,Ahd,epsiloncat,H,Htot)



gamma=[0:gamma0/1000:gamma0];

for i=1:1000
    
    
    %g(i)=(gamma(i)-gamma0)/kbar - 1  + ( Aves * (1+16*(2*w/gamma0)^2)  * ( 2 -  Ahd/(Aves*(1+16*(2*w/gamma(i))^2)) )  +  H  - Ahd  )  /  (2*(Aves*(1+16*(2*w/gamma(i))^2)) - Ahd)
    
    g(i)= (gamma(i) - gamma0)/kbar - 1 +  (  Aves * (1+16*(2*W/gamma(i))^2) + (H/Htot - 0.5) * Ahd  )  /  (  Aves*(1+16*(2*W/gamma(i))^2) - Ahd/2  ) ;
    
end

[p,n]=min(abs(g));


tension=gamma(n);


rhostar= tension / (2 * kdelta) + epsiloncat;