% determines mesh size and grading for each vesicle

n=n1;
N=N1;

x=zeros(n,1);
phi=zeros(n,1);
delta=zeros(n,1);




% vesicle 1

x_min=0.0*pi;
x_max=1.0*pi;



% finest mesh spacing, near HD

delta_start=(x_max-x_min)/(1*(n-1));

%delta_start=(x_max-x_min)/(10*n);


% determine point where grading begins


i_end=1;
%i_end=n1-2*m;

%i_end=round(n1/10);

% angle at which grading begins determined by i_end
x_end=x_max-(N-i_end)*delta_start;


% first determine the incremental increase in delta, delta_delta

sum_shit=0;

for i=1:i_end-1
    
    sum_shit=sum_shit+i_end-i;
    
end


delta_delta=(x_end - x_min - delta_start*(i_end-1))/sum_shit;




% then fill in x

x(1)=x_min;
    
    x(2)=x_min + delta_start + delta_delta*(i_end - 1);    
    
for i=3:i_end
    
    x(i)=x(i-1)+(x(i-1)-x(i-2))-delta_delta;
    
end


for i=i_end+1:n
    
    x(i)=x(i-1)+delta_start;
    
end



% end mesh determination


% determine phi and delta, to be used in diff. equ.


for i=2:n
    
    phi(i)=cos(x(i))/sin(x(i));
    delta(i-1)=x(i)-x(i-1);
    
end


% fill in for vesicle 1

x1=x;
phi1=phi;
delta1=delta;


% fill in for vesicle 2


n2= n1 + round((pi-R1/R2*x1(n1))/(delta1(n1-1) * R1/R2));

delta_delta=(pi-R1/R2*x1(n1))/(n2-n1);

delta2=zeros(n2,1);
x2=zeros(n2,1);
phi2=zeros(n2,1);

for i=1:n1-1
    
    delta2(i)=delta1(i)*R1/R2;
    
end

for i=n1:n2-1
    
    delta2(i)=delta_delta;
    
end


x2(1)=0;

for i=2:n2
    
    x2(i)=x2(i-1)+delta2(i-1);
    phi2(i)=cos(x2(i))/sin(x2(i));
    
end


rho2=zeros(n2,1);
rho2(n2)=rhostar2;
