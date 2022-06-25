% below matrices and parameters will be given in main_fusion_kinetics later
m=5;
gamma=[8 7 6 5 4];
t=[0 1 2 3 4];
Ahd=[0 .5 .75 1 1.5];

S=ones(4,m);

Sves0=S(k,1);
Svesstar=S(k,2);
Shd0=S(k,3);
Shdstar=S(k,4);

tau=1e-4;
Aves0=1200;
Aevans=1200;
sigmadelta=4;
sigmac=102;
v0delta=0.22;
rvesstar=v0delta*1;
vdeltac=3e6;

k=1;


% first calculate coefficients


kvesstar=Aves(k)/Aevans*v0delta*exp(gamma(k)/sigmadelta);
khdstar=Ahd(k)/Aevans*v0delta*exp(gammahd(k)/sigmadelta);

kvesrup=vdeltac*(gamma(k)/sigmac)^.5*exp(-sigmac/gamma(k));
khdrup=vdeltac*(gammahd(k)/sigmac)^.5*exp(-sigmac/gammahd(k));

rvesstar=v0delta;
rhdstar=v0delta;


% fill in matrix B

B=zeros(4,4);

B(1,1)=-kvesstar;
B(1,2)=rvesstar;
B(1,4)=-Sves0(k)/(Sves0+Svesstar)*khdrup;

B(2,1)=kvesstar;
B(2,2)=-rvesstar-kvesrup;
B(2,4)=-Svesstar/(Sves0+Svesstar)*khdrup;

B(3,2)=-Shd0/(Shd0+Shdstar)*kvesrup;
B(3,3)=-khdstar;
B(3,4)=rhdstar;

B(4,2)=-Shdstar/(Shd0+Shdstar)*kvesrup;
B(4,3)=+khdstar;
B(4,4)=-rhdstar-khdrup;


diagonal=zeros(4,4);
diagonal(1,1)=1;
diagonal(2,2)=1;
diagonal(3,3)=1;
diagonal(4,4)=1;

Btwiddle=diagonal-B*tau/2;
S(:,k+1)=inv(Btwiddle)*((diagonal+B*tau/2)*S(:,k));


