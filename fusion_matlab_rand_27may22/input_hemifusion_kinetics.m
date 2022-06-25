% this is the input file for calculating hemifusion kinetics for two spheres, symmetry not assumed


% physical parameters

%
%R1=12.6;
R2=R1;

% joerg area-weighted average ves radius for 6 mM
%  R1=12.6;


% joerg area-weighted average ves radius for 2 mM
%  R1=9.0;

%R1=8.1;
%R2=8.4;


%R1=11.1;
%R2=16.1;

%R1=5.8;  %recall the most asymmetric pair was fit for different D, gamma_0
%R2=20;



Aves1=4*pi*R1^2;
Aves2=4*pi*R2^2;
Aves0=4*pi*R1^2;


%D=16.25;  % best fit for original submission
D=11.03*1.05;  %trial 1, resubmission, 10jun10
%D=1.0;

kdelta=19;
kbar=265;
% kdelta=20;
% kbar=265;

% .1 mM
%epsiloncat=0.033;
%gamma0=5.0;

%  2 mM
%epsiloncat=0.058;
%gamma0=7.7;


%  4 mM
%epsiloncat=0.064;
%gamma0=8.3;

%  6 mM
%epsiloncat=0.067;
%gamma0=8.7;

%  10 mM
%epsiloncat=0.071;
%gamma0=9.2;

W=1.1;
%W=0.01;






rhostar1=gamma0/(2*kdelta)+epsiloncat;
rhostar2=gamma0/(2*kdelta)+epsiloncat;



% simulation parameters

%rounds number of elements to change with R1 keeping actual grid size
%constant

%N1=200;
N1=round(1000*R1/11.1);
n1=N1;

% N2,n2 to be determined in 'determine_mesh'

%m=10;  %m=270 was used original submission
%m=500;  used for 3nov10 fusion calculations
%m=350;
%m=floor(N1/2)-1;

w=45;


%tau and d will be deleted
tau=0.000001*R1^2/D;
d=D*tau/(2*R1^2);


% vectors and matrices


rho1=zeros(n1,1);
rho1(n1)=rhostar1;

x1=zeros(n1,1);

phi1=zeros(n1,1);

delta1=zeros(n1,1);


Ahd=zeros(m+1,1);
t=zeros(m+1,1);

rho_matrix=zeros(n1,m);

