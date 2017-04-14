clear all; clc
n=100;
c=0.2;
s=sqrt(1-c^2);
%% constract T_100(c)
lin=[0:n-1];
D=diag(s.^lin);
A=triu(-c*ones(n,n),1);
A=A+diag(ones(n,1));
T=D*A;
%% Classical GS
[Q,R]=CGS(T);
%% Answer1,2
disp('For classical GS, R-T=')
sparse(R-T)
s=istriu(T);
if s==1
    disp(' T is also upper triangular matrix ')
else
    disp(' T is not a upper triangular matrix ')
end    
%% modification
P=eye(n);
c1=P(2,:);
c2=P(5,:);
P(2,:)=c2;
P(5,:)=c1;
T2=T*P;
%% MGS
[Q2,R2]=MGS(T2);
