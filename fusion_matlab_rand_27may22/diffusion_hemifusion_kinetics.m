function[rho_new]=diffusion_hemifusion_kinetics(rho_old,n,delta,phi,d)


%rho_old=rho;

% fill A matrix
A=zeros(n,n);
A(1,1)=-1;
A(1,2)=1;
A(n,n)=1;
for j=2:n-1
   
        A(j,j-1)= -d * delta(j)/delta(j-1);
        A(j,j)= delta(j)*0.5*(delta(j)+delta(j-1)) + d * phi(j) * 0.5*(delta(j)+delta(j-1)) + d + d*delta(j)/delta(j-1);
        A(j,j+1)= -d * phi(j) * 0.5*(delta(j)+delta(j-1)) - d;
           
end
       
       
% fill in B matrix
B=zeros(n,n);
B(n,n)=1;
for j=2:n-1
   
        B(j,j-1)= d * delta(j)/delta(j-1);
        B(j,j)= -1*(-1*delta(j)*0.5*(delta(j)+delta(j-1)) + d * phi(j) * 0.5*(delta(j)+delta(j-1)) + d + d*delta(j)/delta(j-1));
        B(j,j+1)= d * phi(j) * 0.5*(delta(j)+delta(j-1)) + d;
           
end
 

   
% C matrix is the matrix product of B matrix and old rho vector

C=B*rho_old;
rho_new=A\C;


